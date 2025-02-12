# linux-intel-drivers

No Fedora, os drivers Intel mais recentes estão disponíveis nos repositórios oficiais e no RPM Fusion. Siga os passos abaixo:
Instalar drivers Intel para aceleração de vídeo e codecs de mídia:
bash
Copy

# Atualize o sistema
```bash
sudo dnf update
```
# Instale os drivers Intel mais recentes
```bash
sudo dnf install intel-media-driver libva-intel-driver
```
# Instale o vainfo para verificar o driver VA-API
```bash
sudo dnf install vainfo
```
# Verifique o driver em uso
```bash
vainfo
```
Habilitar repositórios adicionais (opcional, para pacotes mais recentes):

# Habilitar o repositório RPM Fusion
```bash
sudo dnf install https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
```
# Atualize novamente após habilitar o RPM Fusion
```bash
sudo dnf update
```
