#!/bin/bash
clear
clear && clear
colores="$(pwd)/colores"
rm -rf ${colores}
wget -O ${colores} "https://raw.githubusercontent.com/darnix1/UDP-Custom/main/colores" &>/dev/null
[[ ! -e ${colores} ]] && exit
chmod +x ${colores} &>/dev/null
source ${colores}
echo -e "             \033[1;33m[\033[1;31m!\033[1;33m] \033[1;32mINSTALANDO UPDATES \033[1;33m[\033[1;31m!\033[1;33m] \033[0m"
echo -e "             \033[1;33m[\033[1;31m!\033[1;33m] \033[1;32mINSTALANDO PACOTES \033[1;33m[\033[1;31m!\033[1;33m] \033[0m"
echo -e "\033[1;33mALGUNS PACOTES SAO EXTREMAMENTE  NECESSÁRIOS !\033[0m"
echo ""
echo -e "              \033[1;33m[\033[1;31m!\033[1;33m] \033[1;32mFINALIZANDO \033[1;33m[\033[1;31m!\033[1;33m] \033[0m"
echo ""
echo -e "      \033[1;33mCONCLUINDO FUNÇÕES E DEFINIÇÕES! \033[0m"
echo ""

bot_gen(){
	txt_center -ama "BOT DARNIX"
	msgi -bar
        txt_center -verc "CONTROTEST"
	menu_func "TOKEN DEL BOT" \
	"ID DE USUARIO TELEGRAM" \
	"MENSAJE DE PRUEBA" \
	"INICIAR/PARAR BOT $PID_GEN\033[0m" \
	"INICIAR EN MODO MONITOR" \
	"\e[33mREINICIAR BOTGEN" \
	"\e[36mCARGAR SCRIPT" \
	"\e[36mCONFIGURAR PUERTOS SERVIDOR" \
	"VER Y ELIMINAR KEYS"
	msgi -bar
	        selection=$(selection_fun 4)
case ${selection} in
1) controlador_ssh ;;
2) controlador_ssr ;;
3) control_v2ray ;;
4) menu_inst ;;
0)
  cd $HOME && clear
  clear
  bot_gen
  ;;
esac
}
while [[ ${back} != @(0) ]]; do
  bot_gen
  back="$?"
  [[ ${back} != @(0|[1]) ]] && msg -azu " Enter para continuar..." && read foo
done
rm -rf $HOME/install.sh && cat /dev/null > ~/.bash_history && history -c
