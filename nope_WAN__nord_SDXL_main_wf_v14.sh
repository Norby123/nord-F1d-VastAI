#!/bin/bash

# This file will be sourced in init.sh

# https://raw.githubusercontent.com/ai-dock/comfyui/main/config/provisioning/default.sh

# Packages are installed after nodes so we can fix them...

# on RTX 5090: force update ComfyUI.

# pip uninstall -y torch torchvision torchaudio
# pip install torch torchvision torchaudio --index-url https://download.pytorch.org/whl/cu128
# pip install -U --pre triton
#maybe# pip install -U xformers

DEFAULT_WORKFLOW="https://raw.githubusercontent.com/Norby123/nord-F1d-VastAI/refs/heads/main/_DU_main_workflow_v01.json"

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
	"https://github.com/Kosinkadink/ComfyUI-VideoHelperSuite"
)

CHECKPOINT_MODELS=(

)

CLIP_MODELS=(
	
)

UNET_MODELS=(
	 
)

VAE_MODELS=(
   	"https://huggingface.co/Comfy-Org/Wan_2.1_ComfyUI_repackaged/resolve/main/split_files/vae/wan_2.1_vae.safetensors"
	
)

LORA_MODELS=(
    #Studio Ghibli Wan2.1-T2V-14B - v1.0
	"https://civitai.com/api/download/models/1587891?type=Model&format=SafeTensor"
    #SingularUnity - Beautiful Blondes - Wan Video - v1.1
	"https://civitai.com/api/download/models/1559864?type=Model&format=SafeTensor"
    #Pillow Humping --- pillow part is too strong
	"https://civitai.com/api/download/models/1736343?type=Model&format=SafeTensor"
    #Anal From Behind (Wan) - v1.0 t2v
	"https://civitai.com/api/download/models/1754775?type=Model&format=SafeTensor"
    #Wan2.1 T2V 14B Double Penetration LoRA - v1.0
	"https://civitai.com/api/download/models/1768094?type=Model&format=SafeTensor"
    #Wan I2V - Assertive Cowgirl
	"https://civitai.com/api/download/models/1772841?type=Model&format=SafeTensor"
    #Wan 2.1 Big Natural Breasts - Saggy Tits, Huge Breasts, Lora, T2V, I2V - v2.0
	"https://civitai.com/api/download/models/1776890?type=Model&format=SafeTensor"
    #Lesbian/Solo/Mutual Pussy Play Wan2.1 14b - v1.0
	"https://civitai.com/api/download/models/1777417?type=Model&format=SafeTensor"
    #Penis Lora (Front View) [Taz] BETA - WAN 2.1 14b - v0.8
	"https://civitai.com/api/download/models/1787754?type=Model&format=SafeTensor"
    #Lez Make Out i2v 
	"https://civitai.com/api/download/models/1792573?type=Model&format=SafeTensor"
    #Ass Stretch/Grab - WAN 2.1 I2V 480p - v0.1
	"https://civitai.com/api/download/models/1796171?type=Model&format=SafeTensor"
    #Side lying Sex - Wan I2V 14B 480p
	"https://civitai.com/api/download/models/1538301?type=Model&format=SafeTensor"
    #Better Titfuck WAN14B All purpose
    "https://civitai.com/api/download/models/1691105?type=Model&format=SafeTensor"
	#Bouncing Boobs - Wan I2V 14B V_01
	"https://civitai.com/api/download/models/1517164?type=Model&format=SafeTensor"
	#Doggystyle side view 14B
	"https://civitai.com/api/download/models/1549343?type=Model&format=SafeTensor"
	#SingularUnity - Twerk - Wan2.1 I2V
	"https://civitai.com/api/download/models/1631257?type=Model&format=SafeTensor"
	#NSFW/Female Genitals helper for Wan T2V/I2V v1.0
	"https://civitai.com/api/download/models/1621698?type=Model&format=SafeTensor"
	#Female Orgasm LoRA for Wan2.1 I2V
	"https://civitai.com/api/download/models/1740524?type=Model&format=SafeTensor"
	#Wan2.1-14B Elegant BJ - v1
	"https://civitai.com/api/download/models/1740246?type=Model&format=SafeTensor"
	#Showing ass WAN 2.1 i2v/t2v
	"https://civitai.com/api/download/models/1738103?type=Model&format=SafeTensor"
	#Passionate Kissing v1.0 WAN 14B
	"https://civitai.com/api/download/models/1574869?type=Model&format=SafeTensor"
	#Wan 2.1 Penis - Cock, Dick, , Lora, T2V, I2V
	"https://civitai.com/api/download/models/1534254?type=Model&format=SafeTensor"
	#Trans Woman/Futanari/Male Masturbation
	"https://civitai.com/api/download/models/1675054?type=Model&format=SafeTensor"
	#Spanking for Wan I2V 14B
	"https://civitai.com/api/download/models/1674260?type=Model&format=SafeTensor"
	#Devil Light Effects v1.1
	"https://civitai.com/api/download/models/1674048?type=Model&format=SafeTensor"
	#WAN DR34MJOB - Double/Single/Handy Blowjob - T2V_HD
	"https://civitai.com/api/download/models/1672099?type=Model&format=SafeTensor"
	#WAN DR34MJOB - Double/Single/Handy Blowjob - v1.0_I2V
	"https://civitai.com/api/download/models/1610465?type=Model&format=SafeTensor"
	#Exotic Dancer (Yet Another Sexy Dancer Lora) Exotic Dancer WAN v1.0
	"https://civitai.com/api/download/models/1671188?type=Model&format=SafeTensor"
	#Amorous Lesbian Kisses Wan-v1 
	"https://civitai.com/api/download/models/1670972?type=Model&format=SafeTensor"
	#[Wan2.1]子弹时间|Bullet Time_I2V14b Lora - v1.0
	"https://civitai.com/api/download/models/1668789?type=Model&format=SafeTensor"
	#Exotic Breast Massage (Yet Another Breast Massage Lora for Hunyuan and Wan2.1) - br38st-m8ss8g3-wan v1.0
	"https://civitai.com/api/download/models/1663812?type=Model&format=SafeTensor"
	#Mating Press (Wan) - v1.0 (i2v)
	"https://civitai.com/api/download/models/1663271?type=Model&format=SafeTensor"
	#Wan Cowgirl - v1.3
	"https://civitai.com/api/download/models/1660695?type=Model&format=SafeTensor"
	#POV Blowjob - T2V & I2V
	"https://civitai.com/api/download/models/1657826?type=Model&format=SafeTensor"
	#WAN2.1 Facefuck
	"https://civitai.com/api/download/models/1652726?type=Model&format=SafeTensor"
	#Hand in Panties - Masturbation v0.3 - i2v & t2v 14B 
	"https://civitai.com/api/download/models/1578828?type=Model&format=SafeTensor"
	#WAN AI LoRA for Breast Lick/Suck. T2V/I2V
	"https://civitai.com/api/download/models/1677668?type=Model&format=SafeTensor"
	#Grinding V2 - Alpha
	"https://civitai.com/api/download/models/1681144?type=Model&format=SafeTensor"
	#BBC Blowjob - Wan2.1 T2V 14B
	"https://civitai.com/api/download/models/1691261?type=Model&format=SafeTensor"
	#Deepthroat - Wan 2.1 I2V - v1.0
	"https://civitai.com/api/download/models/1693883?type=Model&format=SafeTensor"
	#JAV Company (海外版) uncensored- RedCraft - vol.7 2girls1dick
	"https://civitai.com/api/download/models/1693822?type=Model&format=SafeTensor"
	#Fingering for Wan T2V/I2V - v1.1
	"https://civitai.com/api/download/models/1694292?type=Model&format=SafeTensor"
	#Wan Bulge POV Missionary (I2V) - v1.1
	"https://civitai.com/api/download/models/1698719?type=Model&format=SafeTensor"
	#Anal Missionary (Wan)
	"https://civitai.com/api/download/models/1700298?type=Model&format=SafeTensor"
	#WAN French kissing v1 - v1.0
	"https://civitai.com/api/download/models/1701424?type=Model&format=SafeTensor"
	#Carry and Lift Sex WAN 2.1 I2V - v1.0
	"https://civitai.com/api/download/models/1703980?type=Model&format=SafeTensor"
	#Wan 2.1 Deepthroat / Facefuck Entry - Blowjob, Fellatio, Oral, Lora, T2V 14B - v1.0
	"https://civitai.com/api/download/models/1713992?type=Model&format=SafeTensor"
	#wan_effect i2v 480p - v1.0
	"https://civitai.com/api/download/models/1717610?type=Model&format=SafeTensor"
	#Cunnilingus WAN2.1 T2V 14b - v1.0
	"https://civitai.com/api/download/models/1718150?type=Model&format=SafeTensor"
	#Breast Expansion Wan I2V
	"https://civitai.com/api/download/models/1728992?type=Model&format=SafeTensor"
	#Breast Expansion Wan I2V
	"https://civitai.com/api/download/models/1728992?type=Model&format=SafeTensor"
	#Wan - Taker POV Fellatio - I2V
	"https://civitai.com/api/download/models/1734893?type=Model&format=SafeTensor"
	#Penis Lora (Front View) [Taz] BETA - WAN 2.1 14b / 1.3b T2V
	"https://civitai.com/api/download/models/1710387?type=Model&format=SafeTensor"
	#Crawling Away - t2v-14B 
	"https://civitai.com/api/download/models/1749250?type=Model&format=SafeTensor"
	#NORDEHARTET/TETRA 3D VIDEO GENERATION
	"https://civitai.com/api/download/models/1712946?type=Model&format=SafeTensor"
	#Gangbang Missionary Sex WAN 2.1 I2V - WAN i2v 
	"https://civitai.com/api/download/models/1752839?type=Model&format=SafeTensor"
	#Passionate Missionary - T2V Wan2.1 14B
	"https://civitai.com/api/download/models/1752764?type=Model&format=SafeTensor"
	#Wan Full Nelson (I2V) - v1.0 
	"https://civitai.com/api/download/models/1630562?type=Model&format=SafeTensor"
	#Wan T2V 14b Doggystyle - v3.0
	"https://civitai.com/api/download/models/1630992?type=Model&format=SafeTensor"
	#Female Masturbation (1st/3rd person fingering + breast grasp enhancement) WAN2.1
	"https://civitai.com/api/download/models/1633941?type=Model&format=SafeTensor"
	#BBC Ride WAN
	"https://civitai.com/api/download/models/1642682?type=Model&format=SafeTensor"
	#WAN2.1 FUTANARI
	"https://civitai.com/api/download/models/1636171?type=Model&format=SafeTensor"
	# I2V POV Face Sitting highh
	"https://civitai.com/api/download/models/2383654?type=Model&format=SafeTensor"
	# I2V POV Face Sitting highh
	"https://civitai.com/api/download/models/2383643?type=Model&format=SafeTensor"
	# Crawling Away high
	"https://civitai.com/api/download/models/2380479?type=Model&format=SafeTensor"
	# Crawling Away low
	"https://civitai.com/api/download/models/2380487?type=Model&format=SafeTensor"
	# Missionary Sex - Multiple Angles (T2V & I2V) High
	"https://civitai.com/api/download/models/2176194?type=Model&format=SafeTensor"
	# Missionary Sex - Multiple Angles (T2V & I2V) Low
	"https://civitai.com/api/download/models/2176200?type=Model&format=SafeTensor"
	# WAN2.2 TWERK High
	"https://civitai.com/api/download/models/2376253?type=Model&format=SafeTensor"
	# WAN2.2 TWERK Low
	"https://civitai.com/api/download/models/2376296?type=Model&format=SafeTensor"
	# Pronebone Sex Position High
	"https://civitai.com/api/download/models/2364056?type=Model&format=SafeTensor"
	# Pronebone Sex Position Low
	"https://civitai.com/api/download/models/2364069?type=Model&format=SafeTensor"
	
)

ESRGAN_MODELS=(
    #"https://huggingface.co/Phips/4xNomosWebPhoto_RealPLKSR/resolve/main/4xNomosWebPhoto_RealPLKSR.safetensors"
	#"https://github.com/Phhofm/models/releases/download/4xNomosWebPhoto_RealPLKSR/"
	#"https://github.com/Phhofm/models/releases/download/4xNomosWebPhoto_RealPLKSR/4xNomosWebPhoto_RealPLKSR.pth"
)

CONTROLNET_MODELS=(
    #"https://huggingface.co/Kijai/DepthAnythingV2-safetensors/resolve/main/depth_anything_v2_vitl_fp32.safetensors"
	#"https://huggingface.co/xinsir/controlnet-union-sdxl-1.0/resolve/main/diffusion_pytorch_model_promax.safetensors"
	#"https://huggingface.co/lllyasviel/sd_control_collection/resolve/main/thibaud_xl_openpose_256lora.safetensors"
	#"https://huggingface.co/stabilityai/control-lora/resolve/main/control-LoRAs-rank256/control-lora-canny-rank256.safetensors"
	
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
 # Download clip_vision_h - to models/clip_vision
/opt/environments/python/comfyui/bin/huggingface-cli download Comfy-Org/Wan_2.1_ComfyUI_repackaged \
    --include "split_files/clip_vision/clip_vision_h.safetensors" \
    --cache-dir "$WORKSPACE/.cache" \
    --local-dir "$WORKSPACE/ComfyUI/models/clip_vision"

# Download wan2.1_i2v_720p_14B_bf16 - to models/diffusion_models
/opt/environments/python/comfyui/bin/huggingface-cli download Comfy-Org/Wan_2.1_ComfyUI_repackaged \
    --include "split_files/diffusion_models/wan2.1_i2v_720p_14B_bf16.safetensors" \
    --cache-dir "$WORKSPACE/.cache" \
    --local-dir "$WORKSPACE/ComfyUI/models/diffusion_models"

# Download Kijai's wan2.1_i2v_720p_14B_FP_e4m3fn - to models/diffusion_models
/opt/environments/python/comfyui/bin/huggingface-cli download Kijai/WanVideo_comfy \
    --include "Wan2_1-I2V-14B-720P_fp8_e4m3fn.safetensors" \
    --cache-dir "$WORKSPACE/.cache" \
    --local-dir "$WORKSPACE/ComfyUI/models/diffusion_models"

# Download umt5_xxl to models/text_encoders
/opt/environments/python/comfyui/bin/huggingface-cli download Comfy-Org/Wan_2.1_ComfyUI_repackaged \
    --include "split_files/text_encoders/umt5_xxl_fp16.safetensors" \
    --cache-dir "$WORKSPACE/.cache" \
    --local-dir "$WORKSPACE/ComfyUI/models/text_encoders"

# Download umt5_xxl bf16 to models/text_encoders
/opt/environments/python/comfyui/bin/huggingface-cli download Kijai/WanVideo_comfy \
	--include "umt5-xxl-enc-bf16.safetensors" \
	--cache-dir "$WORKSPACE/.cache" \
	--local-dir "$WORKSPACE/ComfyUI/models/text_encoders"
	
# Kijai's open-clip-xlm-roberta-large-vit-huge-14_fp16 to  clip_vision
/opt/environments/python/comfyui/bin/huggingface-cli download Kijai/WanVideo_comfy \
    --include "open-clip-xlm-roberta-large-vit-huge-14_fp16.safetensors"
	--cache-dir "$WORKSPACE/.cache" \
	--local-dir "$WORKSPACE/ComfyUI/models/clip_vision"	
	
	/opt/environments/python/comfyui/bin/huggingface-cli download NorbyXL/WAN2 --cache-dir $WORKSPACE/.cache --local-dir $WORKSPACE/ComfyUI/models/loras
	/opt/environments/python/comfyui/bin/huggingface-cli download NorbyXL/WAN_2_2_Loras --cache-dir $WORKSPACE/.cache --local-dir $WORKSPACE/ComfyUI/models/loras
	
provisioning_start


