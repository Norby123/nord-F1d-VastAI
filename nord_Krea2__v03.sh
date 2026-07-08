#!/bin/bash

echo "Krea 2 Master Provisioning Script inditasa..."

# Rendszer szintü Python es HuggingFace eleresi utvonalak deffinialasa
PIP_EXEC="/venv/main/bin/pip"
HF_EXEC="/venv/main/bin/huggingface-cli"

# 1. Alap csomagok telepitese
apt-get update -y
apt-get install -y aria2

# 2. ComfyUI frissitese a legujabb verziora (Force Update)
echo "ComfyUI frissitese..."
cd /workspace/ComfyUI
git checkout master
git pull origin master

# 3. Szukseges mappak elokeszitese
mkdir -p /workspace/ComfyUI/custom_nodes
mkdir -p /workspace/ComfyUI/models/checkpoints
mkdir -p /workspace/ComfyUI/models/unet
mkdir -p /workspace/ComfyUI/models/loras
mkdir -p /workspace/ComfyUI/models/vae
mkdir -p /workspace/ComfyUI/models/text_encoders
mkdir -p /workspace/ComfyUI/models/upscale_models

# 4. Custom Node-ok letoltese ES fuggosegeik okos telepitese
echo "Custom Node-ok klonozasa es fuggosegek telepitese..."
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

# 5. Krea 2 Base Modellek (Checkpoints) letoltese
echo "Krea 2 alapmodellek letoltese Civitai-rol..."
KREA_BASES=(
    "3072329" # Krea 2 Raw (fp8)
    "3072332" # Krea 2 Turbo (bf16)
    "3086841" # RedCraft (fp8)
    "3100032" # Moody Mix (fp8)
    "3107017" # DaSiWa merge turbo (bf16)
)
for model_id in "${KREA_BASES[@]}"; do
    aria2c -x 16 -s 16 -k 10M -c --content-disposition \
    --dir="/workspace/ComfyUI/models/checkpoints" \
    "https://civitai.com/api/download/models/${model_id}?token=${CIVITAI_TOKEN}"
done

# 6. Krea 2 UNET (GGUF) letoltese
echo "GGUF modell letoltese..."
aria2c -x 16 -s 16 -k 10M -c --content-disposition \
--dir="/workspace/ComfyUI/models/unet" \
"https://civitai.com/api/download/models/3081077?token=${CIVITAI_TOKEN}" # Moody Krea 2 GGUF

# 7. Krea 2 LoRas letoltese
echo "Krea 2 LoRas letoltese Civitai-rol..."
KREA_LORAS=(
    # BF16 LoRas
    "3096720" "3096079" "3096306" "3096446" "3096520" "3097602" "3097648" 
    "3094227" "3099251" "3099687" "3099491" "3101703" "3101765" "3101894" 
    "3102368" "3102434" "3102501" "3102544" "3102762" "3102958" "3103736" 
    "3105347" "3091425" "3105299" "3106009" "3102816" "3106700" "3108389" 
    "3108428" "3108946" "3108965" "3109106" "3109676" "3109897" "3110064"
    # FP16 LoRas
    "3103036" "3103914"
    # FP32 LoRas
    "3105871" "3106528"
)
for lora_id in "${KREA_LORAS[@]}"; do
    aria2c -x 16 -s 16 -k 10M -c --content-disposition \
    --dir="/workspace/ComfyUI/models/loras" \
    "https://civitai.com/api/download/models/${lora_id}?token=${CIVITAI_TOKEN}"
done

# 8. ESRGAN (Upscaler) modellek letoltese
echo "ESRGAN upscaler modellek letoltese..."
aria2c -x 16 -s 16 -k 10M -c --dir="/workspace/ComfyUI/models/upscale_models" "https://huggingface.co/Phips/4xNomosWebPhoto_RealPLKSR/resolve/main/4xNomosWebPhoto_RealPLKSR.safetensors"
aria2c -x 16 -s 16 -k 10M -c --dir="/workspace/ComfyUI/models/upscale_models" "https://github.com/Phhofm/models/releases/download/4xNomosWebPhoto_RealPLKSR/4xNomosWebPhoto_RealPLKSR.pth"

# 9. HuggingFace repok letoltese a kijavitott CLI utvonallal
echo "HuggingFace konyvtarak szinkronizalasa..."
$HF_EXEC download NorbyQWEN/Krea2_VAE --cache-dir /workspace/.cache --local-dir /workspace/ComfyUI/models/vae --token $HF_TOKEN
$HF_EXEC download NorbyQWEN/Krea2_text_encoders --cache-dir /workspace/.cache --local-dir /workspace/ComfyUI/models/text_encoders --token $HF_TOKEN

echo "A ComfyUI kornyezet sikeresen felepitve! A rendszer indul."
