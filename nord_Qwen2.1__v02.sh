#!/bin/bash

echo "Qwen-Image 2.1 Master Provisioning Script inditasa."

# Abszolut eleresi utak deffinialasa a stabil gyari kornyezethez
PIP_EXEC="/venv/main/bin/pip"

# Sikertelen lepesek gyujtoje - a script vegen ezt irjuk ki osszefoglalasnak
FAILURES_LOG="/workspace/provisioning_failures.log"
mkdir -p /workspace
> "$FAILURES_LOG"

# ============================================================
# WATCHDOG FUGGVENY
# Barmilyen parancsot korbeoleli egy hard wall-clock timeout-tal,
# es ha lejar az ido VAGY a parancs hibakoddal ter vissza, ujraprobalja.
# Vegso soron, ha minden probalkozas elhasal, NEM allitja meg a
# scriptet - naploz egy hibat, es megy tovabb a kovetkezo lepesre.
#
# Hasznalat: run_with_watchdog "<nev a naplohoz>" <timeout_masodperc> <max_probalkozas> <parancs...>
# ============================================================
run_with_watchdog() {
    local name="$1"; local timeout_s="$2"; local max_tries="$3"; shift 3
    local attempt=1
    while [ "$attempt" -le "$max_tries" ]; do
        echo ">>> [$name] ${attempt}/${max_tries}. probalkozas (timeout: ${timeout_s}s)..."
        if timeout "$timeout_s" "$@"; then
            echo ">>> [$name] OK."
            return 0
        else
            echo ">>> [$name] hiba vagy idotullepes - ujraprobalkozas 15 mp mulva..."
            attempt=$((attempt + 1))
            sleep 15
        fi
    done
    echo "!!! [$name] VEGLEGESEN SIKERTELEN ${max_tries} probalkozas utan!"
    echo "[$name] SIKERTELEN" >> "$FAILURES_LOG"
    return 1
}

# 1. Alap csomagok telepitese (aria2)
run_with_watchdog "apt-get update" 300 3 apt-get update -y
run_with_watchdog "aria2 telepites" 300 3 apt-get install -y aria2

# --- HuggingFace kliens beallitasa ---
# A Xet-alapu letoltes egy ismert, dokumentalt HF-hiba miatt gyakran
# lefagy 99-100%-on nagy repok/fajlok eseten (l. huggingface_hub #3580,
# xet-core #409, #789). A HF_HUB_DISABLE_XET=1 visszakapcsol a regi,
# egyszeru HTTP/resumable letoltesre, ami stabilabb rossz/ingadozo
# halozati kornyezetben (pl. altalanos vast.ai gepek).
export HF_HUB_DISABLE_XET=1

# Friss huggingface_hub biztositasa (ez adja a "hf" parancsot is)
run_with_watchdog "huggingface_hub frissites" 300 3 $PIP_EXEC install -U huggingface_hub

# 2. Szukseges mappak elokeszitese
mkdir -p /workspace/ComfyUI/custom_nodes
mkdir -p /workspace/ComfyUI/models/checkpoints
mkdir -p /workspace/ComfyUI/models/unet
mkdir -p /workspace/ComfyUI/models/diffusion_models
mkdir -p /workspace/ComfyUI/models/loras
mkdir -p /workspace/ComfyUI/models/vae
mkdir -p /workspace/ComfyUI/models/text_encoders
mkdir -p /workspace/ComfyUI/models/upscale_models
mkdir -p /workspace/ComfyUI/models/model_patches

# 3. Custom Node-ok letoltese es fuggosegek telepitese
echo "ComfyUI Custom Node-ok letoltese..."
cd /workspace/ComfyUI/custom_nodes

CUSTOM_NODES=(
    "https://github.com/spacepxl/ComfyUI-VAE-Utils"
    "https://github.com/lquesada/ComfyUI-Inpaint-CropAndStitch"
    "https://github.com/scraed/LanPaint"
    "https://github.com/numz/ComfyUI-SeedVR2_VideoUpscaler"
    "https://github.com/PozzettiAndrea/ComfyUI-DepthAnythingV3"
    "https://github.com/Blakeem/ComfyUI-ContextAnchoredTileRefine"
    "https://github.com/ltdrdata/ComfyUI-Impact-Subpack"
    "https://github.com/cubiq/ComfyUI_essentials"
    "https://github.com/city96/ComfyUI-GGUF"
    "https://github.com/ClownsharkBatwing/RES4LYF"
    "https://github.com/pythongosssss/ComfyUI-Custom-Scripts"
    "https://github.com/mcmonkeyprojects/sd-dynamic-thresholding"
    "https://github.com/kijai/ComfyUI-KJNodes"
    "https://github.com/talesofai/comfyui-browser"
    "https://github.com/rgthree/rgthree-comfy"
    "https://github.com/yolain/ComfyUI-Easy-Use"
    "https://github.com/willmiao/ComfyUI-Lora-Manager"
    "https://github.com/PowerHouseMan/ComfyUI-AdvancedLivePortrait"
    "https://github.com/Acly/comfyui-inpaint-nodes"
    "https://github.com/WASasquatch/was-node-suite-comfyui"
    "https://github.com/Fannovel16/comfyui_controlnet_aux"
    "https://github.com/TinyTerra/ComfyUI_tinyterraNodes"
    "https://github.com/sipherxyz/comfyui-art-venture"
    "https://github.com/wallish77/wlsh_nodes"
    "https://github.com/crystian/ComfyUI-Crystools"
    "https://github.com/ssitu/ComfyUI_UltimateSDUpscale"
    "https://github.com/chrisgoringe/cg-use-everywhere"
    "https://github.com/ltdrdata/ComfyUI-Impact-Pack"
    "https://github.com/TheLustriVA/ComfyUI-Image-Size-Tools"
    "https://github.com/gseth/ControlAltAI-Nodes"
)

for repo in "${CUSTOM_NODES[@]}"; do
    repo_name=$(basename "$repo" .git)

    if [ -d "$repo_name" ]; then
        echo "Mar letezik: ${repo_name} - klonozas kihagyva."
    else
        run_with_watchdog "${repo_name} klonozasa" 300 3 git clone --depth 1 "$repo"
    fi

    if [ -f "${repo_name}/requirements.txt" ]; then
        echo "Fuggosegek telepitese a kovetkezohoz: ${repo_name}"
        run_with_watchdog "${repo_name} fuggosegei" 300 2 $PIP_EXEC install -r "${repo_name}/requirements.txt"
    fi
done

# 4. Kritikus Python csomagok kezi telepitese
echo "Kritikus csomagok ellenorzese es telepitese..."
run_with_watchdog "kritikus pip csomagok" 300 3 $PIP_EXEC install opencv-python-headless piexif numba deepdiff gguf

# 5. QWEN_2.1_Loras sajat HuggingFace repobol
# -------------------------------------------------------------
# SZELEKTIV LETOLTES: a LORA_SUBFOLDERS env valtozoban felsorolt
# al-mappakat (szokozzel elvalasztva) tolti csak le, a repo-n
# beluli mappastruktura megmarad a models/loras alatt is.
#
# Pelda (ezt a vast.ai template "Environment Variables" reszeben,
# vagy a CLI parancsban -e LORA_SUBFOLDERS="..." formaban add meg):
#   LORA_SUBFOLDERS="ConceptArt VideoGameCharacters"
#
# Ha a valtozo ures / nincs beallitva, a TELJES repo letoltodik
# (ez a regi viselkedes - visszafele kompatibilis).
# -------------------------------------------------------------
echo "Sajat Qwen-Image 2.1 LoRak szinkronizalasa..."
if [ -n "$LORA_SUBFOLDERS" ]; then
    LORA_INCLUDE_ARGS=()
    for folder in $LORA_SUBFOLDERS; do
        echo "  -> csak ez az al-mappa lesz letoltve: ${folder}/*"
        LORA_INCLUDE_ARGS+=(--include "${folder}/*")
    done
    run_with_watchdog "QWEN_2.1_Loras (HF, szelektiv: ${LORA_SUBFOLDERS})" 3600 6 \
        hf download NorbyQWEN/QWEN_2.1_Loras "${LORA_INCLUDE_ARGS[@]}" --local-dir /workspace/ComfyUI/models/loras
else
    echo "  -> LORA_SUBFOLDERS nincs beallitva, a TELJES Loras repo letoltodik."
    run_with_watchdog "QWEN_2.1_Loras (HF, teljes)" 3600 6 \
        hf download NorbyQWEN/QWEN_2.1_Loras --local-dir /workspace/ComfyUI/models/loras
fi

# 6. QWEN_2.1_diffusion_models sajat HuggingFace repobol
# -------------------------------------------------------------
# Ugyanez a szelektiv logika, ha a diffusion_models repo is
# al-mappakba van rendezve nalad. Kulon env valtozo:
#   DIFFUSION_SUBFOLDERS="Turbo Base"
# -------------------------------------------------------------
echo "Sajat Qwen-Image 2.1 diffusion_models szinkronizalasa..."
if [ -n "$DIFFUSION_SUBFOLDERS" ]; then
    DIFF_INCLUDE_ARGS=()
    for folder in $DIFFUSION_SUBFOLDERS; do
        echo "  -> csak ez az al-mappa lesz letoltve: ${folder}/*"
        DIFF_INCLUDE_ARGS+=(--include "${folder}/*")
    done
    run_with_watchdog "QWEN_2.1_diffusion_models (HF, szelektiv: ${DIFFUSION_SUBFOLDERS})" 3600 6 \
        hf download NorbyQWEN/QWEN_2.1_diffusion_models "${DIFF_INCLUDE_ARGS[@]}" --local-dir /workspace/ComfyUI/models/diffusion_models
else
    echo "  -> DIFFUSION_SUBFOLDERS nincs beallitva, a TELJES diffusion_models repo letoltodik."
    run_with_watchdog "QWEN_2.1_diffusion_models (HF, teljes)" 3600 6 \
        hf download NorbyQWEN/QWEN_2.1_diffusion_models --local-dir /workspace/ComfyUI/models/diffusion_models
fi

# 7. ESRGAN (Upscaler) modellek letoltese
echo "ESRGAN upscaler modellek letoltese..."
run_with_watchdog "ESRGAN safetensors" 900 3 aria2c -x 16 -s 16 -k 10M -c --dir="/workspace/ComfyUI/models/upscale_models" "https://huggingface.co/Phips/4xNomosWebPhoto_RealPLKSR/resolve/main/4xNomosWebPhoto_RealPLKSR.safetensors"
run_with_watchdog "ESRGAN pth" 900 3 aria2c -x 16 -s 16 -k 10M -c --dir="/workspace/ComfyUI/models/upscale_models" "https://github.com/Phhofm/models/releases/download/4xNomosWebPhoto_RealPLKSR/4xNomosWebPhoto_RealPLKSR.pth"

# 8. VAE es Text Encoderek szinkronizalasa HuggingFace-rol
echo "HuggingFace konyvtarak szinkronizalasa a VAE es Text Encoderek szamara..."
# A Qwen-Image 2.1 text encoderei (qwen3vl 8B, qwen3.5 9B) jóval nagyobbak,
# mint a Krea2-e, ezert itt hosszabb a timeout es tobb a probalkozas.
# Az idotullepes nem veszit el adatot: a "hf download" a kovetkezo
# probalkozasnal onnan folytatja, ahol abbamaradt.
run_with_watchdog "QWEN_2.1_VAE (HF)" 1800 4 hf download NorbyQWEN/QWEN_2.1_VAE --local-dir /workspace/ComfyUI/models/vae
run_with_watchdog "QWEN_2.1_text_encoders (HF)" 3600 6 hf download NorbyQWEN/QWEN_2.1_text_encoders --local-dir /workspace/ComfyUI/models/text_encoders

# 9. ControlNet (model_patches) szinkronizalasa HuggingFace-rol
# A Qwen-Image 2.1 Fun ControlNet Union fajljai a models/model_patches
# mappaba kerulnek (nem a models/controlnet-be!).
echo "HuggingFace konyvtar szinkronizalasa a ControlNet (model_patches) szamara..."
run_with_watchdog "QWEN_2.1_ControlNet_Model_Patch (HF)" 1800 4 hf download NorbyQWEN/QWEN_2.1_ControlNet_Model_Patch --local-dir /workspace/ComfyUI/models/model_patches

# ============================================================
# OSSZEFOGLALO - ez az elso dolog, amit erdemes megnezni a log vegen
# ============================================================
echo ""
echo "================================================="
if [ -s "$FAILURES_LOG" ]; then
    echo "FIGYELEM - a kovetkezo lepesek VEGLEGESEN sikertelenek voltak:"
    cat "$FAILURES_LOG"
    echo "Ezeket erdemes kezzel ujra lefuttatni / ellenorizni."
else
    echo "Minden lepes sikeresen lezajlott, nincs hiba a naploban."
fi
echo "================================================="
echo "A ComfyUI kornyezet felepitve! A rendszer indul."
