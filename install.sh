#!/bin/bash
clear && clear
cd $HOME
RutaBin="/bin"
apt install net-tools -y &>/dev/null
echo "nameserver 1.1.1.1" >/etc/resolv.conf
echo "nameserver 1.0.0.1" >>/etc/resolv.conf
myip=$(ifconfig | grep -Eo 'inet (addr:)?([0-9]*\.){3}[0-9]*' | grep -Eo '([0-9]*\.){3}[0-9]*' | grep -v '127.0.0' | head -n1)
myint=$(ifconfig | grep -B1 "inet addr:$myip" | head -n1 | awk '{print $1}')
rm -rf /etc/localtime &>/dev/null
ln -s /usr/share/zoneinfo/America/Mexico_City /etc/localtime &>/dev/null
rm -rf /usr/local/lib/systemubu1 &>/dev/null
### COLORES Y BARRA
msg() {
  BRAN='\033[1;37m' && VERMELHO='\e[31m' && VERDE='\e[32m' && AMARELO='\e[33m'
  AZUL='\e[34m' && MAGENTA='\e[35m' && MAG='\033[1;36m' && NEGRITO='\e[1m' && SEMCOR='\e[0m'
  case $1 in
  -ne) cor="${VERMELHO}${NEGRITO}" && echo -ne "${cor}${2}${SEMCOR}" ;;
  -ama) cor="${AMARELO}${NEGRITO}" && echo -e "${cor}${2}${SEMCOR}" ;;
  -verm) cor="${AMARELO}${NEGRITO}[!] ${VERMELHO}" && echo -e "${cor}${2}${SEMCOR}" ;;
  -azu) cor="${MAG}${NEGRITO}" && echo -e "${cor}${2}${SEMCOR}" ;;
  -verd) cor="${VERDE}${NEGRITO}" && echo -e "${cor}${2}${SEMCOR}" ;;
  -bra) cor="${VERMELHO}" && echo -ne "${cor}${2}${SEMCOR}" ;;
  "-bar2" | "-bar") cor="${VERMELHO}————————————————————————————————————————————————————" && echo -e "${SEMCOR}${cor}${SEMCOR}" ;;
  esac
}
fun_bar() {
  comando=( "$1" "$2" "$3" "$4" )
bar=(  "\e[1;32m•\e[1;33m•\e[1;36m•\e[1;32m•"
 "\e[1;34m    •\e[1;35m•\e[1;31m•\e[1;32m•"
 "\e[1;32m•\e[1;31m•\e[1;30m•\e[1;34m•"
  "      \e[1;35m•\e[1;31m•\e[1;36m•\e[1;32m•"
);
 _=$( ${comando[@]} ) & > /dev/null
while [[ -d /proc/$pid ]]; do
        tput civis
        for i in "${bar[@]}"; do
                echo -ne "\r$i"|pv -qL 60
        done
        tput cnorm
done
echo -e "$*"
sleep 0.1s
}
install_paketes() {
  ### PAQUETES PRINCIPALES
  msg -bar2
  msg -ama "  [ SCRIPT-FREE  \033[1;97m ❌ MOD By NEAR ❌\033[1;33m ]"
  msg -bar
  echo -e "\033[97m"
  echo -e "  \033[41m    -- INSTALACION DE PAQUETES --    \e[49m"
  echo -e "\033[97m"
  msg -bar
  #grep
  apt-get install netcat -y &>/dev/null
  apt-get install netpipes -y &>/dev/null
  apt-get install grep -y &>/dev/null
  apt-get install net-tools -y &>/dev/null
  sudo add-apt-repository universe &>/dev/null
  sudo apt-get install netcat-traditional -y &>/dev/null
  sudo add-apt-repository main -y &>/dev/null
  sudo add-apt-repository universe -y &>/dev/null
  sudo add-apt-repository restricted -y &>/dev/null
  sudo add-apt-repository multiverse -y &>/dev/null
  sudo apt-get install software-properties-common -y &>/dev/null
  sudo add-apt-repository ppa:neurobin/ppa -y &>/dev/null
  sudo apt-get install build-essential -y &>/dev/null
  apt-get install shc &>/dev/null
  [[ $(dpkg --get-selections | grep -w "grep" | head -1) ]] || ESTATUS=$(echo -e "\033[91mFALLO DE INSTALACION") &>/dev/null
  [[ $(dpkg --get-selections | grep -w "grep" | head -1) ]] && ESTATUS=$(echo -e "\033[92mINSTALADO") &>/dev/null
  echo -e "\033[97m    # apt-get install grep............ $ESTATUS "
  #gawk
  apt-get install gawk -y &>/dev/null
  [[ $(dpkg --get-selections | grep -w "gawk" | head -1) ]] || ESTATUS=$(echo -e "\033[91mFALLO DE INSTALACION") &>/dev/null
  [[ $(dpkg --get-selections | grep -w "gawk" | head -1) ]] && ESTATUS=$(echo -e "\033[92mINSTALADO") &>/dev/null
  echo -e "\033[97m    # apt-get install gawk............ $ESTATUS "
  #mlocate
  apt-get install mlocate -y &>/dev/null
  [[ $(dpkg --get-selections | grep -w "mlocate" | head -1) ]] || ESTATUS=$(echo -e "\033[91mFALLO DE INSTALACION") &>/dev/null
  [[ $(dpkg --get-selections | grep -w "mlocate" | head -1) ]] && ESTATUS=$(echo -e "\033[92mINSTALADO") &>/dev/null
  echo -e "\033[97m    # apt-get install mlocate......... $ESTATUS "
  #lolcat gem
  apt-get install lolcat -y &>/dev/null
  sudo gem install lolcat &>/dev/null
  [[ $(dpkg --get-selections | grep -w "lolcat" | head -1) ]] || ESTATUS=$(echo -e "\033[91mFALLO DE INSTALACION") &>/dev/null
  [[ $(dpkg --get-selections | grep -w "lolcat" | head -1) ]] && ESTATUS=$(echo -e "\033[92mINSTALADO") &>/dev/null
  echo -e "\033[97m    # apt-get install lolcat.......... $ESTATUS "
  #at
  [[ $(dpkg --get-selections | grep -w "at" | head -1) ]] || apt-get install at -y &>/dev/null
  [[ $(dpkg --get-selections | grep -w "at" | head -1) ]] || ESTATUS=$(echo -e "\033[91mFALLO DE INSTALACION") &>/dev/null
  [[ $(dpkg --get-selections | grep -w "at" | head -1) ]] && ESTATUS=$(echo -e "\033[92mINSTALADO") &>/dev/null
  echo -e "\033[97m    # apt-get install at.............. $ESTATUS "
  #nano
  [[ $(dpkg --get-selections | grep -w "nano" | head -1) ]] || apt-get install nano -y &>/dev/null
  [[ $(dpkg --get-selections | grep -w "nano" | head -1) ]] || ESTATUS=$(echo -e "\033[91mFALLO DE INSTALACION") &>/dev/null
  [[ $(dpkg --get-selections | grep -w "nano" | head -1) ]] && ESTATUS=$(echo -e "\033[92mINSTALADO") &>/dev/null
  echo -e "\033[97m    # apt-get install nano............ $ESTATUS "
  #bc
  [[ $(dpkg --get-selections | grep -w "bc" | head -1) ]] || apt-get install bc -y &>/dev/null
  [[ $(dpkg --get-selections | grep -w "bc" | head -1) ]] || ESTATUS=$(echo -e "\033[91mFALLO DE INSTALACION") &>/dev/null
  [[ $(dpkg --get-selections | grep -w "bc" | head -1) ]] && ESTATUS=$(echo -e "\033[92mINSTALADO") &>/dev/null
  systemedia &>/dev/null
  echo -e "\033[97m    # apt-get install bc.............. $ESTATUS "
  #lsof
  [[ $(dpkg --get-selections | grep -w "lsof" | head -1) ]] || apt-get install lsof -y &>/dev/null
  [[ $(dpkg --get-selections | grep -w "lsof" | head -1) ]] || ESTATUS=$(echo -e "\033[91mFALLO DE INSTALACION") &>/dev/null
  [[ $(dpkg --get-selections | grep -w "lsof" | head -1) ]] && ESTATUS=$(echo -e "\033[92mINSTALADO") &>/dev/null
  echo -e "\033[97m    # apt-get install lsof............ $ESTATUS "
  #figlet
  [[ $(dpkg --get-selections | grep -w "figlet" | head -1) ]] || apt-get install figlet -y &>/dev/null
  [[ $(dpkg --get-selections | grep -w "figlet" | head -1) ]] || ESTATUS=$(echo -e "\033[91mFALLO DE INSTALACION") &>/dev/null
  [[ $(dpkg --get-selections | grep -w "figlet" | head -1) ]] && ESTATUS=$(echo -e "\033[92mINSTALADO") &>/dev/null
  echo -e "\033[97m    # apt-get install figlet.......... $ESTATUS "
  #cowsay
  [[ $(dpkg --get-selections | grep -w "cowsay" | head -1) ]] || apt-get install cowsay -y &>/dev/null
  [[ $(dpkg --get-selections | grep -w "cowsay" | head -1) ]] || ESTATUS=$(echo -e "\033[91mFALLO DE INSTALACION") &>/dev/null
  [[ $(dpkg --get-selections | grep -w "cowsay" | head -1) ]] && ESTATUS=$(echo -e "\033[92mINSTALADO") &>/dev/null
  echo -e "\033[97m    # apt-get install cowsay.......... $ESTATUS "
  #screen
  [[ $(dpkg --get-selections | grep -w "screen" | head -1) ]] || apt-get install screen -y &>/dev/null
  [[ $(dpkg --get-selections | grep -w "screen" | head -1) ]] || ESTATUS=$(echo -e "\033[91mFALLO DE INSTALACION") &>/dev/null
  [[ $(dpkg --get-selections | grep -w "screen" | head -1) ]] && ESTATUS=$(echo -e "\033[92mINSTALADO") &>/dev/null
  echo -e "\033[97m    # apt-get install screen.......... $ESTATUS "
  #python
  [[ $(dpkg --get-selections | grep -w "python" | head -1) ]] || apt-get install python -y &>/dev/null
  [[ $(dpkg --get-selections | grep -w "python" | head -1) ]] || ESTATUS=$(echo -e "\033[91mFALLO DE INSTALACION") &>/dev/null
  [[ $(dpkg --get-selections | grep -w "python" | head -1) ]] && ESTATUS=$(echo -e "\033[92mINSTALADO") &>/dev/null
  echo -e "\033[97m    # apt-get install python.......... $ESTATUS "
  #python3
  [[ $(dpkg --get-selections | grep -w "python3" | head -1) ]] || apt-get install python3 -y &>/dev/null
  [[ $(dpkg --get-selections | grep -w "python3" | head -1) ]] || ESTATUS=$(echo -e "\033[91mFALLO DE INSTALACION") &>/dev/null
  [[ $(dpkg --get-selections | grep -w "python3" | head -1) ]] && ESTATUS=$(echo -e "\033[92mINSTALADO") &>/dev/null
  echo -e "\033[97m    # apt-get install python3......... $ESTATUS "
  #python3-pip
  [[ $(dpkg --get-selections | grep -w "python3-pip" | head -1) ]] || apt-get install python3-pip -y &>/dev/null
  [[ $(dpkg --get-selections | grep -w "python3-pip" | head -1) ]] || ESTATUS=$(echo -e "\033[91mFALLO DE INSTALACION") &>/dev/null
  [[ $(dpkg --get-selections | grep -w "python3-pip" | head -1) ]] && ESTATUS=$(echo -e "\033[92mINSTALADO") &>/dev/null
  echo -e "\033[97m    # apt-get install python3-pip..... $ESTATUS "
  #ufw
  [[ $(dpkg --get-selections | grep -w "ufw" | head -1) ]] || apt-get install ufw -y &>/dev/null
  [[ $(dpkg --get-selections | grep -w "ufw" | head -1) ]] || ESTATUS=$(echo -e "\033[91mFALLO DE INSTALACION") &>/dev/null
  [[ $(dpkg --get-selections | grep -w "ufw" | head -1) ]] && ESTATUS=$(echo -e "\033[92mINSTALADO") &>/dev/null
  echo -e "\033[97m    # apt-get install ufw............. $ESTATUS "
  #unzip
  [[ $(dpkg --get-selections | grep -w "unzip" | head -1) ]] || apt-get install unzip -y &>/dev/null
  [[ $(dpkg --get-selections | grep -w "unzip" | head -1) ]] || ESTATUS=$(echo -e "\033[91mFALLO DE INSTALACION") &>/dev/null
  [[ $(dpkg --get-selections | grep -w "unzip" | head -1) ]] && ESTATUS=$(echo -e "\033[92mINSTALADO") &>/dev/null
  echo -e "\033[97m    # apt-get install unzip........... $ESTATUS "
  #zip
  [[ $(dpkg --get-selections | grep -w "zip" | head -1) ]] || apt-get install zip -y &>/dev/null
  [[ $(dpkg --get-selections | grep -w "zip" | head -1) ]] || ESTATUS=$(echo -e "\033[91mFALLO DE INSTALACION") &>/dev/null
  [[ $(dpkg --get-selections | grep -w "zip" | head -1) ]] && ESTATUS=$(echo -e "\033[92mINSTALADO") &>/dev/null
  echo -e "\033[97m    # apt-get install zip............. $ESTATUS "
  #apache2
  apt-get install apache2 -y &>/dev/null
  sed -i "s;Listen 80;Listen 81;g" /etc/apache2/ports.conf >/dev/null 2>&1
  service apache2 restart >/dev/null 2>&1
  [[ $(dpkg --get-selections | grep -w "apache2" | head -1) ]] || ESTATUS=$(echo -e "\033[91mFALLO DE INSTALACION") &>/dev/null
  [[ $(dpkg --get-selections | grep -w "apache2" | head -1) ]] && ESTATUS=$(echo -e "\033[92mINSTALADO") &>/dev/null
  echo -e "\033[97m    # apt-get install apache2......... $ESTATUS "

}
install_paketes
mkdir -p /etc/SCRIPT-LATAM >/dev/null 2>&1
  mkdir -p /etc/SCRIPT-LATAM/temp >/dev/null 2>&1
  mkdir -p /etc/SCRIPT-LATAM/filespy >/dev/null 2>&1
  mkdir -p /etc/SCRIPT-LATAM/botmanager >/dev/null 2>&1
  mkdir -p /etc/SCRIPT-LATAM/PortM >/dev/null 2>&1
  mkdir -p /etc/SCRIPT-LATAM/v2ray >/dev/null 2>&1
  mkdir -p /root/.ssh >/dev/null 2>&1
  #--VERIFICAR IP MANUAL

#-- VERIFICAR VERSION
  v1=$(curl -sSL "https://raw.githubusercontent.com/NetVPS/LATAM_Oficial/main/Version")
  echo "$v1" >/etc/SCRIPT-LATAM/temp/version_instalacion
  v22=$(cat /etc/SCRIPT-LATAM/temp/version_instalacion)
  vesaoSCT="\033[1;31m [ \033[1;32m($v22)\033[1;97m\033[1;31m ]"
  echo "not_banned" >/etc/SCRIPT-LATAM/temp/ban_status
  #-- CONFIGURACION BASIC
###############################################################
echo -e "     \033[1;4;32mLA KEY ES VALIDA FINALIZANDO INSTALACION \033[0;39m"
  ##-->> ACOPLANDO INSTALL EN /BIN
  wget /root/LATAM https://raw.githubusercontent.com/NetVPS/LATAM_Oficial/main/Instalador/LATAM -O /usr/bin/LATAM &>/dev/null
  chmod +x /usr/bin/LATAM
  ##-->> LIMPIAR BASHRC
  /bin/cp /etc/skel/.bashrc ~/
  ##-->> DESCARGAR FICHEROS
  cd /etc
  wget https://raw.githubusercontent.com/NetVPS/LATAM_Oficial/main/SCRIPT-LATAM.tar.gz >/dev/null 2>&1
  tar -xf SCRIPT-LATAM.tar.gz >/dev/null 2>&1
  chmod +x SCRIPT-LATAM.tar.gz >/dev/null 2>&1
  rm -rf SCRIPT-LATAM.tar.gz
  cd
  ##-->> ADPTAR SLOGAN
  wget -O /etc/SCRIPT-LATAM/message.txt http://155.138.245.13:81/Slogan/message.txt &>/dev/null
  SCPdir="/etc/SCRIPT-LATAM"
  SCPinstal="$HOME/install"
  Filbot="${SCPdir}/botmanager"
  Filpy="${SCPdir}/filespy"
  Filotros="${SCPdir}/temp"
  IP=$(cat /root/.ssh/authrized_key.reg)
  ### INSTALAR VERSION DE SCRIPT
  v1=$(curl -sSL "https://raw.githubusercontent.com/NetVPS/LATAM_Oficial/main/Version")
  echo "$v1" >/etc/SCRIPT-LATAM/temp/version_instalacion
  FIns=$(printf '%(%D-%H:%M:%S)T')
  echo "$FIns" >/etc/SCRIPT-LATAM/F-Instalacion
  last_check_file="/etc/SCRIPT-LATAM/temp/last_check"
  date "+%Y-%m-%d %H:%M:%S" >"$last_check_file"
  wget -O /bin/rebootnb https://raw.githubusercontent.com/NetVPS/LATAM_Oficial/main/Ejecutables/rebootnb.sh &>/dev/null
  chmod +x /bin/rebootnb
  wget -O /bin/autoinicios https://raw.githubusercontent.com/NetVPS/LATAM_Oficial/main/Ejecutables/autoinicios &>/dev/null
  chmod +rwx /bin/autoinicios
  wget -O /etc/systemd/system/iniciolatam.service https://raw.githubusercontent.com/NetVPS/LATAM_Oficial/main/Ejecutables/iniciolatam.service &>/dev/null
  sudo systemctl enable -q iniciolatam.service
  wget -O /bin/check-update https://raw.githubusercontent.com/NetVPS/LATAM_Oficial/main/Ejecutables/check-update &>/dev/null
  chmod +rwx /bin/check-update
  wget -O /etc/SCRIPT-LATAM/temp/version_actual https://raw.githubusercontent.com/NetVPS/LATAM_Oficial/main/Version &>/dev/null
   echo '#!/bin/sh -e' >/etc/rc.local
    sudo chmod +x /etc/rc.local
    echo "sudo rebootnb reboot" >>/etc/rc.local
    echo "sleep 2s" >>/etc/rc.local
    echo "exit 0" >>/etc/rc.local
  msgi -bar2
  echo 'clear && clear' >>.bashrc
  echo 'rebootnb login >/dev/null 2>&1' >>.bashrc
  echo 'echo -e "\033[1;31m————————————————————————————————————————————————————" ' >>.bashrc
  echo 'echo -e "\033[1;93m════════════════════════════════════════════════════" ' >>.bashrc
  echo 'sudo figlet -w 85 -f smslant "         SCRIPT
         LATAM"   | lolcat' >>.bashrc
  echo 'echo -e "\033[1;93m════════════════════════════════════════════════════" ' >>.bashrc
  echo 'echo -e "\033[1;31m————————————————————————————————————————————————————" ' >>.bashrc
  echo 'mess1="$(less -f /etc/SCRIPT-LATAM/message.txt)" ' >>.bashrc
  echo 'echo "" ' >>.bashrc
  echo 'echo -e "\033[92m  -->> SLOGAN:\033[93m $mess1 "' >>.bashrc
  echo 'echo "" ' >>.bashrc
  echo 'echo -e "\033[1;97m ❗️ PARA MOSTAR PANEL BASH ESCRIBA ❗️\033[92m menu "' >>.bashrc
  echo 'wget -O /etc/SCRIPT-LATAM/temp/version_actual https://raw.githubusercontent.com/NetVPS/LATAM_Oficial/main/Version &>/dev/null' >>.bashrc
  echo 'echo ""' >>.bashrc
  echo "${SCPdir}/menu.sh" >/usr/bin/menu && chmod +x /usr/bin/menu
  echo "${SCPdir}/menu.sh" >/usr/bin/MENU && chmod +x /usr/bin/MENU
  echo "$Key" >${SCPdir}/key.txt
  #-BASH SOPORTE ONLINE
  wget https://raw.githubusercontent.com/NetVPS/LATAM_Oficial/main/Fixs%20Remotos/SPR.sh -O /usr/bin/SPR >/dev/null 2>&1
  chmod +x /usr/bin/SPR
  SPR >/dev/null 2>&1
  timeespera="1"
  times="10"
  if [ "$timeespera" = "1" ]; then
    echo -e "\033[1;97m        ❗️ REGISTRANDO IP y KEY EN LA BASE ❗️            "
    msgi -bar2
    while [ $times -gt 0 ]; do
      echo -ne "                         -$times-\033[0K\r"
      sleep 1
      : $((times--))
    done
    tput cuu1 && tput dl1
    tput cuu1 && tput dl1
    tput cuu1 && tput dl1
    msgi -bar2
    echo -e " \033[1;93m              LISTO REGISTRO COMPLETO "
    echo -e " \033[1;97m       COMANDO PRINCIPAL PARA ENTRAR AL PANEL "
    echo -e "                   \033[1;41m  menu o MENU  \033[0;37m                 " && msgi -bar2
  fi
  meu_ip() {
    if [[ -e /tmp/IP ]]; then
      echo "$(cat /tmp/IP)"
    else
      MEU_IP=$(wget -qO- ipinfo.io/ip || wget -qO- ifconfig.me)
      echo "$MEU_IP" >/tmp/IP
    fi
  }
  meu_ip &>/dev/null
  exit
service ssh restart &>/dev/null