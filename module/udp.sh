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
source /etc/os-release
Versi_OS=$VERSION
ver=$VERSION_ID
Tipe=$NAME
URL_SUPPORT=$HOME_URL
basedong=$ID
REGION=$( curl -s ipinfo.io/region )
CITY=$( curl -s ipinfo.io/city )
oovpn=$(systemctl status openvpn | grep Active | awk '{print $2}' | cut -d "(" -f2 | cut -d ")" -f1)
tls_v2ray_status=$(systemctl status xray | grep Active | awk '{print $3}' | cut -d "(" -f2 | cut -d ")" -f1)
nontls_v2ray_status=$(systemctl status xray | grep Active | awk '{print $3}' | cut -d "(" -f2 | cut -d ")" -f1)
vless_tls_v2ray_status=$(systemctl status xray | grep Active | awk '{print $3}' | cut -d "(" -f2 | cut -d ")" -f1)
vless_nontls_v2ray_status=$(systemctl status xray | grep Active | awk '{print $3}' | cut -d "(" -f2 | cut -d ")" -f1)
shadowsocks=$(systemctl status xray | grep Active | awk '{print $3}' | cut -d "(" -f2 | cut -d ")" -f1)
trojan_server=$(systemctl status xray | grep Active | awk '{print $3}' | cut -d "(" -f2 | cut -d ")" -f1)
dropbear_status=$(/etc/init.d/dropbear status | grep Active | awk '{print $3}' | cut -d "(" -f2 | cut -d ")" -f1)
stunnel_service=$(/etc/init.d/stunnel4 status | grep Active | awk '{print $3}' | cut -d "(" -f2 | cut -d ")" -f1)
ssh_service=$(/etc/init.d/ssh status | grep Active | awk '{print $3}' | cut -d "(" -f2 | cut -d ")" -f1)
vnstat_service=$(/etc/init.d/vnstat status | grep Active | awk '{print $3}' | cut -d "(" -f2 | cut -d ")" -f1)
cron_service=$(/etc/init.d/cron status | grep Active | awk '{print $3}' | cut -d "(" -f2 | cut -d ")" -f1)
fail2ban_service=$(/etc/init.d/fail2ban status | grep Active | awk '{print $3}' | cut -d "(" -f2 | cut -d ")" -f1)
wstls=$(systemctl status ws-stunnel.service | grep Active | awk '{print $3}' | cut -d "(" -f2 | cut -d ")" -f1)
wsovpn=$(systemctl status ws-ovpn | grep Active | awk '{print $3}' | cut -d "(" -f2 | cut -d ")" -f1)
osslh=$(systemctl status sslh | grep Active | awk '{print $3}' | cut -d "(" -f2 | cut -d ")" -f1)
udp=$(systemctl status udp-custom | grep Active | awk '{print $3}' | cut -d "(" -f2 | cut -d ")" -f1)
sls=$(systemctl status server | grep Active | awk '{print $3}' | cut -d "(" -f2 | cut -d ")" -f1)
slc=$(systemctl status client | grep Active | awk '{print $3}' | cut -d "(" -f2 | cut -d ")" -f1)
RED='\033[0;31m'
NC='\033[0m'
GREEN='\033[0;32m'
ORANGE='\033[0;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
LIGHT='\033[0;37m'
clear
if [[ $oovpn == "active" ]]; then
status_openvpn=" ${GREEN}Running ${NC}( No Error )"
else
status_openvpn="${RED}  Not Running ${NC}  ( Error )"
fi
if [[ $ssh_service == "running" ]]; then
status_ssh=" ${GREEN}Running ${NC}( No Error )"
else
status_ssh="${RED}  Not Running ${NC}  ( Error )"
fi
if [[ $squid_service == "running" ]]; then
status_squid=" ${GREEN}Running ${NC}( No Error )"
else
status_squid="${RED}  Not Running ${NC}  ( Error )"
fi
if [[ $vnstat_service == "running" ]]; then
status_vnstat=" ${GREEN}Running ${NC}( No Error )"
else
status_vnstat="${RED}  Not Running ${NC}  ( Error )"
fi
if [[ $cron_service == "running" ]]; then
status_cron=" ${GREEN}Running ${NC}( No Error )"
else
status_cron="${RED}  Not Running ${NC}  ( Error )"
fi
if [[ $fail2ban_service == "running" ]]; then
status_fail2ban=" ${GREEN}Running ${NC}( No Error )"
else
status_fail2ban="${RED}  Not Running ${NC}  ( Error )"
fi
if [[ $tls_v2ray_status == "running" ]]; then
status_tls_v2ray=" ${GREEN}Running${NC} ( No Error )"
else
status_tls_v2ray="${RED}  Not Running${NC}   ( Error )"
fi
if [[ $nontls_v2ray_status == "running" ]]; then
status_nontls_v2ray=" ${GREEN}Running ${NC}( No Error )${NC}"
else
status_nontls_v2ray="${RED}  Not Running ${NC}  ( Error )${NC}"
fi
if [[ $vless_tls_v2ray_status == "running" ]]; then
status_tls_vless=" ${GREEN}Running${NC} ( No Error )"
else
status_tls_vless="${RED}  Not Running ${NC}  ( Error )${NC}"
fi
if [[ $vless_nontls_v2ray_status == "running" ]]; then
status_nontls_vless=" ${GREEN}Running${NC} ( No Error )"
else
status_nontls_vless="${RED}  Not Running ${NC}  ( Error )${NC}"
fi
if [[ $trojan_server == "running" ]]; then
status_virus_trojan=" ${GREEN}Running ${NC}( No Error )${NC}"
else
status_virus_trojan="${RED}  Not Running ${NC}  ( Error )${NC}"
fi
if [[ $dropbear_status == "running" ]]; then
status_beruangjatuh=" ${GREEN}Running${NC} ( No Error )${NC}"
else
status_beruangjatuh="${RED}  Not Running ${NC}  ( Error )${NC}"
fi
if [[ $stunnel_service == "running" ]]; then
status_stunnel=" ${GREEN}Running ${NC}( No Error )"
else
status_stunnel="${RED}  Not Running ${NC}  ( Error )}"
fi
if [[ $wstls == "running" ]]; then
swstls=" ${GREEN}Running ${NC}( No Error )${NC}"
else
swstls="${RED}  Not Running ${NC}  ( Error )${NC}"
fi
if [[ $osslh == "running" ]]; then
sosslh=" ${GREEN}Running ${NC}( No Error )${NC}"
else
sosslh="${RED}  Not Running ${NC}  ( Error )${NC}"
fi
if [[ $udp == "running" ]]; then
udp=" ${GREEN}Running ${NC}( No Error )${NC}"
else
udp="${RED}  Not Running ${NC}  ( Error )${NC}"
fi
if [[ $sls == "running" ]]; then
sls=" ${GREEN}Running ${NC}( No Error )${NC}"
else
sls="${RED}  Not Running ${NC}  ( Error )${NC}"
fi
if [[ $slc == "running" ]]; then
slc=" ${GREEN}Running ${NC}( No Error )${NC}"
else
slc="${RED}  Not Running ${NC}  ( Error )${NC}"
fi
if [[ $shadowsocks == "running" ]]; then
status_shadowsocks=" ${GREEN}Running ${NC}( No Error )${NC}"
else
status_shadowsocks="${RED}  Not Running ${NC}  ( Error )${NC}"
fi
total_ram=`grep "MemTotal: " /proc/meminfo | awk '{ print $2}'`
totalram=$(($total_ram/1024))
kernelku=$(uname -r)
DATE=$(date +'%Y-%m-%d')
datediff() {
d1=$(date -d "$1" +%s)
d2=$(date -d "$2" +%s)
echo -e "$COLOR1 $NC Expiry In   : $(( (d1 - d2) / 86400 )) Days"
}
mai="datediff "$Exp" "$DATE""
today=`date -d "0 days" +"%Y-%m-%d"`
Exp2=$(curl -sS https://raw.githubusercontent.com/SatanFusionOfficial/permission/main/ip | grep $MYIP | awk '{print $3}')
d1=$(date -d "$Exp2" +%s)
d2=$(date -d "$today" +%s)
certificate=$(( (d1 - d2) / 86400 ))
Name2=$(curl -sS https://raw.githubusercontent.com/SatanFusionOfficial/permission/main/ip | grep $MYIP | awk '{print $2}')
Domen="$(cat /etc/xray/domain)"
function restartservice(){


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

