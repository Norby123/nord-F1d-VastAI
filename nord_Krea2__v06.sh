#!/bin/bash

echo "Krea 2 Master Provisioning Script inditasa..."

# Rendszer szintü Python eleresi utvonal deffinialasa
PIP_EXEC="/venv/main/bin/pip"

# A legbiztosabb hivas, fuggetlenul attol, hova telepiti a bin-t:
HF_EXEC="/venv/main/bin/python -m huggingface_hub.cli"

# 1. Alap csomagok ES a HuggingFace letolto telepitese
apt-get update -y
apt-get install -y aria2

echo "HuggingFace kliens es sebesseg-gyorsito (hf_transfer) telepitese..."
$PIP_EXEC install -U "huggingface_hub[cli]" hf_transfer

# Bekapcsoljuk a gigabites letoltest a HF-hez
export HF_HUB_ENABLE_HF_TRANSFER=1

# 2. ComfyUI frissitese a legujabb verziora (Force Update) - nem jo, mert a vast.ai-nak sajat cloud-gup comfy-ja van. Ez meg az eredetit szedne le. A gombon keresztul kell firssiteni.
#echo "ComfyUI frissitese..."
#cd /workspace/ComfyUI
#git checkout master
#git pull origin master

# 3. Szukseges mappak elokeszitese
mkdir -p /workspace/ComfyUI/custom_nodes
mkdir -p /workspace/ComfyUI/models/diffusion_models
mkdir -p /workspace/ComfyUI/models/unet
mkdir -p /workspace/ComfyUI/models/loras
mkdir -p /workspace/ComfyUI/models/vae
mkdir -p /workspace/ComfyUI/models/text_encoders
mkdir -p /workspace/ComfyUI/models/upscale_models

# 4. Custom Node-ok letoltese ES fuggosegeik okos telepitese
echo "Custom Node-ok klonozasa es fuggosegek telepitese..."
cd /workspace/ComfyUI/custom_nodes

CUSTOM_NODES=(
    "https://github.com/ostris/ComfyUI-Krea2-Ostris-Edit"
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
    # Leklonozza a node-ot
    git clone "$repo"
    
    # Kinyeri a mappa nevet a linkbol
    repo_name=$(basename "$repo" .git)
    
    # Ha letezik a mappa es benne a requirements.txt, akkor telepiti
    if [ -f "${repo_name}/requirements.txt" ]; then
        echo "Fuggosegek telepitese a kovetkezohoz: ${repo_name}"
        $PIP_EXEC install -r "${repo_name}/requirements.txt"
    fi
done

# 4.5. Kritikus Python csomagok kezi telepitese (A log alapjan)
echo "Kritikus csomagok ellenorzese es telepitese..."
$PIP_EXEC install opencv-python-headless piexif numba deepdiff gguf

# 5. Krea 2 Base Modellek (diffusion_models) letoltese
echo "Krea 2 alapmodellek letoltese Civitai-rol..."
KREA_BASES=(
#    "3072329" # Krea 2 Raw (fp8)
#    "3072332" # Krea 2 Turbo (bf16)
    "3086841" # RedCraft (fp8)
    "3100032" # Moody Mix (fp8)
    "3107017" # DaSiWa merge turbo (bf16)
)
for model_id in "${KREA_BASES[@]}"; do
    aria2c -x 16 -s 16 -k 10M -c --content-disposition \
    --dir="/workspace/ComfyUI/models/diffusion_models" \
    "https://civitai.com/api/download/models/${model_id}?token=${CIVITAI_TOKEN}"
done

# 6. Krea 2 UNET (GGUF) letoltese
echo "GGUF modell letoltese..."
aria2c -x 16 -s 16 -k 10M -c --content-disposition \
--dir="/workspace/ComfyUI/models/unet" \
"https://civitai.com/api/download/models/3081077?token=${CIVITAI_TOKEN}" # Moody Krea 2 GGUF

# 7. Krea 2 LoRas letoltese a sajat Hugging Face repobol
echo "Sajat Krea 2 LoRak szinkronizalasa..."
$HF_EXEC download NorbyQWEN/Krea2_Loras --cache-dir /workspace/.cache --local-dir /workspace/ComfyUI/models/loras --token $HF_TOKEN

# 7.5 Krea 2 CKPTs letoltese a sajat Hugging Face repobol
echo "Sajat Krea 2 CKPT szinkronizalasa..."
$HF_EXEC download NorbyQWEN/Krea2_ckpt --cache-dir /workspace/.cache --local-dir /workspace/ComfyUI/models/diffusion_models --token $HF_TOKEN

# 8. ESRGAN (Upscaler) modellek letoltese
echo "ESRGAN upscaler modellek letoltese..."
aria2c -x 16 -s 16 -k 10M -c --dir="/workspace/ComfyUI/models/upscale_models" "https://huggingface.co/Phips/4xNomosWebPhoto_RealPLKSR/resolve/main/4xNomosWebPhoto_RealPLKSR.safetensors"
aria2c -x 16 -s 16 -k 10M -c --dir="/workspace/ComfyUI/models/upscale_models" "https://github.com/Phhofm/models/releases/download/4xNomosWebPhoto_RealPLKSR/4xNomosWebPhoto_RealPLKSR.pth"

# 9. HuggingFace repok letoltese a kijavitott CLI utvonallal
echo "HuggingFace konyvtarak szinkronizalasa..."
$HF_EXEC download NorbyQWEN/Krea2_VAE --cache-dir /workspace/.cache --local-dir /workspace/ComfyUI/models/vae --token $HF_TOKEN
$HF_EXEC download NorbyQWEN/Krea2_text_encoders --cache-dir /workspace/.cache --local-dir /workspace/ComfyUI/models/text_encoders --token $HF_TOKEN

echo "A ComfyUI kornyezet sikeresen felepitve! A rendszer indul."