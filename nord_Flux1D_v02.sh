#!/bin/bash

# This file will be sourced in init.sh

# https://raw.githubusercontent.com/ai-dock/comfyui/main/config/provisioning/default.sh

# Packages are installed after nodes so we can fix them...

DEFAULT_WORKFLOW="https://raw.githubusercontent.com/Norby123/nord-F1d-VastAI/refs/heads/main/FLUX_for_VastAI.json"

APT_PACKAGES=(
    "aria2"
)

PIP_PACKAGES=(
    #"package-1"
    #"package-2"
)

NODES=(
    
)

CHECKPOINT_MODELS=(
    
)

UNET_MODELS=(
    "https://huggingface.co/nyanko7/flux-dev-de-distill/resolve/main/consolidated_s6700.safetensors"
)

LORA_MODELS=(
    "https://huggingface.co/Norby/PDLX_Original_scene_artwork/resolve/main/PDLX_Original%20scene%20artwork.safetensors"
    "https://huggingface.co/Norby/PDLX_Original_scene_artwork/resolve/main/PDLX_Original%20scene%20artwork.jpg"
    "https://huggingface.co/Norby/ScenicHorizonsFLUX/resolve/main/ScenicHorizonsFLUX.safetensors"
    "https://huggingface.co/Norby/ScenicHorizonsFLUX/resolve/main/ScenicHorizonsFLUX.jpg"
    "https://huggingface.co/Norby/Fr4z3tt4_Flux/resolve/main/Fr4z3tt4_Flux.safetensors"
    "https://huggingface.co/Norby/Fr4z3tt4_Flux/resolve/main/Fr4z3tt4_Flux.jpg"
)

FOLDER_NAMES=(
    "PDLX_Original scene artwork"
    "Fr4z3tt4_Flux"
    "ScenicHorizonsFLUX"
    "SpecialConceptArt"
)

# Loop through the array and create each subfolder inside LORA_MODELS
function provisioning_lora_folders() {
    for FOLDER_NAME in "${FOLDER_NAMES[@]}"; do
        FULL_PATH="$LORA_MODELS/$FOLDER_NAME"
        echo "Creating folder: $FULL_PATH"
        mkdir -p "$FULL_PATH"
        
        if [[ -d "$FULL_PATH" ]]; then
            echo "Folder '$FULL_PATH' created successfully."
        else
            echo "Failed to create folder '$FULL_PATH'."
        fi
    done
    wget -P "$PDLX_Original scene artwork" "https://huggingface.co/Norby/PDLX_Original_scene_artwork/resolve/main/PDLX_Original%20scene%20artwork/euler-simple%20--%20no%20trigger%20no%20info.txt"
    wget -P "ScenicHorizonsFLUX" "https://huggingface.co/Norby/ScenicHorizonsFLUX/resolve/main/ScenicHorizonsFLUX/info.txt"
    wget -P "ScenicHorizonsFLUX" "https://huggingface.co/Norby/ScenicHorizonsFLUX/resolve/main/ScenicHorizonsFLUX/trigger.txt"
    wget -P "Fr4z3tt4_Flux" "https://huggingface.co/Norby/Fr4z3tt4_Flux/resolve/main/Fr4z3tt4_Flux/info.txt"
    wget -P "Fr4z3tt4_Flux" "https://huggingface.co/Norby/Fr4z3tt4_Flux/resolve/main/Fr4z3tt4_Flux/trigger.txt" 
}


VAE_MODELS=(
    "https://huggingface.co/black-forest-labs/FLUX.1-dev/resolve/main/ae.safetensors"
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