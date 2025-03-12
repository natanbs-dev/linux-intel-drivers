#!/bin/bash

# Script: Intel Setup for Fedora Live Mode (No Reboot)
# Autor: ChatGPT (adaptado a pedido)
# Objetivo: Instalar drivers Intel, VAAPI, Vulkan e ferramentas de diagnóstico no Fedora Live
# OBS: Este script NÃO reinicia o sistema. Ideal para testes de compatibilidade e performance em live USB.

echo "========== Atualizando sistema =========="
sudo dnf update --refresh -y

echo "========== Habilitando RPM Fusion (Free e Non-Free) =========="
sudo dnf install -y https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm
sudo dnf install -y https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm

echo "========== Instalando drivers VAAPI, Intel Media e Vulkan =========="
sudo dnf install -y libva-intel-driver intel-media-driver mesa-vulkan-drivers mesa-va-drivers

echo "========== Instalando ferramentas de diagnóstico =========="
sudo dnf install -y intel-gpu-tools vulkan-tools mesa-utils

echo "========== Checando informações da GPU Intel (driver em uso) =========="
lspci -k | grep -EA3 'VGA|3D|Display'

echo "========== Testando suporte VAAPI =========="
vainfo || echo "VAAPI não detectado ou erro ao rodar o vainfo."

echo "========== Testando suporte Vulkan =========="
vulkaninfo | grep "deviceName" || echo "Vulkan não detectado ou erro ao rodar o vulkaninfo."

echo "========== Checando driver OpenGL em uso =========="
glxinfo | grep "OpenGL renderer" || echo "OpenGL não detectado ou erro ao rodar o glxinfo."

echo "========== Mostrando uso da GPU Intel em tempo real (Pressione CTRL+C para sair) =========="
intel_gpu_top

echo "========== Script finalizado com sucesso =========="
echo "Drivers e ferramentas instalados. Testes foram realizados. Aproveite sua sessão Live!"
