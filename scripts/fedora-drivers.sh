#!/bin/bash

# Atualiza o sistema
sudo dnf update -y

# Instala os drivers Intel mais recentes
sudo dnf install -y intel-media-driver libva-intel-driver

# Instala o vainfo para verificar o driver VA-API
sudo dnf install -y vainfo

# Verifica o driver em uso
vainfo

# Pergunta ao usuário se deseja habilitar o RPM Fusion
read -p "Deseja habilitar o repositório RPM Fusion para pacotes mais recentes? (s/n): " resposta
if [[ "$resposta" =~ ^[Ss]$ ]]; then
    # Habilita o repositório RPM Fusion
    sudo dnf install -y https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm \
        https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
    
    # Atualiza novamente após habilitar o RPM Fusion
    sudo dnf update -y
fi
