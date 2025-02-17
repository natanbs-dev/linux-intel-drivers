#!/bin/bash

# Atualiza o sistema
sudo pacman -Syu

# Instala os drivers Intel mais recentes
sudo pacman -S intel-media-driver libva-utils

# Verifica o driver em uso
vainfo

# Pergunta ao usuário se deseja instalar drivers do AUR
read -p "Deseja instalar os drivers mais recentes do AUR? (s/n): " resposta
if [[ "$resposta" =~ ^[Ss]$ ]]; then
    # Instala o yay (um helper do AUR)
    sudo pacman -S yay

    # Instala os drivers Intel mais recentes do AUR
    yay -S intel-media-driver-git libva-utils

    # Verifica o driver em uso
    vainfo
fi
