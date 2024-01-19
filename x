#!/bin/bash
clear

flech='➮' cOlM='⁙' && TOP='‣' && TTini='=====>>►► 🐲' && cG='/c' && TTfin='🐲 ◄◄<<=====' && TTcent='💥' && RRini='【  ★' && RRfin='★  】' && CHeko='✅' && ScT='🛡️' && FlT='⚔️' && BoLCC='🪦' && ceLL='🧬' && aLerT='⚠️' && _kl1='ghkey' && lLaM='🔥' && pPIniT='∘' && bOTg='🤖' && kL10='tc' && rAy='⚡' && tTfIn='】' && TtfIn='【' tTfLe='►' && am1='/e' && rUlq='🔰' && h0nG='🍄' && lLav3='🗝️' && m3ssg='📩' && pUn5A='⚜' && p1t0='•' nib="${am1}${kL10}"
cOpyRig='©' && mbar2=' •••••••••••••••••••••••'

[[ ! -d /bin/ejecutar ]] && mkdir /bin/ejecutar;wget -qO- ifconfig.me > /bin/ejecutar/IPcgh

menu_func(){
  local options=${#@}
  local array
  for((num=1; num<=$options; num++)); do
    echo -ne "$(msg -verd " [$num]") $(msg -verm2 ">") "
    array=(${!num})
    case ${array[0]} in
      "-vd")echo -e "\033[1;33m[!]\033[1;32m ${array[@]:1}";;
      "-vm")echo -e "\033[1;33m[!]\033[1;31m ${array[@]:1}";;
      "-fi")echo -e "${array[@]:2} ${array[1]}";;
      -bar|-bar|-bar|-bar4)echo -e "\033[1;37m${array[@]:1}\n$(msg ${array[0]})";;
      *)echo -e "\033[1;37m${array[@]}";;
    esac
  done
 }

selection_fun () {
local selection="null"
local range
for((i=0; i<=$1; i++)); do range[$i]="$i "; done
while [[ ! $(echo ${range[*]}|grep -w "$selection") ]]; do
echo -ne "\033[38;5;150m ╰► Seleccione su opción: " >&2
read selection
tput cuu1 >&2 && tput dl1 >&2
done
echo $selection
}

tittle () {
    clear&&clear
    msg -bar
    echo -e "\033[1;44;40m   \033[1;33m=====>>►► 🦖 ChuKK-SCRIPT 📍 [@botlatmx] 🦖  ◄◄<<=====  \033[0m"
    msg -bar
}
in_opcion(){
  unset opcion
  if [[ -z $2 ]]; then
      msg -nazu " $1: " >&2
  else
      msg $1 " $2: " >&2
  fi
  read opcion
  echo "$opcion"
}
# centrado de texto
print_center(){
  if [[ -z $2 ]]; then
    text="$1"
  else
    col="$1"
    text="$2"
  fi

  while read line; do
    unset space
    x=$(( ( 54 - ${#line}) / 2))
    for (( i = 0; i < $x; i++ )); do
      space+=' '
    done
    space+="$line"
    if [[ -z $2 ]]; then
      msg -azu "$space"
    else
      msg "$col" "$space"
    fi
  done <<< $(echo -e "$text")
}
# titulos y encabesados
title(){
    clear
    msg -bar
    if [[ -z $2 ]]; then
      print_center -azu "$1"
    else
      print_center "$1" "$2"
    fi
    msg -bar
 }

# finalizacion de tareas
 enter(){
  msg -bar
  text="►► Presione enter para continuar ◄◄"
  if [[ -z $1 ]]; then
    print_center -ama "$text"
  else
    print_center "$1" "$text"
  fi
  read
 }

# opcion, regresar volver/atras
back(){
    msg -bar
    echo -ne "$(msg -verd " [0]") $(msg -verm2 ">") " && msg -bra "\033[1;41mVOLVER"
    msg -bar
 }

function msg(){
  ##-->> ACTULIZADOR Y VERCION
  [[ ! -e /etc/SCRIPT-LATAM/temp/version_instalacion ]] && printf '1\n' >/etc/SCRIPT-LATAM/temp/version_instalacion
  v11=$(cat /etc/SCRIPT-LATAM/temp/version_actual)
  v22=$(cat /etc/SCRIPT-LATAM/temp/version_instalacion)
  if [[ $v11 = $v22 ]]; then
    vesaoSCT="\e[1;31m[\033[1;37m Ver.\033[1;32m $v22 \033[1;31m]"
  else
    vesaoSCT="\e[1;31m[\e[31m ACTUALIZAR \e[25m\033[1;31m]"
  fi
  ##-->> COLORES
local colors="/etc/SCRIPT-LATAM/colors"
  if [[ ! -e $colors ]]; then
    COLOR[0]='\033[1;37m' #GRIS='\033[1;37m'
    COLOR[1]='\e[31m'     #ROJO='\e[31m'
    COLOR[2]='\e[32m'     #VERDE='\e[32m'
    COLOR[3]='\e[33m'     #AMARILLO='\e[33m'
    COLOR[4]='\e[34m'     #AZUL='\e[34m'
    COLOR[5]='\e[91m'     #ROJO-NEON='\e[91m'
    COLOR[6]='\033[1;97m' #BALNCO='\033[1;97m'

  else
    local COL=0
    for number in $(cat $colors); do
      case $number in
      1) COLOR[$COL]='\033[1;37m' ;;
      2) COLOR[$COL]='\e[31m' ;;
      3) COLOR[$COL]='\e[32m' ;;
      4) COLOR[$COL]='\e[33m' ;;
      5) COLOR[$COL]='\e[34m' ;;
      6) COLOR[$COL]='\e[35m' ;;
      7) COLOR[$COL]='\033[1;36m' ;;
      esac
      let COL++
    done
  fi
NEGRITO='\e[1m'
  SINCOLOR='\e[0m'
  case $1 in
  -ne) cor="${COLOR[1]}${NEGRITO}" && echo -ne "${cor}${2}${SINCOLOR}" ;;
  -ama) cor="${COLOR[3]}${NEGRITO}" && echo -e "${cor}${2}${SINCOLOR}" ;;
  -verm) cor="${COLOR[3]}${NEGRITO}[!] ${COLOR[1]}" && echo -e "${cor}${2}${SINCOLOR}" ;;
  -verm2) cor="${COLOR[1]}${NEGRITO}" && echo -e "${cor}${2}${SINCOLOR}" ;;
  -azu) cor="${COLOR[6]}${NEGRITO}" && echo -e "${cor}${2}${SINCOLOR}" ;;
  -verd) cor="${COLOR[2]}${NEGRITO}" && echo -e "${cor}${2}${SINCOLOR}" ;;
  -bra) cor="${COLOR[0]}${SINCOLOR}" && echo -e "${cor}${2}${SINCOLOR}" ;;
  -nazu) cor="${COLOR[6]}${NEGRITO}" && echo -ne "${cor}${2}${SEMCOR}";;
  -nverd)cor="${COLOR[2]}${NEGRITO}" && echo -ne "${cor}${2}${SEMCOR}";;
  -nama) cor="${COLOR[3]}${NEGRITO}" && echo -ne "${cor}${2}${SEMCOR}";;
  -verm3)cor="${COLOR[1]}" && echo -e "${cor}${2}${SEMCOR}";;
  -teal) cor="${COLOR[7]}${NEGRITO}" && echo -e "${cor}${2}${SEMCOR}";;
  -teal2)cor="${COLOR[7]}" && echo -e "${cor}${2}${SEMCOR}";;
  -blak) cor="${COLOR[8]}${NEGRITO}" && echo -e "${cor}${2}${SEMCOR}";;
  -blak2)cor="${COLOR[8]}" && echo -e "${cor}${2}${SEMCOR}";;
  -blu)  cor="${COLOR[9]}${NEGRITO}" && echo -e "${cor}${2}${SEMCOR}";;
  -blu1) cor="${COLOR[9]}" && echo -e "${cor}${2}${SEMCOR}";;
  #-bar)ccor="
  "-bar2" | "-bar") cor="${COLOR[1]}════════════════════════════════════════════════════" && echo -e "${SINCOLOR}${cor}${SINCOLOR}" ;;
  # Centrar texto
  -tit) echo -e " \e[48;5;214m\e[38;5;0m   💻 𝙎 𝘾 𝙍 𝙄 𝙋 𝙏 | 𝙇 𝘼 𝙏 𝘼 𝙈 💻   \e[0m  $vesaoSCT" ;;
  esac
}

fun_bar () {
comando[0]="$1"
comando[1]="$2"
 (
[[ -e $HOME/fim ]] && rm $HOME/fim
${comando[0]} -y > /dev/null 2>&1
${comando[1]} -y > /dev/null 2>&1
touch $HOME/fim
 ) > /dev/null 2>&1 &
echo -ne "\033[1;33m ["
while true; do
   for((i=0; i<18; i++)); do
   echo -ne "\033[1;31m>>"
   sleep 0.1s
   done
   [[ -e $HOME/fim ]] && rm $HOME/fim && break
   echo -e "\033[1;33m]"
   sleep 1s
   tput cuu1
   tput dl1
   echo -ne "\033[1;33m ["
done
echo -e "\033[1;33m]\033[1;31m -\033[1;32m 100%\033[1;37m"
}

del(){
  for (( i = 0; i < $1; i++ )); do
    tput cuu1 && tput dl1
  done
}

dir_user="/etc/adm-lite/userDIR"
pausa(){
echo -ne "\033[1;37m"
read -p " Presiona Enter para Continuar "
}


  info() {
  puerto=$1
  
  msg -bar
  echo
  msg -ama "         INSTALADOR UDPserver | @drowkid•Plus"
  echo 
  msg -bar
  msg -ama "         SOURCE OFICIAL DE Epro Dev Team"
  echo -e "             https://t.me/ePro_Dev_Team"
  msg -bar
  msg -ama "         CODIGO REFACTORIZADO POR @darnix0"
  [[ -z ${puerto} ]] || add.user ${puerto}
  pausa
  clear
  }


cd
[[ ! -d /etc/ADMcgh ]] && mkdir -p /etc/ADMcgh

# change to time GMT+7
#ln -fs /usr/share/zoneinfo/Asia/Jakarta /etc/localtime

# install udp-custom
#echo downloading udp-custom
#wget -q --show-progress --load-cookies /tmp/cookies.txt https://www.dropbox.com/s/muzdqkid5ganb7c/udp-custom-linux-amd64?dl=0 -O /bin/UDP-Custom && rm -rf /tmp/cookies.txt
#chmod +x /bin/UDP-Custom

#echo downloading default config
#wget -q --show-progress --load-cookies /tmp/cookies.txt https://www.dropbox.com/s/pccfmw4h830wbn4/config.json?dl=0 -O /etc/ADMcgh/config.json && rm -rf /tmp/cookies.txt
#chmod 644 /etc/ADMcgh/config.json


#echo reboot

echo -e " BY "

echo -e " Power by ®DARNIX"

#reboot


selection_fun () {
local selection="null"
local range
for((i=0; i<=$1; i++)); do range[$i]="$i "; done
while [[ ! $(echo ${range[*]}|grep -w "$selection") ]]; do
echo -ne "\033[1;37m ► Opcion: " >&2
read selection
tput cuu1 >&2 && tput dl1 >&2
done
echo $selection
}

make_service(){
if [ -z "$1" ]; then
cat <<EOF > /etc/systemd/system/udp-custom.service
[Unit]
Description=udp-custom by ePro Dev. Team

[Service]
User=root
Type=simple
ExecStart=/bin/UDP-Custom server --config /etc/ADMcgh/config.json
WorkingDirectory=/etc/ADMcgh/
Restart=always
RestartSec=2s

[Install]
WantedBy=default.target
EOF
else
cat <<EOF > /etc/systemd/system/udp-custom.service
[Unit]
Description=udp-custom by ePro Dev. Team

[Service]
User=root
Type=simple
ExecStart=/bin/UDP-Custom server -exclude $1 --config /etc/ADMcgh/config.json
WorkingDirectory=/etc/ADMcgh/
Restart=always
RestartSec=2s

[Install]
WantedBy=default.target
EOF
fi

#echo start service udp-custom
systemctl start udp-custom &>/dev/null

#echo enable service udp-custom

	msg -nama '        Habilitando servicio UDPserver ------'
	if systemctl enable udp-custom &>/dev/null &>/dev/null ; then
		msg -verd 'OK'
		#_mssBOT "ACTIVADO!!"
	else
		msg -verm2 'fail'
		#_mssBOT " FALLIDO!!"
	fi
	
	msg -nama '         Iniciando servicio UDPserver -------'
	if systemctl start udp-custom &>/dev/null &>/dev/null &>/dev/null ; then
		msg -verd 'OK'
		#_mssBOT "ACTIVADO!!"
	else
		msg -verm2 'fail'
		#_mssBOT " FALLIDO!!"
	fi
msg -bar
	while true; do
	msg -nama '         Digita un Puerto para el Servicio de\n'
	msg -nama '              Prederteminado ( ENTER )\n'
    read -p "                   UDP-Custom: " udpPORT
	tput cuu1 >&2 && tput dl1 >&2
	checkPORT=`netstat -tlpn | awk -F '[: ]+' '$1=="tcp"{print $5}' | grep -w $udpPORT`
	[[ -n "$checkPORT" ]] || break
    prococup=`netstat -tlpn | awk -F '[: ]+' '$5=="$udpPORT"{print $9}'`
    echo -e "\033[1;33m  EL PUERTO SE ENCUENTRA OCUPADO POR $prococup"
	msg -bar
	return
    done
	tput cuu1 >&2 && tput dl1 >&2
	tput cuu1 >&2 && tput dl1 >&2
	tput cuu1 >&2 && tput dl1 >&2
[[ -z ${udpPORT} ]] && udpPORT='36712'
	msg -nama '         Iniciando servicio UDPserver -------'
if  sed -i "s/36712/${udpPORT}/" /etc/ADMcgh/config.json ; then
		msg -verd 'OK'
	else
		msg -verm2 'fail'
fi
reset_slow
port=$(lsof -V -i UDP -P -n | grep -v "ESTABLISHED" |grep -v "COMMAND"|grep -E 'UDP-Custom'| cut -d ":" -f2)	
tput cuu1 >&2 && tput dl1 >&2
tput cuu1 >&2 && tput dl1 >&2
tput cuu1 >&2 && tput dl1 >&2
tput cuu1 >&2 && tput dl1 >&2
tput cuu1 >&2 && tput dl1 >&2
add.user ${port}
	#iptables -t nat -F &>/dev/null
	#iptables -t mangle -F &>/dev/null
	#iptables -X &>/dev/null
	#iptables -P INPUT ACCEPT &>/dev/null
	#iptables -P FORWARD ACCEPT &>/dev/null
	#iptables -P OUTPUT ACCEPT &>/dev/null
pausa
}



download_udpServer(){
	msg -nama '     Descargando binario UDPserver V 1.2 ----'
[[ $(uname -m 2> /dev/null) != x86_64 ]] && {
	if wget -O /bin/UDP-Custom 'https://raw.githubusercontent.com/emirjorge/Script-Z/master/CHUMO/Recursos/binarios/UDP/udp-arm64.bin' &>/dev/null ; then
		chmod +x /bin/UDP-Custom
		msg -verd ' ARM64 - OK'
	else
		msg -verm2 'fail'
		rm -rf /bin/UDP-Custom*
	fi
} || {
	if wget -O /bin/UDP-Custom 'https://raw.githubusercontent.com/emirjorge/Script-Z/master/CHUMO/Recursos/binarios/UDP/udp-amd64.bin' &>/dev/null ; then
		chmod +x /bin/UDP-Custom
		msg -verd ' X64 OK'
	else
		msg -verm2 'fail'
		rm -rf /bin/UDP-Custom*
fi	
}
	msg -nama '         Descargando Config UDPserver -------'
	if wget -O /etc/ADMcgh/config.json 'https://raw.githubusercontent.com/emirjorge/Script-Z/master/CHUMO/Recursos/binarios/UDP/config.json' &>/dev/null ; then
		chmod 644 /etc/ADMcgh/config.json
		msg -verd 'OK'
	else
		msg -verm2 'fail'
		rm -f /etc/ADMcgh/config.json*
	fi
#chekKEY &> /dev/null 2>&1	
make_service
}




  reset_slow(){
  msg -bar
  msg -ama "        Reiniciando UDPserver...."
  #screen -ls | grep udp-custom | cut -d. -f1 | awk '{print $1}' | xargs kill
  if systemctl restart udp-custom &>/dev/null ;then
  msg -verd "        Con exito!!!"    
  msg -bar
  else    
  msg -verm "        Con fallo!!!"    
  msg -bar
  fi
  pausa
  }  
  
  stop_slow(){
  clear
  msg -bar
  msg -ama "        Deteniendo UDPserver...."
  if systemctl stop udp-custom ; then
  msg -verd "         Con exito!!!"   msg -bar
  else
  msg -verm "        Con fallo!!!"    msg -bar
  fi
  pausa
  }    
  
  remove() {
  stop_slow
  systemctl disable udp-custom
  rm -f /etc/systemd/system/udp-custom.service
  rm -f /bin/UDP-Custom*
  rm -f /etc/ADMcgh/config*
  rm -rf /root/udp
	iptables -t nat -F &>/dev/null
	iptables -t mangle -F &>/dev/null
	iptables -X &>/dev/null
	iptables -P INPUT ACCEPT &>/dev/null
	iptables -P FORWARD ACCEPT &>/dev/null
	iptables -P OUTPUT ACCEPT &>/dev/null
  #_mssBOT "REMOVIDO!!"
  }

 add.user () {
 port=$1
 user='darnix'
 clave='botlatmx'
 #$(cat /etc/ADMcgh/config.json | grep user | cut -d '"' -f4)
 #user=$(cat /etc/ADMcgh/config.json | jq .user)
 #clave=$(cat /etc/ADMcgh/config.json | jq .auth.pass[])
valid=$(date '+%C%y-%m-%d' -d " +2 days") 
if useradd -M -s /bin/false $user -e $valid ; then
(echo $clave; echo $clave)|passwd $user >/dev/null 2>&1 &
echo "senha: $clave" > $dir_user/$user
echo "limite: 2" >> $dir_user/$user
echo "data: $valid" >> $dir_user/$user
msg -verd " USER : ADMcgh  | DEMOSTRACION AGREGADO!!!"    
else 
echo -e "${cor[5]} ⚠️ Usuario DEMO ya Existe ⚠️"
msg -verm " USER : ADMcgh | No Agregado!!!"    
fi
 msg -bar
 echo
 msg -bar
 echo -e "      ESTO ES UNA GUIA DEL FORMATO DEL USUARIO"
 echo -e "         VE AL MENU DE USUARIOS Y CREA UNO"
 msg -bar
 echo 
 echo -e "【 CONFIG >${cor[4]} $(wget -qO- ifconfig.me)${cor[2]}:${cor[5]}1-65535${cor[2]}@${cor[4]}$user${cor[2]}:${cor[4]}${clave}   】" | pv -qL 80
 echo 
 msg -bar
 msg -ama "        RECUERDA CREAR TUS USUARIOS SSH NORMAL"
 msg -bar
 }
 
 edit_json() {
 msg -bar
 msg -ama "        PARA EDITAR EL USUARIO EDITA"
 msg -ama "            /etc/ADMcgh/config.json"
 msg -bar
echo -e "\033[1;37m Para Salir Ctrl + C o 0 Para Regresar\033[1;33m"
echo -e " \033[1;31m[ !!! ]\033[1;33m EDITA LAS CREDENCIALES   \033[1;31m\033[1;33m"
msg -bar
echo -e " \033[1;31mLuego de Editar..  Presiona Ctrl + O y Enter \033[1;33m \033[1;31m\033[1;33m"
echo -e " \033[1;31m          Por Ultimo Ctrl + X  \033[1;33m \033[1;31m\033[1;33m"
pausa
nano /etc/ADMcgh/config.json
reset_slow
 }

while : 
do
unset port
msg -bar
msg -tit
msg -bar
  msg -ama "      BINARIO OFICIAL DE Epro Dev Team 1.2"
  msg -bar
  [[ $(ps x | grep UDP-Custom| grep -v grep) ]] && {
    _pid="\033[1;32m[ ON ]" 
  port=$(lsof -V -i UDP -P -n | grep -v "ESTABLISHED" |grep -v "COMMAND"|grep -E 'UDP-Custo'| cut -d ":" -f2)
  msg -ama "      PUERTO EN EJECUCION DE UDPserver : ${port}"
  msg -bar
  } || _pid="\033[1;31m[ OFF ]"
  msg -ama "         INSTALADOR UDPserver | @Darnix•Plus"
  msg -bar
  menu_func "Instalar UDPserver $_pid" "$(msg -ama "Reiniciar UDPserver")" "$(msg -verm2 "Detener UDPserver")" "$(msg -verm2 "Remover UDPserver")" "$(msg -ama "Info de Proyecto")"
  msg -bar
  echo -ne "$(msg -verd "  [0]") $(msg -verm2 "=>>") " && msg -bra "\033[1;41m Volver "
  msg -bar
  opcion=$(selection_fun 5)  
  case $opcion in
  1)download_udpServer;;
  #2)edit_json;;
  2)reset_slow;;
  3)stop_slow;;
  4)remove;;
  5)info ${port};;
  0)exit;;
  esac  
done
