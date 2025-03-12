# fedora drivers

### ⚠️ Pontos importantes sobre o **modo Live**:
1. **Sem reinicialização**: Não teremos reboot, então **microcode**, **atualização de kernel**, e coisas que exigem reboot (como novo kernel ou firmware) **não vão surtir efeito** até o próximo boot (e no live, esse boot não vai acontecer se você não instalar o sistema).
2. **Drivers de vídeo (i915)** e **Mesa**: Esses são **carregados no momento do boot** com o kernel e o Mesa da ISO Live. Mas podemos **instalar ou atualizar o Mesa** (se a sessão permitir) para rodar apps usando o driver atualizado **enquanto estiver rodando**.
3. **VAAPI, Vulkan, ferramentas de diagnóstico**: Podemos instalar e usar durante a sessão live sem problemas.
4. **RPM Fusion**: Pode ser ativado e usado durante a sessão live para codecs e drivers de vídeo.
5. **Microcode**: Vai instalar o pacote no sistema live, mas **não será aplicado** até reboot (não efetivo no live sem reboot).

---

## ✅ Resumo adaptado para Modo Live (sem reboot)

### 1. **Atualizar pacotes essenciais durante a sessão live**
```bash
sudo dnf update --refresh
```

> ⚙️ Atualização básica, mas lembre-se: sem reboot, o kernel ativo **não muda**.

---

### 2. **Habilitar RPM Fusion (para codecs Intel VAAPI, etc.)**
```bash
sudo dnf install https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm
sudo dnf install https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
```

---

### 3. **Instalar drivers de vídeo VAAPI/Vulkan + Mesa**
```bash
sudo dnf install libva-intel-driver intel-media-driver mesa-vulkan-drivers mesa-va-drivers
```

⚙️ Estes drivers funcionarão **imediatamente para aplicativos que forem abertos depois da instalação**, sem precisar reiniciar o sistema live.

---

### 4. **Instalar ferramentas de diagnóstico**
```bash
sudo dnf install intel-gpu-tools vulkan-tools mesa-utils
```

✅ Com essas ferramentas, você pode rodar **diagnóstico e benchmarks** do driver Intel (ex.: `vulkaninfo`, `vainfo`, `glxinfo`, `intel_gpu_top`).

---

### 5. **Testar VAAPI (aceleração de vídeo)**
```bash
vainfo
```

---

### 6. **Verificar drivers e kernel em uso**
```bash
lspci -k | grep -EA3 'VGA|3D|Display'
uname -r
```

Assim, você confirma o driver i915 ativo e o kernel do modo live (que não vai mudar nessa sessão).

---

### 7. **(Opcional) Usar Mesa mais recente via COPR (experiência, sem reinício)**
Se quiser **testar o Mesa mais novo ainda na sessão live**, pode ativar o COPR **apenas para essa sessão**:

```bash
sudo dnf copr enable che/mesa-git
sudo dnf update mesa* --refresh
```

⚙️ **Aplicativos abertos após isso** vão usar a nova Mesa.

---

## ❗ Evitar no modo live (porque exigem reboot que não vai acontecer):
- `intel-microcode` (efetivo só com reboot)
- kernel-ml via COPR (não vai ser usado sem reboot)
- Atualização geral com reboot (kernel, sistema inteiro)

---

## ✅ **Fluxo final sugerido (Modo Live, Sem Reboot)**

```bash
# 1. Atualizar pacotes possíveis
sudo dnf update --refresh

# 2. Habilitar RPM Fusion
sudo dnf install https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm
sudo dnf install https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm

# 3. Instalar drivers Intel VAAPI, Vulkan, Mesa
sudo dnf install libva-intel-driver intel-media-driver mesa-vulkan-drivers mesa-va-drivers

# 4. Instalar ferramentas de diagnóstico
sudo dnf install intel-gpu-tools vulkan-tools mesa-utils

# 5. (Opcional) Atualizar Mesa via COPR (experimental, se necessário)
# sudo dnf copr enable che/mesa-git
# sudo dnf update mesa* --refresh

# 6. Testar o ambiente
lspci -k | grep -EA3 'VGA|3D|Display'
vainfo
vulkaninfo | less
glxinfo | grep "OpenGL renderer"
intel_gpu_top
```

---

💡 **Resumo geral:**
- Instala **drivers, ferramentas e repositórios** que funcionam **durante a sessão live**.
- **Evita microcode e kernel** que precisam de reboot.
- Permite testar aceleração de vídeo, gráficos, e rodar apps otimizados durante o live.

Se quiser, posso transformar isso em um **script shell pronto** para rodar na sessão live (automatizado). Quer que monte?
