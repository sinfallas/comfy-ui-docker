# unofficial comfy-ui docker image

[![Ask DeepWiki](https://deepwiki.com/badge.svg)](https://deepwiki.com/sinfallas/comfy-ui-docker)

The TAG corresponds to the release version of comfy-ui and the GPU (nvidia,amd,intel)

To run use the **docker-compose.yml** file

Get this image on:
* https://hub.docker.com/r/sinfallas/comfyui

ComfyUI git:
* https://github.com/comfyanonymous/ComfyUI

## Optional: ComfyUI Manager legacy interface

The Docker image enables the integrated ComfyUI Manager by default. If you need the legacy Manager web interface, override the container command in your `docker-compose.yml`:

```yaml
services:
  comfyui:
    image: sinfallas/comfyui:0.36.0-nvidia
    command:
      - python
      - main.py
      - --listen
      - 0.0.0.0
      - --port
      - "8188"
      - --enable-manager
      - --enable-manager-legacy-ui
    ports:
      - "8188:8188"
    # Keep your existing GPU, environment, and volume settings.
```

This option is **not enabled by default**. The example overrides the image's startup command; it does not install or restore custom-node dependencies.
