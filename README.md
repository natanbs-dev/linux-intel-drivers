# linux-intel-drivers

## arch/manjaro

No Arch Linux, os drivers Intel mais recentes estão disponíveis nos repositórios oficiais e no AUR. Siga os passos abaixo:
Instalar drivers Intel para aceleração de vídeo e codecs de mídia:


# Atualize o sistema
```bash
sudo pacman -Syu
```
# Instale os drivers Intel mais recentes
```bash
sudo pacman -S intel-media-driver libva-utils
```
# Verifique o driver em uso
```bash 
vainfo
```
Usar o AUR para drivers mais recentes (opcional):

# Instale o yay (um helper do AUR)
```bash
sudo pacman -S yay
```
# Instale os drivers Intel mais recentes do AUR
```bash
yay -S intel-media-driver-git libva-utils
```
# Verifique o driver em uso
```bash
vainfo
```

Verificação do Driver VA-API

Após instalar os drivers, você pode verificar se a aceleração de vídeo está funcionando corretamente com o comando vainfo. A saída deve mostrar o driver Intel em uso e os codecs suportados.

Exemplo de saída esperada:

libva info: VA-API version 1.15.0
libva info: User environment variable requested driver 'iHD'
libva info: Trying to open /usr/lib/x86_64-linux-gnu/dri/iHD_drv_video.so
libva info: Found init function __vaDriverInit_1_15
libva info: va_openDriver() returns 0
vainfo: VA-API version: 1.15 (libva 2.15.0)
vainfo: Driver version: Intel iHD driver for Intel(R) Gen Graphics - 22.6.4
...
