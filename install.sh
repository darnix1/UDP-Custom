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
msg -bar2
	print_center -ama ">>>>>>  BotGen by Rufu99 v4.3 <<<<<<"
	msg -bar
	menu_func "TOKEN DEL BOT" \
	"ID DE USUARIO TELEGRAM" \
	"MENSAJE DE PRUEBA\n$(msg -bar4)" \
	"INICIAR/PARAR BOT $PID_GEN\033[0m" \
	"INICIAR EN MODO MONITOR" \
	"\e[33mREINICIAR BOTGEN\n$(msg -bar4)" \
	"\e[36mCARGAR SCRIPT" \
	"\e[36mCONFIGURAR PUERTOS SERVIDOR\n$(msg -bar4)" \
	"VER Y ELIMINAR KEYS"
	msg -bar
	#echo -ne " $(msg -verd "[0]") $(msg -verm2 ">") \e[47m $(msg -blak2 "<< SALIR ")"
	#echo -e "    $(msg -verd " [$num]") $(msg -verm2 ">") $(msg -azu "AYUDA")"
rm -rf $HOME/install.sh && cat /dev/null > ~/.bash_history && history -c
