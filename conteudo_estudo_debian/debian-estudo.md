#  SETUP NO DEBIAN

## ESCOLHENDO A VERSÃO DO DEBIAN QUE CAIBA NO SEU ESCOPO
sabendo das versões que o debian tem (stable, testing e unstable), definir qual a versão do SO é de extrema importância para o seguimento dos demais passos.

*saiba que os demais passos serão feitos na versão testing do sistema, que alinha a base versão stable com kernel mais recente e versões mais atualizadas do sistema.

## PACOTES [codecs]:
Uma parte dos pacotes de drivers já vem instalado diretamente pelo kernel, mas é sempre recomendável conferir a instalação e configuração:

`sudo apt update && sudo apt install intel-media-va-driver`
    1.1 sudo apt install intel-media-va-driver-non-free 
    * avaliar a instalação de pacotes non-free dependendo dos Mirror no sources.list
    
`sudo apt install intel-microcode`

`sudo apt install mesa mesa-utils`


## OVERCLOCK LINUX X POWER-PROFILES-DAEMON
Dependendo da sua GPU alinhada ao processador, duas formas se destacam para extrair ao máximo de performance tendo instalado os drivers corretos do passo anterior:

**CPUPOWER**: 

`sudo apt update && sudo apt install linux-cpupower`

`sudo systemctl enable cpupower.service`

`sudo systemctl start cpupower.service`

`sudo nano /etc/default/cpupower`
- editar a linha 'GOVERNOR=' e colocar no modo performance

`sudo cpupower frequency-set -g performance`

**POWER-PROFILES-DAEMON:**

`sudo apt update && sudo apt install power-profiles-daemon`

`sudo systemctl enable power-profiles-daemon.service`

`sudo systemctl start power-profiles-daemon.service`

`sudo powerprofilesctl set performance`