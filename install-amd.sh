#!/usr/bin/env bash
# ComfyUI installer script for AMD cards.
set -e

printf "\033[0;33mInfo:\033[m Installing for AMD hardware. Make sure git, python and pip are installed.\n"

git clone https://github.com/comfyanonymous/ComfyUI.git

python3.12 -m venv venv
source venv/bin/activate

printf "\033[0;33mInfo:\033[m Installing python venv dependencies for AMD...\n"
# You might want to try using a newer or nightly version here if ComfyUI is not working for you.
# pip install --pre torch torchvision torchaudio --index-url https://download.pytorch.org/whl/nightly/rocm6.2
pip install torch torchvision torchaudio --index-url https://download.pytorch.org/whl/rocm6.1
pip install -r ComfyUI/requirements.txt

printf "Launch using 'launch.sh' script.\n"
printf "Install a checkpoint inside ComfyUI/models/checkpoints/ to get started.\n"

if [ "$1" = "--menu-entry" ]
then
    folder_path="$PWD/ComfyUI" # ComfyUI folder
    exec_path="$PWD/ComfyUI/ComfyUI" # Exec
    icon_path="$PWD/pictures/comfyui.svg" # ComfyUI Icon
    desktop-file-install --dir="$HOME/.local/share/applications/" --set-key=Path --set-value="$folder_path" --set-key=Exec --set-value="$exec_path" --set-icon="$icon_path" ComfyUI.desktop
fi

printf "\n\033[0;33mInfo:\033[m Finished\n"
