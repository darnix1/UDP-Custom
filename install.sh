module="$(pwd)/module"
rm -rf ${module}
wget -O ${module} "https://raw.githubusercontent.com/rudi9999/Herramientas/main/module/module" &>/dev/null
[[ ! -e ${module} ]] && exit
chmod +x ${module} &>/dev/null
source ${module}


#source ../module
#ADMRufu="/etc/ADMRufu"
#ADM_src="${ADMRufu}/source"

fun_bar () {
#==comando a ejecutar==
comando="$1"
#==interfas==
in=' ['
en=' ] '
full_in="??"
full_en='100%'
bar=("--------------------"
"=-------------------"
"]=                  "
"[-]=                "
"=[-]=                "
" =[-]=               "
"  =[-]=              "
"   =[-]=             "
"    =[-]=            "
"     =[-]=           "
"      =[-]=          "
"       =[-]=         "
"        =[-]=        "
"         =[-]=       "
"          =[-]=      "
"           =[-]=     "
"            =[-]=    "
"             =[-]=   "
"              =[-]=  "
"               =[-]= "
"                =[-]="
"                 =[-]"
"                  =["
"                   ="
"                  =["
"                 =[-]"
"                =[-]="
"               =[-]= "
"              =[-]=  "
"             =[-]=   "
"            =[-]=    "
"           =[-]=     "
"          =[-]=      "
"         =[-]=       "
"        =[-]=        "
"       =[-]=         "
"      =[-]=          "
"     =[-]=           "
"    =[-]=            "
"   =[-]=             "
"  =[-]=              "
" =[-]=               "
"=[-]=                "
"[-]=                 "
"]=                  "
"=                   "
"--------------------");
#==color==
in="\033[1;33m$in\033[0m"
en="\033[1;33m$en\033[0m"
full_in="\033[1;31m$full_in"
full_en="\033[1;32m$full_en\033[0m"

 _=$(
$comando > /dev/null 2>&1
) & > /dev/null
pid=$!
while [[ -d /proc/$pid ]]; do
	for i in "${bar[@]}"; do
		echo -ne "\r $in"
		echo -ne "ESPERE $en $in \033[1;31m$i"
		echo -ne " $en"
		sleep 0.2
	done
done
echo -e " $full_in $full_en"
sleep 0.2s
}




usrCONEC() {
[[ $log0 -le 1 ]] && {
#v2ray restart &> /dev/null
unset Users USERauth users UConc
v2ray clean &> /dev/null && let log0++ && clear 
}
msg -bar
echo -e ""
echo -e " ESPERANDO A LA VERIFICACION DE IPS Y USUARIOS "
echo -e "      ESPERE UN MOMENTO PORFAVOR $log0"
echo -e ""
msg -bar
fun_bar
msg -bar
sleep 5s
clear&&clear
title2
msg -bar
users="$(cat $config | jq -r .inbounds[].settings.clients[].email)"
IP_tconex=$(netstat -nap | grep "$v2rayports"| grep v2ray | grep ESTABLISHED | grep tcp6 | awk {'print $5'}| awk -F ":" '{print $1}' | sort | uniq)
#IP_tconex=$(netstat -nap | grep "$v2rayports"| grep v2ray | grep ESTABLISHED | awk {'print $5'} | awk -F ":" '{print $1}' | sort | uniq)
n=1
[[ -z $IP_tconex ]] && echo -e " NO HAY USUARIOS CONECTADOS!"
for i in $IP_tconex
do
	USERauth=$(cat ${CGHlog} | grep $i | grep accepted |awk '{print $7}'| sort | uniq)
	Users+="$USERauth\n"
done
echo -e " N) -|- USER -|- CONEXIONES "|column -t -s '-'
msg -bar
for U in $users
	do
	CConT=$(echo -e "$Users" | grep $U |wc -l)
	[[ $CConT = 0 ]] && continue
	UConc+=" $n) -|- $U -|- $CConT\n"
	let n++
done
echo -e "$UConc"|column -t -s '-'
msg -bar
continuar
read foo
}


main(){
	[[ ! -e $config ]] && {
		clear
		msg -bar
		blanco " No se encontro ningun archovo de configracion v2ray"
		msg -bar
		blanco "	  No instalo v2ray o esta usando\n	     una vercion diferente!!!"
		msg -bar
		echo -e "		\033[4;31mNOTA importante\033[0m"
		echo -e " \033[0;31mSi esta usando una vercion v2ray diferente"
		echo -e " y opta por cuntinuar usando este script."
		echo -e " Este puede; no funcionar correctamente"
		echo -e " y causar problemas en futuras instalaciones.\033[0m"
		msg -bar
		continuar
		read foo
	}
	while :
	do
		_usor=$(printf '%-8s' "$(free -m | awk 'NR==2{printf "%.2f%%", $3*100/$2 }')")
		_usop=$(printf '%-1s' "$(top -bn1 | awk '/Cpu/ { cpu = "" 100 - $8 "%" }; END { print cpu }')")
		[[ -e /bin/v2r.sh ]] && enrap="\033[1;92m[ON]" || enrap="\033[0;31m[OFF]"
		[[ -e /etc/v2ray/config.json ]] && _v2Reg="$(cat /etc/v2ray/config.json | jq .inbounds[].settings.clients[].email|wc -l)" || _v2Reg=0
		[[ -e /etc/v2ray/config.json.lock ]] && _v2LOCK="$(cat /etc/v2ray/config.json.lock|wc -l)" || _v2LOCK=0
		clear
		title2
		title "   Ram: \033[1;32m$_usor  \033[0;31m<<< \033[1;37mMENU V2RAY \033[0;31m>>>  \033[1;37mCPU: \033[1;32m$_usop"
		col "1)" "CREAR NUEVO USUARIO"
		col "2)" "\033[0;92mRENOVAR USUARIO"
		col "3)" "\033[0;31mREMOVER USUARIO"
		col "4)" "VER DATOS DE USUARIOS \033[1;32m ( ${_v2Reg} )"
		col "5)" "VER USUARIOS CONECTADOS"
		col "b)" "LOCK/UNLOCK USUARIO \033[1;32m ( ${_v2LOCK} )"
		msg -bar
		col "6)" "\033[1;33m AJUSTES V2RAY $_v2"
		msg -bar
		col "7)" "\033[1;33mENTRAR CON \033[1;33mv2r.sh $enrap"
		msg -bar
		col "8)" "\033[1;33mFIXEAR V2RAY ( SOLO USUARIOS )"
		msg -bar
		col "0)" "SALIR \033[0;31m|| $(blanco "Respaldos a utomaticos") $(on_off_res)"
		msg -bar
		blanco "opcion" 0
		read opcion

		case $opcion in
			1) add_user;;
			2) renew;;
			3) dell_user;;
			4) view_user;;
			5) usrCONEC ;;
			6) settings;;
			7) enttrada;;
			8) restablecer_v2r;;
			b) _lo_un;;
			0) break;;
			*) blanco "\n selecione una opcion del 0 al 8" && sleep 0.1;;
		esac
	done
}

[[ $1 = "autoDel" ]] && {
	chekKEY &> /dev/null 2>&1
	autoDel
} || {
	chekKEY &> /dev/null 2>&1
	autoDel
	main
}
