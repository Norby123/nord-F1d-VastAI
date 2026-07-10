#!/bin/bash

echo "Krea 2 Master Provisioning Script inditasa (v15 - watchdog + Xet fix)..."

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

# 3. Custom Node-ok letoltese es fuggosegek telepitese
echo "ComfyUI Custom Node-ok letoltese..."
cd /workspace/ComfyUI/custom_nodes

CUSTOM_NODES=(
    "https://github.com/spacepxl/ComfyUI-VAE-Utils"
    "https://github.com/city96/ComfyUI-GGUF"
    "https://github.com/pythongosssss/ComfyUI-Custom-Scripts"
    "https://github.com/mcmonkeyprojects/sd-dynamic-thresholding"
    "https://github.com/kijai/ComfyUI-KJNodes"
    "https://github.com/talesofai/comfyui-browser"
    "https://github.com/rgthree/rgthree-comfy"
    "https://github.com/yolain/ComfyUI-Easy-Use"
    "https://github.com/willmiao/ComfyUI-Lora-Manager"
    "https://github.com/PowerHouseMan/ComfyUI-AdvancedLivePortrait"
    "https://github.com/Acly/comfyui-inpaint-nodes"
    "https://github.com/logtd/ComfyUI-Fluxtapoz"
    "https://github.com/WASasquatch/was-node-suite-comfyui"
    "https://github.com/Fannovel16/comfyui_controlnet_aux"
    "https://github.com/TinyTerra/ComfyUI_tinyterraNodes"
    "https://github.com/cubiq/ComfyUI_IPAdapter_plus"
    "https://github.com/sipherxyz/comfyui-art-venture"
    "https://github.com/wallish77/wlsh_nodes"
    "https://github.com/crystian/ComfyUI-Crystools"
    "https://github.com/ssitu/ComfyUI_UltimateSDUpscale"
    "https://github.com/XLabs-AI/x-flux-comfyui"
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

# 5. Krea2_Loras sajat HuggingFace repobol
echo "Sajat Krea 2 LoRak szinkronizalasa..."
run_with_watchdog "Krea2_Loras (HF)" 2400 4 hf download NorbyQWEN/Krea2_Loras --local-dir /workspace/ComfyUI/models/loras

# 6. Krea2_diffusion_models sajat HuggingFace repobol
echo "Sajat Krea 2 diffusion_models szinkronizalasa..."
run_with_watchdog "Krea2_diffusion_models (HF)" 2400 4 hf download NorbyQWEN/Krea2_diffusion_models --local-dir /workspace/ComfyUI/models/diffusion_models

# 7. ESRGAN (Upscaler) modellek letoltese
echo "ESRGAN upscaler modellek letoltese..."
run_with_watchdog "ESRGAN safetensors" 900 3 aria2c -x 16 -s 16 -k 10M -c --dir="/workspace/ComfyUI/models/upscale_models" "https://huggingface.co/Phips/4xNomosWebPhoto_RealPLKSR/resolve/main/4xNomosWebPhoto_RealPLKSR.safetensors"
run_with_watchdog "ESRGAN pth" 900 3 aria2c -x 16 -s 16 -k 10M -c --dir="/workspace/ComfyUI/models/upscale_models" "https://github.com/Phhofm/models/releases/download/4xNomosWebPhoto_RealPLKSR/4xNomosWebPhoto_RealPLKSR.pth"

# 8. VAE es Text Encoderek szinkronizalasa HuggingFace-rol
echo "HuggingFace konyvtarak szinkronizalasa a VAE es Text Encoderek szamara..."
run_with_watchdog "Krea2_VAE (HF)" 900 3 hf download NorbyQWEN/Krea2_VAE --local-dir /workspace/ComfyUI/models/vae
run_with_watchdog "Krea2_text_encoders (HF)" 900 3 hf download NorbyQWEN/Krea2_text_encoders --local-dir /workspace/ComfyUI/models/text_encoders

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
