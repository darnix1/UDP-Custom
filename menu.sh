#!/bin/bash
SCPdir="/etc/VPS-MX"
SCPusr"${SCPdir}/controlador"
SCPfrm="${SCPdir}/herramientas"
SCPinst="${SCPdir}/protocolos"
SCPinstal="$HOME/instal"
mkdir ${SCPinstal}
verificar_arq () {
[[ ! -d ${SCPdir} ]] && mkdir -p ${SCPdir}
[[ ! -d ${SCPusr} ]] && mkdir -p ${SCPusr}
[[ ! -d ${SCPfrm} ]] && mkdir -p ${SCPfrm}
[[ ! -d ${SCPinst} ]] && mkdir -p ${SCPinst}
[[ ! -d ${SCPdir}/tmp ]] && mkdir -p ${SCPdir}/tmp
case $1 in
"menu"|"message.txt"|"ID")ARQ="${SCPdir}/";; #Menu
"usercodes")ARQ="${SCPusr}/";; #Panel SSRR
"C-SSR.sh")ARQ="${SCPinst}/";; #Panel SSR
"openssh.sh")ARQ="${SCPinst}/";; #OpenVPN
"squid.sh")ARQ="${SCPinst}/";; #Squid
"dropbear.sh"|"proxy.sh"|"wireguard.sh")ARQ="${SCPinst}/";; #Instalacao
"proxy.sh")ARQ="${SCPinst}/";; #Instalacao
"openvpn.sh")ARQ="${SCPinst}/";; #Instalacao
"drowkid.sh"|"ssl.sh"|"python.py")ARQ="${SCPinst}/";; #Instalacao
"shadowsocks.sh")ARQ="${SCPinst}/";; #Instalacao
"Shadowsocks-libev.sh")ARQ="${SCPinst}/";; #Instalacao
"Shadowsocks-R.sh")ARQ="${SCPinst}/";; #Instalacao
"v2ray.sh"|"slowdns.sh")ARQ="${SCPinst}/";; #Instalacao
"budp.sh")ARQ="${SCPinst}/";; #Instalacao
"name")ARQ="${SCPdir}/tmp/";; #Instalacao
"sockspy.sh"|"PDirect.py"|"PPub.py"|"PPriv.py"|"POpen.py"|"PGet.py")ARQ="${SCPinst}/";; #Instalacao
*)ARQ="${SCPfrm}/";; #Herramientas
esac
mv -f ${SCPinstal}/$1 ${ARQ}/$1
chmod +x ${ARQ}/$1
}
wget -O lista-arq https://gitlab.com/patomods/vpsmx/-/raw/main/files/lista-arq
	for arqx in `cat lista-arq`; do
		wget -O ${SCPinstal}/$arqx https://gitlab.com/patomods/vpsmx/-/raw/main/files/$arqx &> /dev/null
		verificar_arq "$arqx" || echo -e "\e[1;31m[x] error [x]"
	done
