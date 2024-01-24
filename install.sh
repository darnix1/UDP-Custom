#!/bin/bash
##-->> INSTALADOR --- ACTUALIZADO EL 16-03-2023 -- >> By @Kalix1 << ---
clear && clear
colores="$(pwd)/colores"
rm -rf ${colores}
wget -O ${colores} "https://raw.githubusercontent.com/NetVPS/LATAM_Oficial/main/Ejecutables/colores" &>/dev/null
[[ ! -e ${colores} ]] && exit
chmod +x ${colores} &>/dev/null
##-->> CARGAR SC EXTERNO
source $(pwd)/colores
CTRL_C() {
  rm -rf ${colores}
  rm -rf $(pwd)/LATAM
  exit
}
##-->> DETECTAR CANCELAR Y ELIMINAR ARCHIVO
trap "CTRL_C" INT TERM EXIT
rm $(pwd)/$0 &>/dev/null
#-->> DETECTAR ROOT
if [ $(whoami) != 'root' ]; then
  echo ""
  echo -e "\033[1;31m NECESITAS SER USER ROOT PARA EJECUTAR EL SCRIPT \n\n\033[97m                DIGITE: \033[1;32m sudo su\n"
  exit
fi
if fuser /var/lib/dpkg/lock >/dev/null 2>&1; then
  echo -e "\033[1;31mEl sistema de actualización está siendo utilizado por otro proceso. Deteniendo el proceso..."
  pid=$(fuser /var/lib/dpkg/lock 2>/dev/null)
  if [ ! -z "$pid" ]; then
    echo -e "\033[1;31mDeteniendo el proceso $pid..."
    kill -9 $pid >/dev/null 2>&1
  fi
fi
os_system() {
  system=$(cat -n /etc/issue | grep 1 | cut -d ' ' -f6,7,8 | sed 's/1//' | sed 's/      //')
  distro=$(echo "$system" | awk '{print $1}')

  case $distro in
  Debian) vercion=$(echo $system | awk '{print $3}' | cut -d '.' -f1) ;;
  Ubuntu) vercion=$(echo $system | awk '{print $2}' | cut -d '.' -f1,2) ;;
  esac
}
repo() {
  link="https://raw.githubusercontent.com/NetVPS/LATAM_Oficial/main/Source-List/$1.list"
  case $1 in
  8 | 9 | 10 | 11 | 16.04 | 18.04 | 20.04 | 20.10 | 21.04 | 21.10 | 22.04) wget -O /etc/apt/sources.list ${link} &>/dev/null ;;
  esac
}
##-->> PREPARAR PAQUETERIAS Y DIRECTORIOS
install_inicial() {
  clear && clear
  #CARPETAS PRINCIPALES
  mkdir -p /etc/SCRIPT-LATAM >/dev/null 2>&1
  mkdir -p /etc/SCRIPT-LATAM/temp >/dev/null 2>&1
  mkdir -p /etc/SCRIPT-LATAM/filespy >/dev/null 2>&1
  mkdir -p /etc/SCRIPT-LATAM/botmanager >/dev/null 2>&1
  mkdir -p /etc/SCRIPT-LATAM/PortM >/dev/null 2>&1
  mkdir -p /etc/SCRIPT-LATAM/v2ray >/dev/null 2>&1
  mkdir -p /root/.ssh >/dev/null 2>&1
  #--VERIFICAR IP MANUAL
  tu_ip() {
    echo ""
    echo -ne "\033[1;96m #Digite tu IP Publica (IPV4): \033[32m" && read IP
    val_ip() {
      local ip=$IP
      local stat=1
      if [[ $ip =~ ^[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}$ ]]; then
        OIFS=$IFS
        IFS='.'
        ip=($ip)
        IFS=$OIFS
        [[ ${ip[0]} -le 255 && ${ip[1]} -le 255 && ${ip[2]} -le 255 && ${ip[3]} -le 255 ]]
        stat=$?
      fi
      return $stat
    }
    if val_ip $IP; then
      mkdir -p /root/.ssh
      echo "$IP" >/root/.ssh/authrized_key.reg
    else
      echo ""
      echo -e "\033[31mLa IP Digitada no es valida, Verifiquela"
      echo ""
      sleep 5s
      fun_ip
    fi
  }
  #CONFIGURAR SSH-ROOT PRINCIPAL AMAZON, GOOGLE

  
  ##-->>AGREGAR NOTIFICADOR ROOT
  
  #-- VERIFICAR VERSION
  v1=$(curl -sSL "https://raw.githubusercontent.com/NetVPS/LATAM_Oficial/main/Version")
  echo "$v1" >/etc/SCRIPT-LATAM/temp/version_instalacion
  v22=$(cat /etc/SCRIPT-LATAM/temp/version_instalacion)
  vesaoSCT="\033[1;31m [ \033[1;32m($v22)\033[1;97m\033[1;31m ]"
  echo "not_banned" >/etc/SCRIPT-LATAM/temp/ban_status
  #-- CONFIGURACION BASICA
  os_system
  repo "${vercion}"
  msgi -bar2
  echo -e " \e[5m\033[1;100m   =====>> ►►  🖥  SCRIPT | LATAM  🖥  ◄◄ <<=====   \033[1;37m"
  msgi -bar2
  msgi -ama "   PREPARANDO INSTALACION | VERSION: $vesaoSCT"
  msgi -bar2
  ## PAQUETES-UBUNTU PRINCIPALES
  echo ""
  echo -e "\033[1;97m         🔎 IDENTIFICANDO SISTEMA OPERATIVO"
  echo -e "\033[1;32m                 | $distro $vercion |"
  echo ""
  echo -e "\033[1;97m    ◽️ DESACTIVANDO PASS ALFANUMERICO "
  [[ $(dpkg --get-selections | grep -w "libpam-cracklib" | head -1) ]] || barra_intallb "apt-get install libpam-cracklib -y &>/dev/null"
  echo -e '# Modulo Pass Simple
password [success=1 default=ignore] pam_unix.so obscure sha512
password requisite pam_deny.so
password required pam_permit.so' >/etc/pam.d/common-password && chmod +x /etc/pam.d/common-password
  [[ $(dpkg --get-selections | grep -w "libpam-cracklib" | head -1) ]] && barra_intallb "service ssh restart"
  echo ""
  msgi -bar2
  fun_ip() {
    TUIP=$(wget -qO- ipinfo.io/ip || wget -qO- ifconfig.me)
    echo "$TUIP" >/root/.ssh/authrized_key.reg
    echo -e "\033[1;97m ESTA ES TU IP PUBLICA? \033[32m$TUIP"
    msgi -bar2
    echo -ne "\033[1;97m Seleccione  \033[1;31m[\033[1;93m S \033[1;31m/\033[1;93m N \033[1;31m]\033[1;97m: \033[1;93m" && read tu_ip
    #read -p " Seleccione [ S / N ]: " tu_ip
    [[ "$tu_ip" = "n" || "$tu_ip" = "N" ]] && tu_ip
  }
  fun_ip
  for i in {1..4}; do tput cuu 1 && tput el; done
  msgi -bar2
  echo -e "\033[1;93m             AGREGAR Y EDITAR PASS ROOT\033[1;97m"
  msgi -bar
  echo -e "\033[1;97m CAMBIAR PASS ROOT? \033[32m"
  msgi -bar2
  echo -ne "\033[1;97m Seleccione  \033[1;31m[\033[1;93m S \033[1;31m/\033[1;93m N \033[1;31m]\033[1;97m: \033[1;93m" && read pass_root
  #read -p " Seleccione [ S / N ]: " tu_ip
  [[ "$pass_root" = "s" || "$pass_root" = "S" ]] && pass_root
  for i in {1..6}; do tput cuu 1 && tput el; done
  msgi -bar2
  echo -e "\033[1;93m                   AGREGAR NOTIFY \033[1;97m"
  msgi -bar
  echo -e "\033[1;97m AGREGAR REGISTRO DE NOTYFY? \033[32m"
  msgi -bar2
  echo -ne "\033[1;97m Seleccione  \033[1;31m[\033[1;93m S \033[1;31m/\033[1;93m N \033[1;31m]\033[1;97m: \033[1;93m" && read avi_login
  #read -p " Seleccione [ S / N ]: " tu_ip
  [[ "$avi_login" = "s" || "$avi_login" = "S" ]] && avi_login
  for i in {1..6}; do tput cuu 1 && tput el; done
  msgi -bar2
  echo -e "\033[1;93m\a\a\a      SE PROCEDERA A INSTALAR LAS ACTULIZACIONES\n PERTINENTES DEL SISTEMA, ESTE PROCESO PUEDE TARDAR\n VARIOS MINUTOS Y PUEDE PEDIR ALGUNAS CONFIRMACIONES \033[0;37m"
  msgi -bar
  read -t 120 -n 1 -rsp $'\033[1;97m           Preciona Enter Para continuar\n'
  clear && clear
  apt update
  apt upgrade -y
  wget -O /usr/bin/LATAM https://raw.githubusercontent.com/NetVPS/LATAM_Oficial/main/Instalador/LATAM &>/dev/null
  chmod +x /usr/bin/LATAM
}


dependencias() {
  dpkg --configure -a >/dev/null 2>&1
  apt -f install -y >/dev/null 2>&1
  packages="zip unzip python python3 python3-pip openssl iptables lsof pv boxes at mlocate gawk bc jq npm nodejs socat net-tools cowsay figlet lolcat"
  for i in $packages; do
    paquete="$i"
    echo -e "\033[1;97m        INSTALANDO PAQUETE \e[93m >>> \e[36m $i"
    barra_intall "apt-get install $i -y"
  done
}

install_paquetes() {
  clear && clear
  msgi -bar2
  echo -e " \e[33m\e[5m\033[1;100m   =====>> ►►  🖥  SCRIPT | LATAM  🖥  ◄◄ <<=====   \033[1;37m"
  msgi -bar
  echo -e "  \033[1;41m    -- INSTALACION DE PAQUETES PARA LATAM --   \e[49m"
  msgi -bar
  dependencias
  echo -e "\e[1;97m          REMOVIENDO PAQUETES OBSOLETOS \e[1;32m"
  barra_intallb "apt autoremove -y "
  echo iptables-persistent iptables-persistent/autosave_v4 boolean true | sudo debconf-set-selections
  echo iptables-persistent iptables-persistent/autosave_v6 boolean true | sudo debconf-set-selections
  msgi -bar2
  read -t 30 -n 1 -rsp $'\033[1;97m           Preciona Enter Para continuar\n'
}
#SELECTOR DE INSTALACION
while :; do
  case $1 in
  -s | --start) install_inicial  "15" ;;
  
    install_paquetes
    rm -rf /root/LATAM &>/dev/null
    break
    ;;
  -k | --instalador_final)
    clear && clear
    break
    ;;
  *) exit ;;
  esac
done

instalador_final() {
  tput cuu1 && tput dl1
  tput cuu1 && tput dl1
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
}
instalador_final
