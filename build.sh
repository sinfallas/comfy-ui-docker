#!/usr/bin/env bash
# Made by Sinfallas <sinfallas@yahoo.com>
# Licence: GPL-2
CURRENT_DATE=$(date -u +'%Y-%m-%dT%H:%M:%SZ')
version="0.46.0"

if [[ "$EUID" = "0" ]]; then
	echo -e "\e[00;31mERROR: NO debe ser root.\e[00m"
	exit 1
fi

##### amd
docker build --build-arg BUILD_DATE=$CURRENT_DATE -t comfyuia -f Dockerfile-amd .
docker image tag comfyuia sinfallas/comfyui:"$version"-amd && docker image push sinfallas/comfyui:"$version"-amd
##### amd-RDNA3
docker build --build-arg BUILD_DATE=$CURRENT_DATE -t comfyuia-rdna3 -f Dockerfile-amd-RDNA3 .
docker image tag comfyuia-rdna3 sinfallas/comfyui:"$version"-amd-rdna3 && docker image push sinfallas/comfyui:"$version"-amd-rdna3
##### amd-RDNA3.5
docker build --build-arg BUILD_DATE=$CURRENT_DATE -t comfyuia-rdna35 -f Dockerfile-amd-RDNA35 .
docker image tag comfyuia-rdna35 sinfallas/comfyui:"$version"-amd-rdna35 && docker image push sinfallas/comfyui:"$version"-amd-rdna35
##### amd-RDNA4
docker build --build-arg BUILD_DATE=$CURRENT_DATE -t comfyuia-rdna4 -f Dockerfile-amd-RDNA4 .
docker image tag comfyuia-rdna4 sinfallas/comfyui:"$version"-amd-rdna4 && docker image push sinfallas/comfyui:"$version"-amd-rdna4
##### intel
docker build --build-arg BUILD_DATE=$CURRENT_DATE -t comfyuii -f Dockerfile-intel .
docker image tag comfyuii sinfallas/comfyui:"$version"-intel && docker image push sinfallas/comfyui:"$version"-intel
##### nvidia
docker build --build-arg BUILD_DATE=$CURRENT_DATE -t comfyuin -f Dockerfile-nvidia .
docker image tag comfyuin sinfallas/comfyui:"$version"-nvidia && docker image push sinfallas/comfyui:"$version"-nvidia

echo "finalizado..."
