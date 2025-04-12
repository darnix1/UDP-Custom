#!/bin/bash


[[ -e /bin/xdarnix/msg ]] && source /bin/xdarnix/msg || source <(curl -sSL https://raw.githubusercontent.com/darnix1/license/main/msg)


# ===== 1. Configuración de idioma =====
LANG_FILE="/bin/xdarnix/user_lang"
DEFAULT_LANG="es"  # Idioma por defecto

# Cargar idioma del usuario (si existe) o usar el predeterminado
if [[ -e $LANG_FILE ]]; then
    source $LANG_FILE
else
    USER_LANG="$DEFAULT_LANG"
fi


# ===== 3. Cargar textos según idioma =====
TEXTOS_URL="https://raw.githubusercontent.com/darnix1/license/refs/heads/main/textos_${USER_LANG}.sh"
[[ -e "/bin/xdarnix/textos_${USER_LANG}" ]] && source "/bin/xdarnix/textos_${USER_LANG}" || source <(curl -sSL "$TEXTOS_URL")

_reset="\033[0m"
white()   { echo -e "\033[1;97m$@$_reset"; }  # Blanco brillante

#TERMINA TODO   


biji=`date +"%Y-%m-%d" -d "$dateFromServer"`
colornow=$(cat /etc/rmbl/theme/color.conf)
export NC="\e[0m"
export YELLOW='\033[0;33m';
export RED="\033[0;31m"
export COLOR1="$(cat /etc/rmbl/theme/$colornow | grep -w "TEXT" | cut -d: -f2|sed 's/ //g')"
export COLBG1="$(cat /etc/rmbl/theme/$colornow | grep -w "BG" | cut -d: -f2|sed 's/ //g')"
WH='\033[1;37m'
tram=$( free -h | awk 'NR==2 {print $2}' )
uram=$( free -h | awk 'NR==2 {print $3}' )
ISP=$(curl -s ipinfo.io/org | cut -d " " -f 2-10 )
CITY=$(curl -s ipinfo.io/city )
ipsaya=$(wget -qO- ipinfo.io/ip)
data_server=$(curl -v --insecure --silent https://google.com/ 2>&1 | grep Date | sed -e 's/< Date: //')

MYIP=$(curl -sS ipv4.icanhazip.com)

export RED='\033[0;31m'
export GREEN='\033[0;32m'
clear



clear
msg -bar
msg -tit
msg -bar
amacen " $run_sub "
msg -bar
red " $run_sub3 "
msg -bar
menu_var "$run_start1 " \
"$run_start2 " \
"$run_start3 " \
"$run_start4 " \
"$run_start5 " \
"$run_start6 "
#"${run_start7} " \
back

