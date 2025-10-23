#!/bin/bash

# This file will be sourced in init.sh

# https://raw.githubusercontent.com/ai-dock/comfyui/main/config/provisioning/default.sh

# Packages are installed after nodes so we can fix them...

# on RTX 5090: force update ComfyUI.

# pip uninstall -y torch torchvision torchaudio
# pip install torch torchvision torchaudio --index-url https://download.pytorch.org/whl/cu128
# pip install -U --pre triton
#maybe# pip install -U xformers

DEFAULT_WORKFLOW="https://raw.githubusercontent.com/Norby123/nord-F1d-VastAI/refs/heads/main/FLUX_for_VastAI_v3.json"

APT_PACKAGES=(
    "aria2"
)

PIP_PACKAGES=(
    #"package-1"
    #"package-2"
)

NODES=(
    "https://github.com/ClownsharkBatwing/RES4LYF"
	"https://github.com/willmiao/ComfyUI-Lora-Manager"
	"https://github.com/PowerHouseMan/ComfyUI-AdvancedLivePortrait"
    "https://github.com/Acly/comfyui-inpaint-nodes"
    "https://github.com/city96/ComfyUI-GGUF"
	"https://github.com/pythongosssss/ComfyUI-Custom-Scripts"
    "https://github.com/mcmonkeyprojects/sd-dynamic-thresholding"
    "https://github.com/kijai/ComfyUI-KJNodes"
    "https://github.com/talesofai/comfyui-browser"
	"https://github.com/rgthree/rgthree-comfy"
    "https://github.com/yolain/ComfyUI-Easy-Use"
    "https://github.com/logtd/ComfyUI-Fluxtapoz"
	#"https://github.com/WASasquatch/was-node-suite-comfyui"
	#"https://github.com/Fannovel16/comfyui_controlnet_aux"
	"https://github.com/TinyTerra/ComfyUI_tinyterraNodes"
	"https://github.com/cubiq/ComfyUI_IPAdapter_plus"
	"https://github.com/sipherxyz/comfyui-art-venture"
	#"https://github.com/wallish77/wlsh_nodes"
	"https://github.com/crystian/ComfyUI-Crystools"
    "https://github.com/ssitu/ComfyUI_UltimateSDUpscale"
    #"https://github.com/XLabs-AI/x-flux-comfyui"
	"https://github.com/ltdrdata/ComfyUI-Impact-Pack"
	"https://github.com/TheLustriVA/ComfyUI-Image-Size-Tools"
	#"https://github.com/gseth/ControlAltAI-Nodes"
	#"https://github.com/chrisgoringe/cg-use-everywhere"

)

CHECKPOINT_MODELS=(
 	#PONY
#	"https://civitai.com/api/download/models/1305588?type=Model&format=SafeTensor&size=pruned&fp=fp16"
#	"https://civitai.com/api/download/models/670518?type=Model&format=SafeTensor&size=full&fp=fp16"
	#Illustrious
#	"https://civitai.com/api/download/models/1897747?type=Model&format=SafeTensor&size=pruned&fp=fp16"
#	"https://civitai.com/api/download/models/1847864?type=Model&format=SafeTensor&size=pruned&fp=fp16"
#	"https://civitai.com/api/download/models/1873175?type=Model&format=SafeTensor&size=pruned&fp=fp16"
#	"https://civitai.com/api/download/models/1761560?type=Model&format=SafeTensor&size=pruned&fp=fp16"
#	"https://civitai.com/api/download/models/1899665?type=Model&format=SafeTensor&size=pruned&fp=fp16"
#	"https://civitai.com/api/download/models/1897112?type=Model&format=SafeTensor&size=pruned&fp=fp16"
	#- - - SDXL - - -
	#ICBINP
#    "https://civitai.com/api/download/models/551129?type=Model&format=SafeTensor&size=pruned&fp=fp16"
    #Albedo 3.1-Large
#    "https://civitai.com/api/download/models/1041855?type=Model&format=SafeTensor&size=pruned&fp=fp16"
    #EpicUltraHD
#    "https://civitai.com/api/download/models/784834?type=Model&format=SafeTensor&size=pruned&fp=fp16"
    #888XL
#    "https://civitai.com/api/download/models/1675725?type=Model&format=SafeTensor&size=pruned&fp=fp16"
    #Araminta Fv5
#    "https://civitai.com/api/download/models/1536255?type=Model&format=SafeTensor&size=pruned&fp=fp16"
    #Araminta Gv4
#    "https://civitai.com/api/download/models/1645959?type=Model&format=SafeTensor&size=pruned&fp=fp16"
    #Araminta Fv3
#    "https://civitai.com/api/download/models/1286901?type=Model&format=SafeTensor&size=pruned&fp=fp16"
    #Pony2RelustionFP32
#    "https://civitai.com/api/download/models/1269576?type=Model&format=SafeTensor&size=full&fp=fp32"
    #Paint Sol Scav
#    "https://civitai.com/api/download/models/1689852?type=Model&format=SafeTensor&size=full&fp=fp16"
    #Big Lust 1.6
#    "https://civitai.com/api/download/models/1081768?type=Model&format=SafeTensor&size=full&fp=fp16"
    #Best Porn Merge [BPM] v1.0
#    "https://civitai.com/api/download/models/1527248?type=Model&format=SafeTensor&size=full&fp=fp16"
    #CyberRealistic Pony v9.0-Alt-1
#    "https://civitai.com/api/download/models/1691220?type=Model&format=SafeTensor&size=pruned&fp=fp16"
    #Big Love - Pony2 
#    "https://civitai.com/api/download/models/1077585?type=Model&format=SafeTensor&size=pruned&fp=fp16"
    #Big Love - XL3
#    "https://civitai.com/api/download/models/1744439?type=Model&format=SafeTensor&size=pruned&fp=fp16"
	
    )

CLIP_MODELS=(
    "https://huggingface.co/zer0int/CLIP-GmP-ViT-L-14/resolve/main/ViT-L-14-BEST-smooth-GmP-TE-only-HF-format.safetensors"
    "https://huggingface.co/zer0int/CLIP-GmP-ViT-L-14/resolve/main/ViT-L-14-TEXT-detail-improved-hiT-GmP-TE-only-HF.safetensors"
	"https://huggingface.co/city96/t5-v1_1-xxl-encoder-gguf/resolve/main/t5-v1_1-xxl-encoder-Q8_0.gguf"
	"https://huggingface.co/black-forest-labs/FLUX.1-dev/resolve/main/ae.safetensors"
	"https://civitai.com/api/download/models/711305?type=Model&format=SafeTensor"
)

UNET_MODELS=(
    #UltraReal Fine-Tune v4
#    "https://civitai.com/api/download/models/1413133?type=Model&format=SafeTensor&size=full&fp=fp16"
   #locoFluxRealTexture_v40
#    "https://civitai.com/api/download/models/1606815?type=Model&format=SafeTensor&size=full&fp=fp8"
	# ultrarealFineTune v4
#	"https://civitai.com/api/download/models/1413133?type=Model&format=SafeTensor&size=full&fp=fp16"
	# Fluxmania Legacy - fp16
#	"https://civitai.com/api/download/models/1769925?type=Model&format=SafeTensor&size=full&fp=fp16"
	#Nepotism_XI
#	"https://civitai.com/api/download/models/1326315?type=Model&format=SafeTensor&size=full&fp=fp16"
	# Fluxmania Legacy - fp8
	#"https://civitai.com/api/download/models/1769925?type=Model&format=SafeTensor&size=pruned&fp=fp8"
    #"https://civitai.com/api/download/models/992642?type=Model&format=GGUF&size=full&fp=fp8"
    #"https://civitai.com/api/download/models/1389019?type=Model&format=GGUF&size=pruned&fp=bf16"
   #Colossus Project Flux v.12 - fp16 unet
#   "https://civitai.com/api/download/models/2026227?type=Model&format=SafeTensor&size=full&fp=fp16"
   # CyberRealistic Flux - v.1.0
#   "https://civitai.com/api/download/models/2036890?type=Model&format=SafeTensor&size=pruned&fp=fp8"
   # Konext - dev/null
   #"https://civitai.com/api/download/models/1945998?type=Model&format=SafeTensor&size=full&fp=fp16"
   # Fux Capacity NSFW - v3.0 - FP16
#   "https://civitai.com/api/download/models/1996179?type=Model&format=SafeTensor&size=pruned&fp=fp16"
   # Persephone Flux NSFW v1.0 - FP16
   #"https://civitai.com/api/download/models/2008873?type=Model&format=SafeTensor&size=pruned&fp=fp16"
   # 
   #"https://civitai.com/api/download/models/1996104?type=Model&format=SafeTensor&size=pruned&fp=fp16"
)

VAE_MODELS=(
    "https://huggingface.co/black-forest-labs/FLUX.1-dev/resolve/main/ae.safetensors"
	"https://civitai.com/api/download/models/711305?type=Model&format=SafeTensor"
	"https://huggingface.co/lovis93/testllm/resolve/ed9cf1af7465cebca4649157f118e331cf2a084f/ae.safetensors"
	#"https://huggingface.co/NorbyXL/vae/resolve/main/ponyStandardVAE_v10.safetensors"
	#"https://huggingface.co/NorbyXL/vae/resolve/main/vae-ft-MSE(picivel_jobb)-840000-ema-pruned.ckpt"
	"https://huggingface.co/Comfy-Org/Qwen-Image_ComfyUI/resolve/main/split_files/vae/qwen_image_vae.safetensors"
	"https://huggingface.co/stabilityai/sd-vae-ft-mse-original/resolve/main/vae-ft-mse-840000-ema-pruned.safetensors"
)

LORA_MODELS=(
    "https://civitai.com/api/download/models/2328988?type=Model&format=SafeTensor"
	# Animation Layout Style | Qwen Image Edit Non-Plus
	"https://civitai.com/api/download/models/2324096?type=Model&format=SafeTensor"
	# Qwen_ Ukiyo-Zen Linear Illustration
	"https://civitai.com/api/download/models/2319210?type=Model&format=SafeTensor"
	# Animation Layout Style | Qwen Image Edit Non-Plus
	"https://civitai.com/api/download/models/2317746?type=Model&format=SafeTensor"
	# QWEN 4 PLAY - AIO NSFW Qwen LoRa by DR34MSC4PE
	"https://civitai.com/api/download/models/2316696?type=Model&format=SafeTensor"
	# Boris Vallejo style
	"https://civitai.com/api/download/models/2312003?type=Model&format=SafeTensor"
	# Igor Kieryluk style
	"https://civitai.com/api/download/models/2311464?type=Model&format=SafeTensor"
	# Midnight Black - CE
	"https://civitai.com/api/download/models/2310977?type=Model&format=SafeTensor"
	# Qwen Sex, Nudes, Other Fun Stuff (SNOFS)
	"https://civitai.com/api/download/models/2310533?type=Model&format=SafeTensor"
	# Look Development Model Style | Qwen Image Edit Non-Plus
	"https://civitai.com/api/download/models/2307585?type=Model&format=SafeTensor"
	# Qwen-Image-Edit-2509-Lightning-4steps-V1.0-bf16
	"https://huggingface.co/lightx2v/Qwen-Image-Lightning/resolve/main/Qwen-Image-Edit-2509/Qwen-Image-Edit-2509-Lightning-4steps-V1.0-bf16.safetensors"
	# Qwen-Image-Lightning-4steps-V1.0
	"https://huggingface.co/lightx2v/Qwen-Image-Lightning/resolve/main/Qwen-Image-Lightning-4steps-V1.0.safetensors"
	# Childish - CE
	"https://civitai.com/api/download/models/2333541?type=Model&format=SafeTensor"
	# QWEN DOODLE INK TATTOO
	"https://civitai.com/api/download/models/2322757?type=Model&format=SafeTensor"
	# Jib's Qwen Nudity Fixer Lora
	"https://civitai.com/api/download/models/2199719?type=Model&format=SafeTensor"
	# SamsungCam UltraReal
	"https://civitai.com/api/download/models/2270374?type=Model&format=SafeTensor"

)

ESRGAN_MODELS=(
    "https://huggingface.co/Phips/4xNomosWebPhoto_RealPLKSR/resolve/main/4xNomosWebPhoto_RealPLKSR.safetensors"
	"https://github.com/Phhofm/models/releases/download/4xNomosWebPhoto_RealPLKSR/"
	"https://github.com/Phhofm/models/releases/download/4xNomosWebPhoto_RealPLKSR/4xNomosWebPhoto_RealPLKSR.pth"
)

CONTROLNET_MODELS=(
    "https://huggingface.co/Comfy-Org/Qwen-Image-InstantX-ControlNets/resolve/main/split_files/controlnet/Qwen-Image-InstantX-ControlNet-Union.safetensors"
	"https://huggingface.co/Comfy-Org/Qwen-Image-InstantX-ControlNets/resolve/main/split_files/controlnet/Qwen-Image-InstantX-ControlNet-Inpainting.safetensors"
)

TEXT_ENCODERS=(
    "https://huggingface.co/Comfy-Org/Qwen-Image_ComfyUI/resolve/main/split_files/text_encoders/qwen_2.5_vl_7b_fp8_scaled.safetensors"
	
)

DIFFUSION_MODELS=(
    "https://huggingface.co/Comfy-Org/Qwen-Image-Edit_ComfyUI/resolve/main/split_files/diffusion_models/qwen_image_edit_2509_fp8_e4m3fn.safetensors"
	"https://huggingface.co/Comfy-Org/lotus/resolve/main/lotus-depth-d-v1-1.safetensors"
	"https://huggingface.co/Comfy-Org/Qwen-Image_ComfyUI/resolve/main/split_files/diffusion_models/qwen_image_fp8_e4m3fn.safetensors"
	"https://civitai.com/api/download/models/2315751?type=Model&format=SafeTensor&size=pruned&fp=fp8"
	"https://civitai.com/api/download/models/2336581?type=Model&format=SafeTensor&size=pruned&fp=fp8"
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
        "${WORKSPACE}/storage/stable_diffusion/models/text_encoders" \
        "${TEXT_ENCODERS[@]}"
	provisioning_get_models \
        "${WORKSPACE}/storage/stable_diffusion/models/diffusion_models" \
        "${DIFFUSION_MODELS[@]}"
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
#    /opt/environments/python/comfyui/bin/huggingface-cli download Norby/loras --cache-dir $WORKSPACE/.cache --local-dir $WORKSPACE/ComfyUI/models/loras

#    /opt/environments/python/comfyui/bin/huggingface-cli download NorbyXL/forArt --cache-dir $WORKSPACE/.cache --local-dir $WORKSPACE/ComfyUI/models/loras/forArt
	
#	/opt/environments/python/comfyui/bin/huggingface-cli download Norby/loras --cache-dir $WORKSPACE/.cache --local-dir $WORKSPACE/ComfyUI/models/loras/Flux
	
#aria2c -x16 -s16 --dir="$WORKSPACE/ComfyUI/models/vae" \
#-o qwen_image_vae.safetensors \
#"https://huggingface.co/Comfy-Org/Qwen-Image_ComfyUI/resolve/main/split_files/vae/qwen_image_vae.safetensors"

#aria2c -x16 -s16 --dir="$WORKSPACE/ComfyUI/models/text_encoders" \
#-o qwen_2.5_vl_7b_fp8_scaled.safetensors \
#"https://huggingface.co/Comfy-Org/Qwen-Image_ComfyUI/resolve/main/split_files/text_encoders/qwen_2.5_vl_7b_fp8_scaled.safetensors"

#aria2c -x16 -s16 --dir="$WORKSPACE/ComfyUI/models/diffusion_models" \
#-o qwen_image_edit_2509_fp8_e4m3fn.safetensors \
#"https://huggingface.co/Comfy-Org/Qwen-Image-Edit_ComfyUI/resolve/main/split_files/diffusion_models/qwen_image_edit_2509_fp8_e4m3fn.safetensors"

#aria2c -x16 -s16 --dir="$WORKSPACE/ComfyUI/models/loras" \
#-o Qwen-Image-Edit-2509-Lightning-4steps-V1.0-bf16.safetensors \
#"https://huggingface.co/lightx2v/Qwen-Image-Lightning/resolve/main/Qwen-Image-Edit-2509/Qwen-Image-Edit-2509-Lightning-4steps-V1.0-bf16.safetensors"

#aria2c -x16 -s16 --dir="$WORKSPACE/ComfyUI/models/controlnet" \
#-o Qwen-Image-InstantX-ControlNet-Union.safetensors \
#"https://huggingface.co/Comfy-Org/Qwen-Image-InstantX-ControlNets/resolve/main/split_files/controlnet/Qwen-Image-InstantX-ControlNet-Union.safetensors"

#aria2c -x16 -s16 --dir="$WORKSPACE/ComfyUI/models/diffusion_models" \
#-o lotus-depth-d-v1-1.safetensors \
#"https://huggingface.co/Comfy-Org/lotus/resolve/main/lotus-depth-d-v1-1.safetensors"

#aria2c -x16 -s16 --dir="$WORKSPACE/ComfyUI/models/controlnet" \
#-o Qwen-Image-InstantX-ControlNet-Inpainting.safetensors \
#"https://huggingface.co/Comfy-Org/Qwen-Image-InstantX-ControlNets/resolve/main/split_files/controlnet/Qwen-Image-InstantX-ControlNet-Inpainting.safetensors"

#aria2c -x16 -s16 --dir="$WORKSPACE/ComfyUI/models/diffusion_models" \
#-o qwen_image_fp8_e4m3fn.safetensors \
#"https://huggingface.co/Comfy-Org/Qwen-Image_ComfyUI/resolve/main/split_files/diffusion_models/qwen_image_fp8_e4m3fn.safetensors"

#aria2c -x16 -s16 --dir="$WORKSPACE/ComfyUI/models/loras" \
#-o Qwen-Image-Lightning-4steps-V1.0.safetensors \
#"https://huggingface.co/lightx2v/Qwen-Image-Lightning/resolve/main/Qwen-Image-Lightning-4steps-V1.0.safetensors"

#aria2c -x16 -s16 --dir="$WORKSPACE/ComfyUI/models/vae" \
#-o vae-ft-mse-840000-ema-pruned.safetensors \
#"https://huggingface.co/stabilityai/sd-vae-ft-mse-original/resolve/main/vae-ft-mse-840000-ema-pruned.safetensors"

# pip uninstall -y torch torchvision torchaudio
# pip install torch torchvision torchaudio --index-url https://download.pytorch.org/whl/cu128
# pip install -U --pre triton
#maybe# pip install -U xformers

	
provisioning_start
