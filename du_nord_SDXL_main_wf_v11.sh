#!/bin/bash

# This file will be sourced in init.sh

# https://raw.githubusercontent.com/ai-dock/comfyui/main/config/provisioning/default.sh

# Packages are installed after nodes so we can fix them...

DEFAULT_WORKFLOW="https://raw.githubusercontent.com/Norby123/nord-F1d-VastAI/refs/heads/main/_DU_main_workflow_v01.json"

APT_PACKAGES=(
    "aria2"
)

PIP_PACKAGES=(
    #"package-1"
    #"package-2"
)

NODES=(
    "https://github.com/Acly/comfyui-inpaint-nodes"
    "https://github.com/city96/ComfyUI-GGUF"
    "https://github.com/pythongosssss/ComfyUI-Custom-Scripts"
    "https://github.com/mcmonkeyprojects/sd-dynamic-thresholding"
    "https://github.com/kijai/ComfyUI-KJNodes"
    "https://github.com/talesofai/comfyui-browser"
    "https://github.com/rgthree/rgthree-comfy"
    "https://github.com/yolain/ComfyUI-Easy-Use"
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
)

CHECKPOINT_MODELS=(
  #ICBINP
  "https://civitai.com/api/download/models/551129?type=Model&format=SafeTensor&size=pruned&fp=fp16"
  #Albedo 3.1-Large
  "https://civitai.com/api/download/models/1041855?type=Model&format=SafeTensor&size=pruned&fp=fp16"
  #EpicUltraHD
  "https://civitai.com/api/download/models/784834?type=Model&format=SafeTensor&size=pruned&fp=fp16"
  #888XL
  "https://civitai.com/api/download/models/1675725?type=Model&format=SafeTensor&size=pruned&fp=fp16"
  #Araminta Fv5
  "https://civitai.com/api/download/models/1536255?type=Model&format=SafeTensor&size=pruned&fp=fp16"
  #Araminta Gv4
  "https://civitai.com/api/download/models/1645959?type=Model&format=SafeTensor&size=pruned&fp=fp16"
  #Araminta Fv3
  "https://civitai.com/api/download/models/1286901?type=Model&format=SafeTensor&size=pruned&fp=fp16"
  #Pony2RelustionFP32
  "https://civitai.com/api/download/models/1269576?type=Model&format=SafeTensor&size=full&fp=fp32"
  #RealVisXL v5 - fp16
  "https://civitai.com/api/download/models/789646?type=Model&format=SafeTensor&size=full&fp=fp16"
  #RealVisXL v5 - fp32
  "https://civitai.com/api/download/models/789646?type=Model&format=SafeTensor&size=full&fp=fp32"
  #BriXL v5 - FP16 
  "https://civitai.com/api/download/models/239362?type=Model&format=SafeTensor&size=full&fp=fp16"
  #Brixl v3 -BF16
  "https://civitai.com/api/download/models/148138?type=Model&format=SafeTensor&size=full&fp=bf16"

)

CLIP_MODELS=(
    
)

UNET_MODELS=(
	#"https://civitai.com/api/download/models/1326477?type=Model&format=GGUF&size=full&fp=fp16"
	#"https://civitai.com/api/download/models/1256154?type=Model&format=SafeTensor&size=pruned&fp=bf16"
	#"https://civitai.com/api/download/models/1389019?type=Model&format=SafeTensor&size=pruned&fp=fp8"
	#"https://civitai.com/api/download/models/1327418?type=Model&size=pruned&fp=fp16"
    #"https://civitai.com/api/download/models/1171942?type=Model&format=SafeTensor&size=pruned&fp=fp8"
  	#"https://civitai.com/api/download/models/1606815?type=Model&format=SafeTensor&size=full&fp=fp8"
	#"https://civitai.com/api/download/models/1576605?type=Model&format=SafeTensor&size=pruned&fp=fp8"
 	#"https://civitai.com/api/download/models/1539776?type=Model&format=SafeTensor&size=full&fp=bf16"   
)

VAE_MODELS=(
    #"https://huggingface.co/black-forest-labs/FLUX.1-dev/resolve/main/ae.safetensors"
	"https://huggingface.co/NorbyXL/vae/resolve/main/ponyStandardVAE_v10.safetensors"
	"https://huggingface.co/NorbyXL/vae/resolve/main/vae-ft-MSE(picivel_jobb)-840000-ema-pruned.ckpt"
)

LORA_MODELS=(
    
)

ESRGAN_MODELS=(
    "https://huggingface.co/Phips/4xNomosWebPhoto_RealPLKSR/resolve/main/4xNomosWebPhoto_RealPLKSR.safetensors"
	"https://github.com/Phhofm/models/releases/download/4xNomosWebPhoto_RealPLKSR/"
	"https://github.com/Phhofm/models/releases/download/4xNomosWebPhoto_RealPLKSR/4xNomosWebPhoto_RealPLKSR.pth"
)

CONTROLNET_MODELS=(
    "https://huggingface.co/Kijai/DepthAnythingV2-safetensors/resolve/main/depth_anything_v2_vitl_fp32.safetensors"
	"https://huggingface.co/xinsir/controlnet-union-sdxl-1.0/resolve/main/diffusion_pytorch_model_promax.safetensors"
	"https://huggingface.co/lllyasviel/sd_control_collection/resolve/main/thibaud_xl_openpose_256lora.safetensors"
	"https://huggingface.co/stabilityai/control-lora/resolve/main/control-LoRAs-rank256/control-lora-canny-rank256.safetensors"
	
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
        "${WORKSPACE}/storage/stable_diffusion/models/clip" \
        "${CLIP_MODELS[@]}"
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

 # Adding the Hugging Face CLI command
    /opt/environments/python/comfyui/bin/huggingface-cli download NorbyXL/loras --cache-dir $WORKSPACE/.cache --local-dir $WORKSPACE/ComfyUI/models/loras
	/opt/environments/python/comfyui/bin/huggingface-cli download NorbyXL/clip_vision --cache-dir $WORKSPACE/.cache --local-dir $WORKSPACE/ComfyUI/models/clip_vision
	/opt/environments/python/comfyui/bin/huggingface-cli download NorbyXL/ipadapter --cache-dir $WORKSPACE/.cache --local-dir $WORKSPACE/ComfyUI/models/ipadapter
	
provisioning_start
