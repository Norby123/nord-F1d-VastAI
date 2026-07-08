#!/bin/bash

echo "Krea 2 Master Provisioning Script inditasa..."

# 1. Alap csomagok telepitese (aria2)
apt-get update -y
apt-get install -y aria2

# 2. Szukseges mappak elökeszitese (Abszolut utvonalakkal)
mkdir -p /workspace/ComfyUI/custom_nodes
mkdir -p /workspace/ComfyUI/models/checkpoints
mkdir -p /workspace/ComfyUI/models/unet
mkdir -p /workspace/ComfyUI/models/loras
mkdir -p /workspace/ComfyUI/models/vae
mkdir -p /workspace/ComfyUI/models/text_encoders
mkdir -p /workspace/ComfyUI/models/upscale_models

# 3. Custom Node-ok letoltese
echo "ComfyUI Custom Node-ok letoltese..."
cd /workspace/ComfyUI/custom_nodes
git clone https://github.com/spacepxl/ComfyUI-VAE-Utils
git clone https://github.com/city96/ComfyUI-GGUF
git clone https://github.com/pythongosssss/ComfyUI-Custom-Scripts
git clone https://github.com/mcmonkeyprojects/sd-dynamic-thresholding
git clone https://github.com/kijai/ComfyUI-KJNodes
git clone https://github.com/talesofai/comfyui-browser
git clone https://github.com/rgthree/rgthree-comfy
git clone https://github.com/yolain/ComfyUI-Easy-Use
git clone https://github.com/willmiao/ComfyUI-Lora-Manager
git clone https://github.com/PowerHouseMan/ComfyUI-AdvancedLivePortrait
git clone https://github.com/Acly/comfyui-inpaint-nodes
git clone https://github.com/logtd/ComfyUI-Fluxtapoz
git clone https://github.com/WASasquatch/was-node-suite-comfyui
git clone https://github.com/Fannovel16/comfyui_controlnet_aux
git clone https://github.com/TinyTerra/ComfyUI_tinyterraNodes
git clone https://github.com/cubiq/ComfyUI_IPAdapter_plus
git clone https://github.com/sipherxyz/comfyui-art-venture
git clone https://github.com/wallish77/wlsh_nodes
git clone https://github.com/crystian/ComfyUI-Crystools
git clone https://github.com/ssitu/ComfyUI_UltimateSDUpscale
git clone https://github.com/XLabs-AI/x-flux-comfyui
git clone https://github.com/chrisgoringe/cg-use-everywhere
git clone https://github.com/ltdrdata/ComfyUI-Impact-Pack
git clone https://github.com/TheLustriVA/ComfyUI-Image-Size-Tools
git clone https://github.com/gseth/ControlAltAI-Nodes

# 4. Krea 2 Base Modellek (Checkpoints) letoltese
echo "Krea 2 alapmodellek letoltese Civitai-rol..."
KREA_BASES=(
    "3072329" # Krea 2 Raw (fp8)
    "3072332" # Krea 2 Turbo (bf16)
    "3086841" # RedCraft (fp8)
    "3100032" # Moody Mix (fp8)
    "3107017" # DaSiWa merge turbo (bf16)
)
for model_id in "${KREA_BASES[@]}"; do
    aria2c -x 16 -s 16 -k 10M -c --header="Authorization: Bearer $CIVITAI_TOKEN" \
    --dir="/workspace/ComfyUI/models/checkpoints" \
    "https://civitai.com/api/download/models/${model_id}"
done

# 5. Krea 2 UNET (GGUF) letoltese
echo "GGUF modell letoltese..."
aria2c -x 16 -s 16 -k 10M -c --header="Authorization: Bearer $CIVITAI_TOKEN" \
--dir="/workspace/ComfyUI/models/unet" \
"https://civitai.com/api/download/models/3081077" # Moody Krea 2 GGUF

# 6. Krea 2 LoRas letoltese
echo "Krea 2 LoRas letoltese Civitai-rol..."
KREA_LORAS=(
    # BF16 LoRas (Art styles, Characters, Games stb.)
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
    aria2c -x 16 -s 16 -k 10M -c --header="Authorization: Bearer $CIVITAI_TOKEN" \
    --dir="/workspace/ComfyUI/models/loras" \
    "https://civitai.com/api/download/models/${lora_id}"
done

# 6.5 ESRGAN (Upscaler) modellek letoltese
echo "ESRGAN upscaler modellek letoltese..."
aria2c -x 16 -s 16 -k 10M -c --dir="/workspace/ComfyUI/models/upscale_models" "https://huggingface.co/Phips/4xNomosWebPhoto_RealPLKSR/resolve/main/4xNomosWebPhoto_RealPLKSR.safetensors"
aria2c -x 16 -s 16 -k 10M -c --dir="/workspace/ComfyUI/models/upscale_models" "https://github.com/Phhofm/models/releases/download/4xNomosWebPhoto_RealPLKSR/4xNomosWebPhoto_RealPLKSR.pth"

# 7. HuggingFace repok letoltese a VAE és Text Encoder fajlokhoz
# Ez letolti a megadott repok teljes tartalmat a megfelelo mappakba
echo "HuggingFace konyvtarak szinkronizalasa a VAE és Text Encoderek szamara..."
huggingface-cli download NorbyQWEN/Krea2_VAE --cache-dir /workspace/.cache --local-dir /workspace/ComfyUI/models/vae --token $HF_TOKEN
huggingface-cli download NorbyQWEN/Krea2_text_encoders --cache-dir /workspace/.cache --local-dir /workspace/ComfyUI/models/text_encoders --token $HF_TOKEN

# 8. (Opcionalis) Alap workflow beállítása, ha van hozza kulon Krea 2 json fajlod
# wget -qO- "https://raw.githubusercontent.com/Norby123/nord-F1d-VastAI/refs/heads/main/KREA2_WORKFLOW.json" > /workspace/ComfyUI/web/scripts/defaultGraph.js

echo "A ComfyUI kornyezet sikeresen felepitve! A rendszer indul."