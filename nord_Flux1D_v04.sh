#!/bin/bash

# This file will be sourced in init.sh

# https://raw.githubusercontent.com/ai-dock/comfyui/main/config/provisioning/default.sh

# Packages are installed after nodes so we can fix them...

git clone https://github.com/Norby123/loras.git /workspace/ComfyUI/models/loras

DEFAULT_WORKFLOW="https://raw.githubusercontent.com/Norby123/nord-F1d-VastAI/refs/heads/main/FLUX_for_VastAI_v2.json"

APT_PACKAGES=(
    "aria2"
)

PIP_PACKAGES=(
    #"package-1"
    #"package-2"
)

NODES=(
    "https://github.com/city96/ComfyUI-GGUF"
	"https://github.com/pythongosssss/ComfyUI-Custom-Scripts"
    "https://github.com/mcmonkeyprojects/sd-dynamic-thresholding"
    "https://github.com/kijai/ComfyUI-KJNodes"
    "https://github.com/talesofai/comfyui-browser"
)

CHECKPOINT_MODELS=(
    "https://civitai.com/api/download/models/943716?type=Model&format=SafeTensor&size=full&fp=fp16"
	"https://civitai.com/api/download/models/943787?type=Model&format=SafeTensor&size=full&fp=fp8"  
)

CLIP_MODELS=(
    "https://huggingface.co/zer0int/CLIP-GmP-ViT-L-14/resolve/main/ViT-L-14-BEST-smooth-GmP-TE-only-HF-format.safetensors"
    "https://huggingface.co/comfyanonymous/flux_text_encoders/resolve/main/t5xxl_fp16.safetensors"
)

UNET_MODELS=(
    "https://civitai.com/api/download/models/943891?type=Model&format=GGUF&size=full&fp=fp8"
)

VAE_MODELS=(
    "https://huggingface.co/black-forest-labs/FLUX.1-dev/resolve/main/ae.safetensors"
)

LORA_MODELS=(
    "https://huggingface.co/Norby/PDLX_Original_scene_artwork/resolve/main/PDLX_Original%20scene%20artwork.safetensors"
    "https://huggingface.co/Norby/PDLX_Original_scene_artwork/resolve/main/PDLX_Original%20scene%20artwork.jpg"
    "https://huggingface.co/Norby/ScenicHorizonsFLUX/resolve/main/ScenicHorizonsFLUX.safetensors"
    "https://huggingface.co/Norby/ScenicHorizonsFLUX/resolve/main/ScenicHorizonsFLUX.jpg"
    "https://huggingface.co/Norby/Fr4z3tt4_Flux/resolve/main/Fr4z3tt4_Flux.safetensors"
    "https://huggingface.co/Norby/Fr4z3tt4_Flux/resolve/main/Fr4z3tt4_Flux.jpg"
	"https://huggingface.co/Norby/Epic_LOL_cpt/resolve/main/Epic_LOL_cpt.safetensors"
	"https://huggingface.co/Norby/Epic_LOL_cpt/resolve/main/Epic_LOL_cpt.jpg"
	"https://huggingface.co/Norby/lolsart/resolve/main/lolsart.safetensors"
	"https://huggingface.co/Norby/lolsart/resolve/main/lolsart.jpg"
	"https://huggingface.co/Norby/SXZ_YumingLi_Flux/resolve/main/SXZ_YumingLi_Flux.safetensors"
	"https://huggingface.co/Norby/SXZ_YumingLi_Flux/resolve/main/SXZ_YumingLi_Flux.jpg"
	"https://huggingface.co/Norby/FANCHA_style/resolve/main/FANCHA_style.safetensors"
	"https://huggingface.co/Norby/FANCHA_style/resolve/main/FANCHA_style.jpg"
	"https://huggingface.co/Norby/Ayami_Kojima_Style_V3_30/resolve/main/Ayami_Kojima_Style_V3_30.safetensors"
	"https://huggingface.co/Norby/Ayami_Kojima_Style_V3_30/resolve/main/Ayami_Kojima_Style_V3_30.jpg"
)

ESRGAN_MODELS=(
    "https://github.com/Phhofm/models/releases/download/4xNomosWebPhoto_RealPLKSR/4xNomosWebPhoto_RealPLKSR.pth"
)

CONTROLNET_MODELS=(

)

### DO NOT EDIT BELOW HERE UNLESS YOU KNOW WHAT YOU ARE DOING ###

function provisioning_start() {
    if [[ ! -d /opt/environments/python ]]; then 
        export MAMBA_BASE=true
    fi
    source /opt/ai-dock/etc/environment.sh
    source /opt/ai-dock/bin/venv-set.sh comfyui

    provisioning_print_header
    provisioning_get_apt_packages
    provisioning_get_default_workflow
    provisioning_lora_folders
    provisioning_get_nodes
    provisioning_get_pip_packages
    provisioning_get_models \
        "${WORKSPACE}/storage/stable_diffusion/models/ckpt" \
        "${CHECKPOINT_MODELS[@]}"
    provisioning_get_models \
        "${WORKSPACE}/storage/stable_diffusion/models/unet" \
        "${UNET_MODELS[@]}"
    provisioning_get_models \
        "${WORKSPACE}/storage/stable_diffusion/models/lora" \
        "${LORA_MODELS[@]}"
    provisioning_get_models \
        "${WORKSPACE}/storage/stable_diffusion/models/controlnet" \
        "${CONTROLNET_MODELS[@]}"
    provisioning_get_models \
        "${WORKSPACE}/storage/stable_diffusion/models/vae" \
        "${VAE_MODELS[@]}"
    provisioning_get_models \
        "${WORKSPACE}/storage/stable_diffusion/models/esrgan" \
        "${ESRGAN_MODELS[@]}"
    provisioning_print_end
}

function pip_install() {
    if [[ -z $MAMBA_BASE ]]; then
            "$COMFYUI_VENV_PIP" install --no-cache-dir "$@"
        else
            micromamba run -n comfyui pip install --no-cache-dir "$@"
        fi
}

function provisioning_get_apt_packages() {
    if [[ -n $APT_PACKAGES ]]; then
            sudo $APT_INSTALL ${APT_PACKAGES[@]}
    fi
}

function provisioning_get_pip_packages() {
    if [[ -n $PIP_PACKAGES ]]; then
            pip_install ${PIP_PACKAGES[@]}
    fi
}

function provisioning_get_nodes() {
    for repo in "${NODES[@]}"; do
        dir="${repo##*/}"
        path="/opt/ComfyUI/custom_nodes/${dir}"
        requirements="${path}/requirements.txt"
        if [[ -d $path ]]; then
            if [[ ${AUTO_UPDATE,,} != "false" ]]; then
                printf "Updating node: %s...\n" "${repo}"
                ( cd "$path" && git pull )
                if [[ -e $requirements ]]; then
                   pip_install -r "$requirements"
                fi
            fi
        else
            printf "Downloading node: %s...\n" "${repo}"
            git clone "${repo}" "${path}" --recursive
            if [[ -e $requirements ]]; then
                pip_install -r "${requirements}"
            fi
        fi
    done
}

function provisioning_get_default_workflow() {
    if [[ -n $DEFAULT_WORKFLOW ]]; then
        workflow_json=$(curl -s "$DEFAULT_WORKFLOW")
        if [[ -n $workflow_json ]]; then
            echo "export const defaultGraph = $workflow_json;" > /opt/ComfyUI/web/scripts/defaultGraph.js
        fi
    fi
}

function provisioning_get_models() {
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
    if [[ $DISK_GB_ALLOCATED -lt $DISK_GB_REQUIRED ]]; then
        printf "WARNING: Your allocated disk size (%sGB) is below the recommended %sGB - Some models will not be downloaded\n" "$DISK_GB_ALLOCATED" "$DISK_GB_REQUIRED"
    fi
}

function provisioning_print_end() {
    printf "\nProvisioning complete:  Web UI will start now\n\n"
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
    if [[ -n $auth_token && $1 =~ ^https://([a-zA-Z0-9_-]+\.)?huggingface\.co(/|$|\?) ]]; then
        final_url=$(curl -H "Authorization: Bearer $auth_token" -s -L -I -w '%{url_effective}' -o /dev/null "$1")
        filename=$(curl -H "Authorization: Bearer $auth_token" -s -L -I "$final_url" | grep -i 'content-disposition' | sed -n 's/.*filename\*=UTF-8''//;s/.*filename="//;s/";//p')
        aria2c -x 16 -s 16 -k 10M -c --file-allocation=falloc --header="Authorization: Bearer $auth_token" --dir="$2" -o "$filename" "$final_url"
    elif 
        [[ -n $auth_token && $1 =~ ^https://([a-zA-Z0-9_-]+\.)?civitai\.com(/|$|\?) ]]; then
        final_url=$(curl -H "Authorization: Bearer $auth_token" -s -L -I -w '%{url_effective}' -o /dev/null "$1")
        aria2c -x 16 -s 16 -k 10M -c --file-allocation=falloc --dir="$2" "$final_url"
    fi
}

provisioning_start