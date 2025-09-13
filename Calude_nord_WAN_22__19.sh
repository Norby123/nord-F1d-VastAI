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
    #"https://huggingface.co/zer0int/CLIP-GmP-ViT-L-14/resolve/main/ViT-L-14-BEST-smooth-GmP-TE-only-HF-format.safetensors"
    #"https://huggingface.co/zer0int/CLIP-GmP-ViT-L-14/resolve/main/ViT-L-14-TEXT-detail-improved-hiT-GmP-TE-only-HF.safetensors"
	#"https://huggingface.co/city96/t5-v1_1-xxl-encoder-gguf/resolve/main/t5-v1_1-xxl-encoder-Q8_0.gguf"
	#"https://huggingface.co/black-forest-labs/FLUX.1-dev/resolve/main/ae.safetensors"
	#"https://civitai.com/api/download/models/711305?type=Model&format=SafeTensor"
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
#   "https://civitai.com/api/download/models/1945998?type=Model&format=SafeTensor&size=full&fp=fp16"
   # Fux Capacity NSFW - v3.0 - FP16
#   "https://civitai.com/api/download/models/1996179?type=Model&format=SafeTensor&size=pruned&fp=fp16"
   # Persephone Flux NSFW v1.0 - FP16
#   "https://civitai.com/api/download/models/2008873?type=Model&format=SafeTensor&size=pruned&fp=fp16"
   # 
#   "https://civitai.com/api/download/models/1996104?type=Model&format=SafeTensor&size=pruned&fp=fp16"
)

VAE_MODELS=(
    "https://huggingface.co/black-forest-labs/FLUX.1-dev/resolve/main/ae.safetensors"
	"https://civitai.com/api/download/models/711305?type=Model&format=SafeTensor"
	"https://huggingface.co/lovis93/testllm/resolve/ed9cf1af7465cebca4649157f118e331cf2a084f/ae.safetensors"
	#"https://huggingface.co/NorbyXL/vae/resolve/main/ponyStandardVAE_v10.safetensors"
	#"https://huggingface.co/NorbyXL/vae/resolve/main/vae-ft-MSE(picivel_jobb)-840000-ema-pruned.ckpt"
	"https://huggingface.co/Comfy-Org/Wan_2.2_ComfyUI_Repackaged/resolve/main/split_files/vae/wan_2.1_vae.safetensors"
)

LORA_MODELS=(
	# Blowbang - High & Low
	"https://civitai.com/api/download/models/2185444?type=Model&format=SafeTensor"
	"https://civitai.com/api/download/models/2185457?type=Model&format=SafeTensor"
	# Missionary Anal Trans - High & Low
	"https://civitai.com/api/download/models/2184696?type=Model&format=SafeTensor"
	"https://civitai.com/api/download/models/2184716?type=Model&format=SafeTensor"
	# Belly dancing - - High & Low
	"https://civitai.com/api/download/models/2184498?type=Model&format=SafeTensor"
	"https://civitai.com/api/download/models/2184511?type=Model&format=SafeTensor"
	# Kissing - Tongue Action T2V - - High & Low
	"https://civitai.com/api/download/models/2183947?type=Model&format=SafeTensor"
	"https://civitai.com/api/download/models/2183960?type=Model&format=SafeTensor"
	# Doggystyle Back View Trans - High & Low
	"https://civitai.com/api/download/models/2182041?type=Model&format=SafeTensor"
	"https://civitai.com/api/download/models/2182056?type=Model&format=SafeTensor"
	# Side sex/spooning Trans - High & Low
	"https://civitai.com/api/download/models/2181862?type=Model&format=SafeTensor"
	"https://civitai.com/api/download/models/2181900?type=Model&format=SafeTensor"
	# BBC Blowjob - High & Low
	"https://civitai.com/api/download/models/2181761?type=Model&format=SafeTensor"
	"https://civitai.com/api/download/models/2181775?type=Model&format=SafeTensor"
	# Reverse Cowgirl Trans - High & Low
	"https://civitai.com/api/download/models/2181700?type=Model&format=SafeTensor&size=full&fp=fp16"
	"https://civitai.com/api/download/models/2181739?type=Model&format=SafeTensor&size=full&fp=bf16"
	# Scissoring / Tribadism - High & Low
	"https://civitai.com/api/download/models/2188235?type=Model&format=SafeTensor"
	"https://civitai.com/api/download/models/2188241?type=Model&format=SafeTensor"
	# Kissing Passionately T2V - High & Low
	"https://civitai.com/api/download/models/2129086?type=Model&format=SafeTensor"
	"https://civitai.com/api/download/models/2129098?type=Model&format=SafeTensor"
	# Kissing Passionately I2V - High & Low
	"https://civitai.com/api/download/models/2186086?type=Model&format=SafeTensor"
	"https://civitai.com/api/download/models/2186130?type=Model&format=SafeTensor"
	# Orgasm I2V High & Low
	"https://civitai.com/api/download/models/2178013?type=Model&format=SafeTensor"
	"https://civitai.com/api/download/models/2178018?type=Model&format=SafeTensor"
	# Orgasm T2V - High & Low
	"https://civitai.com/api/download/models/2081822?type=Model&format=SafeTensor"
	"https://civitai.com/api/download/models/2081829?type=Model&format=SafeTensor"
	# Dildo Fucking Machine I2V - High & Low
	"https://civitai.com/api/download/models/2176313?type=Model&format=SafeTensor"
	"https://civitai.com/api/download/models/2176320?type=Model&format=SafeTensor"
	# Dildo Fucking Machine T2V - High & Low
	"https://civitai.com/api/download/models/2125393?type=Model&format=SafeTensor"
	"https://civitai.com/api/download/models/2125401?type=Model&format=SafeTensor"
	# Missionary Sex - Multiple Angles I2V - High & Low
	"https://civitai.com/api/download/models/2176194?type=Model&format=SafeTensor"
	"https://civitai.com/api/download/models/2176200?type=Model&format=SafeTensor"
	# Missionary Sex - Multiple Angles T2V - High & Low
	"https://civitai.com/api/download/models/2092905?type=Model&format=SafeTensor"
	"https://civitai.com/api/download/models/2092916?type=Model&format=SafeTensor"
	# Dildo Masturbation
	"https://civitai.com/api/download/models/2174896?type=Model&format=SafeTensor"
	"https://civitai.com/api/download/models/2174897?type=Model&format=SafeTensor"
	# Fitness Model T2V
	"https://civitai.com/api/download/models/2146192?type=Model&format=SafeTensor"
	"https://civitai.com/api/download/models/2146199?type=Model&format=SafeTensor"
	# Cameltoe T2V
	"https://civitai.com/api/download/models/2167917?type=Model&format=SafeTensor"
	"https://civitai.com/api/download/models/2167919?type=Model&format=SafeTensor"
	# POV Titty Fuck -T2V
	"https://civitai.com/api/download/models/2164377?type=Model&format=SafeTensor"
	"https://civitai.com/api/download/models/2164378?type=Model&format=SafeTensor"
	# POV Handjob T2V
	"https://civitai.com/api/download/models/2147499?type=Model&format=SafeTensor"
	"https://civitai.com/api/download/models/2147501?type=Model&format=SafeTensor"
	# Instagram Women T2V
	"https://civitai.com/api/download/models/2137755?type=Model&format=SafeTensor"
	"https://civitai.com/api/download/models/2137757?type=Model&format=SafeTensor"
	# Dildo Ride T2V
	"https://civitai.com/api/download/models/2140969?type=Model&format=SafeTensor"
	"https://civitai.com/api/download/models/2140970?type=Model&format=SafeTensor"
	# Lotus Position
	"https://civitai.com/api/download/models/2131735?type=Model&format=SafeTensor"
	"https://civitai.com/api/download/models/2131739?type=Model&format=SafeTensor"
	# Doggy Style Sex
	"https://civitai.com/api/download/models/2202386?type=Model&format=SafeTensor"
	"https://civitai.com/api/download/models/2202387?type=Model&format=SafeTensor"
	# Ultimate, Super Awesome, Better Than... Blowjob
	"https://civitai.com/api/download/models/2198699?type=Model&format=SafeTensor"
	"https://civitai.com/api/download/models/2198700?type=Model&format=SafeTensor"
	# Jerking Off T2V
	"https://civitai.com/api/download/models/2192645?type=Model&format=SafeTensor"
	"https://civitai.com/api/download/models/2192648?type=Model&format=SafeTensor"
	# Jerking Off I2V
	"https://civitai.com/api/download/models/2208830?type=Model&format=SafeTensor"
	"https://civitai.com/api/download/models/2208833?type=Model&format=SafeTensor"
	# Handjobs T2V
	"https://civitai.com/api/download/models/2208084?type=Model&format=SafeTensor"
	"https://civitai.com/api/download/models/2208094?type=Model&format=SafeTensor"
	# Bouncy Forward Bends
	"https://civitai.com/api/download/models/2207480?type=Model&format=SafeTensor"
	"https://civitai.com/api/download/models/2207776?type=Model&format=SafeTensor"
	# POV
	"https://civitai.com/api/download/models/2204122?type=Model&format=SafeTensor"
	# low for above?
	# Pov_Blowjob (high noise only)
	"https://civitai.com/api/download/models/2155928?type=Model&format=SafeTensor"
	# Pregnant Women / Large Areolas T2V
	"https://civitai.com/api/download/models/2189905?type=Model&format=SafeTensor"
	"https://civitai.com/api/download/models/2189927?type=Model&format=SafeTensor"
	# Male finishing [Anime]
	"https://civitai.com/api/download/models/2203637?type=Model&format=SafeTensor"
	"https://civitai.com/api/download/models/2203608?type=Model&format=SafeTensor"
	# Walking v4 (and bouncing)
	"https://civitai.com/api/download/models/2203596?type=Model&format=SafeTensor"
	"https://civitai.com/api/download/models/2203589?type=Model&format=SafeTensor"
	# JIGGLE (ass from behind)
	"https://civitai.com/api/download/models/2203375?type=Model&format=SafeTensor"
	"https://civitai.com/api/download/models/2203349?type=Model&format=SafeTensor"
	# Wan2.2_TV2_cum_in_mouth  (high and Low merged together, mind2 lorahoz)
	"https://civitai.com/api/download/models/2201881?type=Model&format=SafeTensor"
	# Slop Bounce I2V - ZIP FILE, NEEDS TO BE EXTRACTED
	"https://civitai.com/api/download/models/2200388?type=Model&format=Diffusers"
	# Slop Bounce NEW I2V
	"https://civitai.com/api/download/models/2209354?type=Model&format=SafeTensor"
	"https://civitai.com/api/download/models/2209344?type=Model&format=SafeTensor"
	# POV Insertion  - ZIP FILE, NEEDS TO BE EXTRACTED
	"https://civitai.com/api/download/models/2200389?type=Model&format=Diffusers"
	# Sex FOV Slider - ZIP FILE, NEEDS TO BE EXTRACTED
	"https://civitai.com/api/download/models/2177091?type=Model&format=Diffusers"
	# Oral Insertion - ZIP FILE, NEEDS TO BE EXTRACTED
	"https://civitai.com/api/download/models/2121297?type=Model&format=Diffusers"
	# Torpedo Tits v1.1
	"https://civitai.com/api/download/models/2200144?type=Model&format=SafeTensor"
	"https://civitai.com/api/download/models/2200134?type=Model&format=SafeTensor"
	# COWGIRL + REVERSE COWGIRL I2V
	"https://civitai.com/api/download/models/2156392?type=Model&format=SafeTensor"
	"https://civitai.com/api/download/models/2156435?type=Model&format=SafeTensor"
	# dancing v2.0
	"https://civitai.com/api/download/models/2198535?type=Model&format=SafeTensor"
	"https://civitai.com/api/download/models/2198546?type=Model&format=SafeTensor"
	# FaceFuck T2V
	"https://civitai.com/api/download/models/2196859?type=Model&format=SafeTensor"
	"https://civitai.com/api/download/models/2196912?type=Model&format=SafeTensor"
	# Ultimate DeepThroat I2V  v1.1
	"https://civitai.com/api/download/models/2122049?type=Model&format=SafeTensor"
	"https://civitai.com/api/download/models/2191446?type=Model&format=SafeTensor"
	#Wan NSFW Posing Nude - I2V
	"https://civitai.com/api/download/models/2195862?type=Model&format=SafeTensor"
	"https://civitai.com/api/download/models/2195866?type=Model&format=SafeTensor"
	# Deepthroat, Blowjob T2V
	"https://civitai.com/api/download/models/2195559?type=Model&format=SafeTensor"
	"https://civitai.com/api/download/models/2195625?type=Model&format=SafeTensor"
	# Deepthroat, Blowjob I2V
	"https://civitai.com/api/download/models/2152516?type=Model&format=SafeTensor"
	"https://civitai.com/api/download/models/2152583?type=Model&format=SafeTensor"
	# Bouncy Walk I2V
	"https://civitai.com/api/download/models/2194924?type=Model&format=SafeTensor"
	"https://civitai.com/api/download/models/2194905?type=Model&format=SafeTensor"
	# Bouncing Boobs
	"https://civitai.com/api/download/models/2191217?type=Model&format=SafeTensor"
	"https://civitai.com/api/download/models/2191270?type=Model&format=SafeTensor"
	# WAN DR34ML4Y - All-In-One NSFW - I2V
	"https://civitai.com/api/download/models/2176505?type=Model&format=SafeTensor"
	"https://civitai.com/api/download/models/2190476?type=Model&format=SafeTensor"
	# https://civitai.com/api/download/models/2190113?type=Model&format=SafeTensor
	"https://civitai.com/api/download/models/2190121?type=Model&format=SafeTensor"
	"https://civitai.com/api/download/models/2190113?type=Model&format=SafeTensor"
	# Standing Sex T2V
	"https://civitai.com/api/download/models/2189213?type=Model&format=SafeTensor"
	"https://civitai.com/api/download/models/2189234?type=Model&format=SafeTensor"
	# Face Down Ass Up
	"https://civitai.com/api/download/models/2183383?type=Model&format=SafeTensor"
	"https://civitai.com/api/download/models/2183388?type=Model&format=SafeTensor"
	# Huge Titfuck I2V
	"https://civitai.com/api/download/models/2180271?type=Model&format=SafeTensor"
	"https://civitai.com/api/download/models/2166737?type=Model&format=SafeTensor"
	# Huge Titfuck T2V 
	"https://civitai.com/api/download/models/2113488?type=Model&format=SafeTensor"
	"https://civitai.com/api/download/models/2113665?type=Model&format=SafeTensor"
	# Action from behind v0.1
	"https://civitai.com/api/download/models/2183000?type=Model&format=SafeTensor"
	"https://civitai.com/api/download/models/2182983?type=Model&format=SafeTensor"
	# Robots
	"https://civitai.com/api/download/models/2175596?type=Model&format=SafeTensor"
	"https://civitai.com/api/download/models/2175559?type=Model&format=SafeTensor"
	# "PAWG" (Phat Ass White Girl) T2V 
	"https://civitai.com/api/download/models/2171005?type=Model&format=SafeTensor"
	"https://civitai.com/api/download/models/2171386?type=Model&format=SafeTensor"
	# Spoon by MQ Lab T2V 
	"https://civitai.com/api/download/models/2169679?type=Model&format=SafeTensor"
	"https://civitai.com/api/download/models/2169632?type=Model&format=SafeTensor"
	# POV Cowgirl v1.0
	"https://civitai.com/api/download/models/2169837?type=Model&format=SafeTensor"
	"https://civitai.com/api/download/models/2169847?type=Model&format=SafeTensor"
	# Hairy Alternative women
	"https://civitai.com/api/download/models/2159169?type=Model&format=SafeTensor"
	"https://civitai.com/api/download/models/2159197?type=Model&format=SafeTensor"
	# Hairy Alternative women - other
	"https://civitai.com/api/download/models/2169412?type=Model&format=SafeTensor"
	"https://civitai.com/api/download/models/2169440?type=Model&format=SafeTensor"
	# Chubby Curvy Voluptuous Women T2V
	"https://civitai.com/api/download/models/2139294?type=Model&format=SafeTensor"
	"https://civitai.com/api/download/models/2139291?type=Model&format=SafeTensor"
	# Breast Play (T2V/I2V)
	"https://civitai.com/api/download/models/2165895?type=Model&format=SafeTensor"
	"https://civitai.com/api/download/models/2165919?type=Model&format=SafeTensor"
	# reverse suspended congress I2V
	"https://civitai.com/api/download/models/2145089?type=Model&format=SafeTensor"
	"https://civitai.com/api/download/models/2145156?type=Model&format=SafeTensor"
	# reverse suspended congress T2V
	"https://civitai.com/api/download/models/2165165?type=Model&format=SafeTensor"
	"https://civitai.com/api/download/models/2165335?type=Model&format=SafeTensor"
	# Black People for WAN 2.1 & 2.2
	"https://civitai.com/api/download/models/2084288?type=Model&format=SafeTensor"
	# POV Missionary - High Noise Only
	"https://civitai.com/api/download/models/2110439?type=Model&format=SafeTensor"
	# Massage tits by MQ Lab - I2V 
	"https://civitai.com/api/download/models/2210306?type=Model&format=SafeTensor"
	"https://civitai.com/api/download/models/2210320?type=Model&format=SafeTensor"
	# Doggy by MQ Lab - T2V 
	"https://civitai.com/api/download/models/2176892?type=Model&format=SafeTensor"
	"https://civitai.com/api/download/models/2176919?type=Model&format=SafeTensor"
	# Perfect Fingering - Wan 2.2 I2V
	"https://civitai.com/api/download/models/2209275?type=Model&format=SafeTensor"
	"https://civitai.com/api/download/models/2209481?type=Model&format=SafeTensor"
	# 
	"
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
    
    # Download Hugging Face models
    provisioning_get_huggingface_models
    
    # Update PyTorch for RTX 5090 compatibility
    #provisioning_update_pytorch
    
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

function provisioning_get_huggingface_models() {
    printf "Downloading Hugging Face models...\n"
    
    # Download main LoRAs
    printf "Downloading LoRAs from Norby/loras...\n"
    /opt/environments/python/comfyui/bin/huggingface-cli download Norby/loras \
        --cache-dir $WORKSPACE/.cache \
        --local-dir $WORKSPACE/ComfyUI/models/loras
    
    # Download WAN 2.2 text encoders
    printf "Downloading WAN 2.1 text encoders...\n"
    /opt/environments/python/comfyui/bin/huggingface-cli download Comfy-Org/Wan_2.1_ComfyUI_repackaged \
        --cache-dir $WORKSPACE/.cache \
        --local-dir $WORKSPACE/ComfyUI/models/text_encoders \
        --include "split_files/text_encoders/umt5_xxl_fp8_e4m3fn_scaled.safetensors"
    
    # Download WAN 2.2 VAE
    printf "Downloading WAN 2.1 VAE...\n"
    /opt/environments/python/comfyui/bin/huggingface-cli download Comfy-Org/Wan_2.2_ComfyUI_Repackaged \
        --cache-dir $WORKSPACE/.cache \
        --local-dir $WORKSPACE/ComfyUI/models/vae \
        --include "split_files/vae/wan_2.1_vae.safetensors"
    
    # Download WAN 2.2 diffusion models
    printf "Downloading WAN 2.2 high noise diffusion model...\n"
    /opt/environments/python/comfyui/bin/huggingface-cli download Comfy-Org/Wan_2.2_ComfyUI_Repackaged \
        --cache-dir $WORKSPACE/.cache \
        --local-dir $WORKSPACE/ComfyUI/models/diffusion_models \
        --include "split_files/diffusion_models/wan2.2_i2v_high_noise_14B_fp8_scaled.safetensors"
    
    printf "Downloading WAN 2.2 low noise diffusion model...\n"
    /opt/environments/python/comfyui/bin/huggingface-cli download Comfy-Org/Wan_2.2_ComfyUI_Repackaged \
        --cache-dir $WORKSPACE/.cache \
        --local-dir $WORKSPACE/ComfyUI/models/diffusion_models \
        --include "split_files/diffusion_models/wan2.2_i2v_low_noise_14B_fp8_scaled.safetensors"
    
    # Download WAN 2.2 LoRAs
    printf "Downloading WAN 2.2 high noise LoRA...\n"
    /opt/environments/python/comfyui/bin/huggingface-cli download Comfy-Org/Wan_2.2_ComfyUI_Repackaged \
        --cache-dir $WORKSPACE/.cache \
        --local-dir $WORKSPACE/ComfyUI/models/loras \
        --include "split_files/loras/wan2.2_i2v_lightx2v_4steps_lora_v1_high_noise.safetensors"
    
    printf "Downloading WAN 2.2 low noise LoRA...\n"
    /opt/environments/python/comfyui/bin/huggingface-cli download Comfy-Org/Wan_2.2_ComfyUI_Repackaged \
        --cache-dir $WORKSPACE/.cache \
        --local-dir $WORKSPACE/ComfyUI/models/loras \
        --include "split_files/loras/wan2.2_i2v_lightx2v_4steps_lora_v1_low_noise.safetensors"
    
    printf "Hugging Face models download complete.\n"
}

function provisioning_update_pytorch() {
    printf "Updating PyTorch for RTX 5090 compatibility...\n"
    "$COMFYUI_VENV_PIP" uninstall -y torch torchvision torchaudio
    "$COMFYUI_VENV_PIP" install torch torchvision torchaudio --index-url https://download.pytorch.org/whl/cu128
    "$COMFYUI_VENV_PIP" install -U --pre triton
    # "$COMFYUI_VENV_PIP" install -U xformers (commented out as it may cause issues)
    printf "PyTorch update complete.\n"
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

# Start the provisioning process
provisioning_start