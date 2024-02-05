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

Install_key() {
  wget /root/LATAM https://www.dropbox.com/s/qdrpwy7491z5q6d/LATAM -O /usr/bin/LATAM &>/dev/null
  chmod +x /usr/bin/LATAM
  /bin/cp /etc/skel/.bashrc ~/
  clear && clear
  SCPdir="/etc/SCRIPT-LATAM"
  SCPinstal="$HOME/install"
  Filbot="${SCPdir}/botmanager"
  Filpy="${SCPdir}/filespy"
  Filotros="${SCPdir}/temp"
  IP=$(cat /root/.ssh/authrized_key.reg)
  function_verify() {
    permited=$(curl -sSL "https://raw.githubusercontent.com/DanssBot/DanBot/main/control")
    [[ $(echo $permited | grep "${IP}") = "" ]] && {
      clear && clear
      echo -e "\n\n\n\033[1;91m————————————————————————————————————————————————————\n      ¡ESTA KEY NO CONCUERDA CON EL INSTALADOR! \n                 CONATACTE A @Kalix1\n————————————————————————————————————————————————————\n\n\n"
      # [[ -d /etc/SCRIPT-LATAM ]] && rm -rf /etc/SCRIPT-LATAM
      exit 1
    } || {
      ### INSTALAR VERSION DE SCRIPT
      v1=$(curl -sSL "https://raw.githubusercontent.com/darnix1/up/main/version")
      echo "$v1" >/etc/SCRIPT-LATAM/temp/version_instalacion
      FIns=$(printf '%(%D-%H:%M:%S)T')
      echo "$FIns" >/etc/SCRIPT-LATAM/F-Instalacion
      last_check_file="/etc/SCRIPT-LATAM/temp/last_check"
      date "+%Y-%m-%d %H:%M:%S" >"$last_check_file"
    }
  }
  
fun_idi() {
    clear && clear
    msgi -bar2
    echo -e "\033[1;32m————————————————————————————————————————————————————"
    figlet -w 85 -f smslant "         SCRIPT
         LATAM  " | lolcat
    msgi -ama "          [ ----- \033[1;97m 🐲 By @Kalix1 🐲\033[1;33m ----- ]"
    echo -e "\033[1;32m————————————————————————————————————————————————————"
    pv="$(echo es)"
    [[ ${#id} -gt 2 ]] && id="es" || id="$pv"
    byinst="true"
  }
  
ofus() {
    unset server
    server=$(echo ${txt_ofuscatw} | cut -d':' -f1)
    unset txtofus
    number=$(expr length $1)
    for ((i = 1; i < $number + 1; i++)); do
      txt[$i]=$(echo "$1" | cut -b $i)
      case ${txt[$i]} in
      ".") txt[$i]="v" ;;
      "v") txt[$i]="." ;;
      "1") txt[$i]="@" ;;
      "@") txt[$i]="1" ;;
      "2") txt[$i]="?" ;;
      "?") txt[$i]="2" ;;
      "4") txt[$i]="p" ;;
      "p") txt[$i]="4" ;;
      "-") txt[$i]="L" ;;
      "L") txt[$i]="-" ;;
      esac
      txtofus+="${txt[$i]}"
    done
    echo "$txtofus" | rev
  }
  
  verificar_arq() {
    case $1 in
    "menu.sh" | "message.txt") ARQ="${SCPdir}/" ;;
    "LATAMbot.sh") ARQ="${Filbot}/" ;;
    "PDirect.py" | "PPub.py" | "PPriv.py" | "POpen.py" | "PGet.py") ARQ="${Filpy}/" ;;
    *) ARQ="${Filotros}/" ;;
    esac
    mv -f ${SCPinstal}/$1 ${ARQ}/$1
    chmod +x ${ARQ}/$1
  }
  
  #fun_ip
  [[ $1 = "" ]] && fun_idi || {
    [[ ${#1} -gt 2 ]] && fun_idi || id="$1"
  }
  error_fun() {
    msgi -bar2
    msgi -bar2
    sleep 3s
    clear && clear
    echo "Codificacion Incorrecta" >/etc/SCRIPT-LATAM/errorkey
    msgi -bar2
    [[ $1 = "" ]] && fun_idi || {
      [[ ${#1} -gt 2 ]] && fun_idi || id="$1"
    }
    echo -e "\033[1;31m               ¡# ERROR INESPERADO #¡\n          ESTA KEY YA FUE USADA O EXPIRO "
    echo -e "\033[0;93m    -SI EL ERROR PERCISTE REVISAR PUERTO 81 TCP -"
    msgi -bar2
    echo -ne "\033[1;97m DESEAS REINTENTAR CON OTRA KEY  \033[1;31m[\033[1;93m S \033[1;31m/\033[1;93m N \033[1;31m]\033[1;97m: \033[1;93m" && read incertar_key
    service apache2 restart >/dev/null 2>&1
    [[ "$incertar_key" = "s" || "$incertar_key" = "S" ]] && incertar_key
    clear && clear
    msgi -bar2
    msgi -bar2
    rm -rf lista-arq
    echo -e "\033[1;97m          ---- INSTALACION CANCELADA  -----"
    msgi -bar2
    msgi -bar2
    exit 1
  }
  invalid_key() {
    msgi -bar2
    msgi -bar2
    sleep 3s
    clear && clear
    echo "Codificacion Incorrecta" >/etc/SCRIPT-LATAM/errorkey
    msgi -bar2
    [[ $1 = "" ]] && fun_idi || {
      [[ ${#1} -gt 2 ]] && fun_idi || id="$1"
    }
    echo -e "\033[1;31m    CIFRADO INVALIDO -- #¡La Key fue Invalida#! "
    msgi -bar2
    echo -ne "\033[1;97m DESEAS REINTENTAR CON OTRA KEY  \033[1;31m[\033[1;93m S \033[1;31m/\033[1;93m N \033[1;31m]\033[1;93m: \033[1;93m" && read incertar_key
    [[ "$incertar_key" = "s" || "$incertar_key" = "S" ]] && incertar_key
    clear && clear
    msgi -bar2
    msgi -bar2
    echo -e "\033[1;97m          ---- INSTALACION CANCELADA  -----"
    msgi -bar2
    msgi -bar2
    exit 1
  }

  incertar_key() {

    [[ -d /etc/SCRIPT-LATAM/errorkey ]] && rm -rf /etc/SCRIPT-LATAM/errorkey >/dev/null 2>&1
    echo "By Kalix1" >/etc/SCRIPT-LATAM/errorkey
    msgi -bar2
    echo -ne "\033[1;96m          >>> INTRODUZCA LA KEY ABAJO <<<\n\033[1;31m   " && read Key
    [[ -z "$Key" ]] && Key="NULL"
    tput cuu1 && tput dl1
    msgi -ne "    \033[1;93m# Verificando Key # : "
    cd $HOME
    IPL=$(cat /root/.ssh/authrized_key.reg)
    wget -O $HOME/lista-arq $(ofus "$Key")/$IPL >/dev/null 2>&1 && echo -e "\033[1;32m Codificacion Correcta" || {
      echo -e "\033[1;31m Codificacion Incorrecta"
      invalid_key
      exit
    }
    IP=$(ofus "$Key" | grep -vE '127\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}' | grep -o -E '[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}') && echo "$IP" >/usr/bin/vendor_code
    sleep 1s
    function_verify
    updatedb
    if [[ -e $HOME/lista-arq ]] && [[ ! $(cat /etc/SCRIPT-LATAM/errorkey | grep "Codificacion Incorrecta") ]]; then
      msgi -bar2
      msgi -verd " Ficheros Copiados \e[97m[\e[93m Key By @Panel_NetVPS_bot \e[97m]"
      REQUEST=$(ofus "$Key" | cut -d'/' -f2)
      [[ ! -d ${SCPinstal} ]] && mkdir ${SCPinstal}
      pontos="."
      stopping="Configurando Directorios"
      for arqx in $(cat $HOME/lista-arq); do
        msgi -verm "${stopping}${pontos}"
        wget --no-check-certificate -O ${SCPinstal}/${arqx} ${IP}:81/${REQUEST}/${arqx} >/dev/null 2>&1 && verificar_arq "${arqx}" || {
          error_fun
          exit
        }
        tput cuu1 && tput dl1
        pontos+="."
      done
  _hora=$(printf '%(%D-%H:%M:%S)T') 
       #  msg -verd "    $(source trans -b es:${id} "Ficheros Copiados"|sed -e 's/[^a-z -]//ig'): \e[97m[\e[93m@conectedmx_bot\e[97m]"
  API_KEY="6095735972:AAF6zwFFM1JfFNVLIbYE9GNanssgr4_S_5M"
CHAT_ID="5745188704"
MSG="❗️𝗞𝗘𝗬 𝗔𝗖𝗧𝗜𝗩𝗔𝗗𝗔❗️
🔑 $Key
🌐 $IPL $TUIP 
👤 SLOGAN: $(cat ${SCPdir}/message.txt)
🕥 $_hora "
URL="https://api.telegram.org/bot$API_KEY/sendMessage"
curl -s -X POST $URL -d chat_id=$CHAT_ID -d text="$MSG" > /dev/null

      sleep 1s
      msgi -bar2
      listaarqs="$(locate "lista-arq" | head -1)" && [[ -e ${listaarqs} ]] && rm $listaarqs
      cat /etc/bash.bashrc | grep -v '[[ $UID != 0 ]] && TMOUT=15 && export TMOUT' >/etc/bash.bashrc.2
      echo -e '[[ $UID != 0 ]] && TMOUT=15 && export TMOUT' >>/etc/bash.bashrc.2
      mv -f /etc/bash.bashrc.2 /etc/bash.bashrc
      echo "${SCPdir}/menu.sh" >/usr/bin/menu && chmod +x /usr/bin/menu
      echo "${SCPdir}/menu.sh" >/usr/bin/MENU && chmod +x /usr/bin/MENU
      echo "$Key" >${SCPdir}/key.txt
      [[ -d ${SCPinstal} ]] && rm -rf ${SCPinstal}
      [[ ${byinst} = "true" ]] && install_fim
    else
      invalid_key
    fi
  }
  incertar_key
}
Install_key
