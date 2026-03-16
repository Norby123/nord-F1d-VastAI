#!/bin/bash

# on RTX 5090: force update ComfyUI.

# pip uninstall -y torch torchvision torchaudio
# pip install torch torchvision torchaudio --index-url https://download.pytorch.org/whl/cu128
# pip install -U --pre triton
#maybe pip install -U xformers

# - - - - Model Lineup and Performance - - - - -

# 9B distilled — 4 steps · ~2s (5090) · 19.6GB VRAM

# 9B base — 50 steps · ~35s (5090) · 21.7GB VRAM

# 4B distilled — 4 steps · ~1.2s (5090) · 8.4GB VRAM

# 4B base — 50 steps · ~17s (5090) · 9.2GB VRAM



source /venv/main/bin/activate
COMFYUI_DIR=${WORKSPACE}/ComfyUI

# Packages are installed after nodes so we can fix them...

APT_PACKAGES=(
    "aria2"
)

PIP_PACKAGES=(
    #"package-1"
    #"package-2"
)

NODES=(
    "https://github.com/TripleHeadedMonkey/ComfyUI-Zlycoris"
    "https://github.com/scraed/LanPaint"
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

WORKFLOWS=(

)

CLIP_MODELS=(
    "https://huggingface.co/zer0int/CLIP-GmP-ViT-L-14/resolve/main/ViT-L-14-BEST-smooth-GmP-TE-only-HF-format.safetensors"
    "https://huggingface.co/zer0int/CLIP-GmP-ViT-L-14/resolve/main/ViT-L-14-TEXT-detail-improved-hiT-GmP-TE-only-HF.safetensors"
	"https://huggingface.co/city96/t5-v1_1-xxl-encoder-gguf/resolve/main/t5-v1_1-xxl-encoder-Q8_0.gguf"
	"https://huggingface.co/black-forest-labs/FLUX.1-dev/resolve/main/ae.safetensors"
	"https://civitai.com/api/download/models/711305?type=Model&format=SafeTensor"
)

CHECKPOINT_MODELS=(
    #"https://civitai.com/api/download/models/2618128?type=Model&format=SafeTensor&size=full&fp=bf16"
)

UNET_MODELS=(
    #FLUX.DEV DEDISTILLED
	"https://civitai.com/api/download/models/943716?type=Model&format=SafeTensor&size=full&fp=fp16"
	# FLUX.DEV DEDISTILLED GGUF-Q8-fp8
	"https://civitai.com/api/download/models/943891?type=Model&format=GGUF&size=full&fp=fp8"
    #UltraReal Fine-Tune v4
    "https://civitai.com/api/download/models/1413133?type=Model&format=SafeTensor&size=full&fp=fp16"
	#locoFluxRealTexture_v40
    "https://civitai.com/api/download/models/1606815?type=Model&format=SafeTensor&size=full&fp=fp8"
	# Fluxmania Legacy - fp16
	"https://civitai.com/api/download/models/1769925?type=Model&format=SafeTensor&size=full&fp=fp16"
	# Fluxmania Kreamania fp16
	"https://civitai.com/api/download/models/2106807?type=Model&format=SafeTensor&size=full&fp=fp16"
	# Nepotism_XI
	"https://civitai.com/api/download/models/1326315?type=Model&format=SafeTensor&size=full&fp=fp16"
	# Nepotism XII fp8 pruned
	"https://civitai.com/api/download/models/2031577?type=Model&format=SafeTensor&size=pruned&fp=fp8"
	#Colossus Project Flux v.12 - fp16 unet
    "https://civitai.com/api/download/models/2026227?type=Model&format=SafeTensor&size=full&fp=fp16"
    # CyberRealistic Flux - v.1.0
    "https://civitai.com/api/download/models/2036890?type=Model&format=SafeTensor&size=pruned&fp=fp8"
	# CyberRealistic Flux v2.5
	"https://civitai.com/api/download/models/2287992?type=Model&format=SafeTensor&size=full&fp=fp16"
    # Fux Capacity NSFW - v3.0 - FP16
    "https://civitai.com/api/download/models/1996179?type=Model&format=SafeTensor&size=pruned&fp=fp16"
	Fux Capacity NSFW - v5.1 fp16
	"https://civitai.com/api/download/models/2605292?type=Model&format=SafeTensor&size=full&fp=fp16"
)

LORA_MODELS=(
)

VAE_MODELS=(
	"https://huggingface.co/black-forest-labs/FLUX.1-dev/resolve/main/ae.safetensors"
	"https://civitai.com/api/download/models/711305?type=Model&format=SafeTensor"
	"https://huggingface.co/lovis93/testllm/resolve/ed9cf1af7465cebca4649157f118e331cf2a084f/ae.safetensors"
	#"https://huggingface.co/NorbyXL/vae/resolve/main/ponyStandardVAE_v10.safetensors"
	#"https://huggingface.co/NorbyXL/vae/resolve/main/vae-ft-MSE(picivel_jobb)-840000-ema-pruned.ckpt"
)

ESRGAN_MODELS=(
    "https://huggingface.co/Phips/4xNomosWebPhoto_RealPLKSR/resolve/main/4xNomosWebPhoto_RealPLKSR.safetensors"
	"https://github.com/Phhofm/models/releases/download/4xNomosWebPhoto_RealPLKSR/"
	"https://github.com/Phhofm/models/releases/download/4xNomosWebPhoto_RealPLKSR/4xNomosWebPhoto_RealPLKSR.pth"
)

CONTROLNET_MODELS=(
)

### DO NOT EDIT BELOW HERE UNLESS YOU KNOW WHAT YOU ARE DOING ###

function provisioning_start() {
    provisioning_print_header
    provisioning_get_apt_packages
    provisioning_get_nodes
    provisioning_get_pip_packages
    provisioning_get_files \
        "${COMFYUI_DIR}/models/checkpoints" \
        "${CHECKPOINT_MODELS[@]}"
    provisioning_get_files \
        "${COMFYUI_DIR}/models/unet" \
        "${UNET_MODELS[@]}"
    provisioning_get_files \
        "${COMFYUI_DIR}/models/lora" \
        "${LORA_MODELS[@]}"
    provisioning_get_files \
        "${COMFYUI_DIR}/models/controlnet" \
        "${CONTROLNET_MODELS[@]}"
    provisioning_get_files \
        "${COMFYUI_DIR}/models/vae" \
        "${VAE_MODELS[@]}"
    provisioning_get_files \
        "${COMFYUI_DIR}/models/esrgan" \
        "${ESRGAN_MODELS[@]}"
    provisioning_print_end
}

function provisioning_get_apt_packages() {
    if [[ -n $APT_PACKAGES ]]; then
            sudo $APT_INSTALL ${APT_PACKAGES[@]}
    fi
}

function provisioning_get_pip_packages() {
    if [[ -n $PIP_PACKAGES ]]; then
            pip install --no-cache-dir ${PIP_PACKAGES[@]}
    fi
}

function provisioning_get_nodes() {
    for repo in "${NODES[@]}"; do
        dir="${repo##*/}"
        path="${COMFYUI_DIR}custom_nodes/${dir}"
        requirements="${path}/requirements.txt"
        if [[ -d $path ]]; then
            if [[ ${AUTO_UPDATE,,} != "false" ]]; then
                printf "Updating node: %s...\n" "${repo}"
                ( cd "$path" && git pull )
                if [[ -e $requirements ]]; then
                   pip install --no-cache-dir -r "$requirements"
                fi
            fi
        else
            printf "Downloading node: %s...\n" "${repo}"
            git clone "${repo}" "${path}" --recursive
            if [[ -e $requirements ]]; then
                pip install --no-cache-dir -r "${requirements}"
            fi
        fi
    done
}

function provisioning_get_files() {
    if [[ -z $2 ]]; then return 1; fi
    
    dir="$1"
    mkdir -p "$dir"
    shift
    arr=("$@")
    printf "Downloading %s model(s) to %s...\n" "${#arr[@]}" "$dir"
    for url in "${arr[@]}"; do
        printf "Downloading: %s\n" "${url}"
        provisioning_download "${url}" "${dir}"
        printf "\n"
    done
}

function provisioning_print_header() {
    printf "\n##############################################\n#                                            #\n#          Provisioning container            #\n#                                            #\n#         This will take some time           #\n#                                            #\n# Your container will be ready on completion #\n#                                            #\n##############################################\n\n"
}

function provisioning_print_end() {
    printf "\nProvisioning complete:  Application will start now\n\n"
}

function provisioning_has_valid_hf_token() {
    [[ -n "$HF_TOKEN" ]] || return 1
    url="https://huggingface.co/api/whoami-v2"

    response=$(curl -o /dev/null -s -w "%{http_code}" -X GET "$url" \
        -H "Authorization: Bearer $HF_TOKEN" \
        -H "Content-Type: application/json")

    # Check if the token is valid
    if [ "$response" -eq 200 ]; then
        return 0
    else
        return 1
    fi
}

function provisioning_has_valid_civitai_token() {
    [[ -n "$CIVITAI_TOKEN" ]] || return 1
    url="https://civitai.com/api/v1/models?hidden=1&limit=1"

    response=$(curl -o /dev/null -s -w "%{http_code}" -X GET "$url" \
        -H "Authorization: Bearer $CIVITAI_TOKEN" \
        -H "Content-Type: application/json")

    # Check if the token is valid
    if [ "$response" -eq 200 ]; then
        return 0
    else
        return 1
    fi
}

# Download from $1 URL to $2 file path
function provisioning_download() {
    if [[ -n $HF_TOKEN && $1 =~ ^https://([a-zA-Z0-9_-]+\.)?huggingface\.co(/|$|\?) ]]; then
        auth_token="$HF_TOKEN"
    elif 
        [[ -n $CIVITAI_TOKEN && $1 =~ ^https://([a-zA-Z0-9_-]+\.)?civitai\.com(/|$|\?) ]]; then
        auth_token="$CIVITAI_TOKEN"
    fi
    if [[ -n $auth_token ]];then
        wget --header="Authorization: Bearer $auth_token" -qnc --content-disposition --show-progress -e dotbytes="${3:-4M}" -P "$2" "$1"
    else
        wget -qnc --content-disposition --show-progress -e dotbytes="${3:-4M}" -P "$2" "$1"
    fi
}

#CLI command

    /opt/environments/python/comfyui/bin/huggingface-cli download Norby/loras --cache-dir $WORKSPACE/.cache --local-dir $WORKSPACE/ComfyUI/models/loras



# Allow user to disable provisioning if they started with a script they didn't want
if [[ ! -f /.noprovisioning ]]; then
    provisioning_start
fi
