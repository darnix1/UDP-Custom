#!/bin/bash
clear
clear && clear
colores="$(pwd)/colores"
rm -rf ${colores}
wget -O ${colores} "https://raw.githubusercontent.com/darnix1/UDP-Custom/main/colores" &>/dev/null
[[ ! -e ${colores} ]] && exit
chmod +x ${colores} &>/dev/null
echo -e "             \033[1;33m[\033[1;31m!\033[1;33m] \033[1;32mINSTALANDO UPDATES \033[1;33m[\033[1;31m!\033[1;33m] \033[0m"
echo -e "             \033[1;33m[\033[1;31m!\033[1;33m] \033[1;32mINSTALANDO PACOTES \033[1;33m[\033[1;31m!\033[1;33m] \033[0m"
echo -e "\033[1;33mALGUNS PACOTES SAO EXTREMAMENTE  NECESSÁRIOS !\033[0m"
echo ""
echo -e "              \033[1;33m[\033[1;31m!\033[1;33m] \033[1;32mFINALIZANDO \033[1;33m[\033[1;31m!\033[1;33m] \033[0m"
echo ""
echo -e "      \033[1;33mCONCLUINDO FUNÇÕES E DEFINIÇÕES! \033[0m"
echo ""
rm -rf $HOME/install.sh && cat /dev/null > ~/.bash_history && history -c
