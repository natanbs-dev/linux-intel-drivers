#!/bin/bash

# Verifica se o script está sendo executado como root
if [ "$EUID" -ne 0 ]; then
  echo "Por favor, execute como root: sudo ./instalar_drivers_intel.sh"
  exit 1
fi

echo "Atualizando o sistema..."
sudo apt update && sudo apt upgrade -y

echo "Instalando os drivers Intel mais recentes..."
sudo apt install -y intel-microcode i965-va-driver intel-media-va-driver-non-free vainfo

echo "Verificando o driver instalado..."
vainfo

# Pergunta ao usuário se deseja ativar o PPA para drivers mais recentes
read -p "Deseja ativar o PPA Oibaf para drivers mais recentes? (s/n): " resposta
if [[ "$resposta" =~ ^[Ss]$ ]]; then
    echo "Adicionando o repositório Oibaf..."
    sudo add-apt-repository ppa:oibaf/graphics-drivers -y
    sudo apt update
    sudo apt upgrade -y
fi

echo "Instalação concluída! Reiniciando o sistema em 5 segundos..."
sleep 5
sudo reboot
