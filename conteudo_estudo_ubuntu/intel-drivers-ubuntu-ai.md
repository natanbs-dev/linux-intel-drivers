## como instalar os drivers mais recentes no ubuntu 
[placa integrada intel]

1. atualize o sistema
``` bash 
sudo apt update && sudo apt upgrade -y
```

2. instale os pacotes
``` bash 
sudo apt install -y intel-microcode i965-va-driver intel-media-va-driver-non-free vainfo
```

3. verifique os drivers atualmente usados
``` bash 
vainfo
```
