#!/bin/bash
module="$(pwd)/module"
rm -rf ${module}
wget -O ${module} "https://raw.githubusercontent.com/darnix1/UDP-Custom/main/colores" &>/dev/null
[[ ! -e ${module} ]] && exit
chmod +x ${module} &>/dev/null
source ${module}


# Function to display the menu header
enc_darnix() {
    title "MENU WS-EPRO | SCRIPT-LATAM"
}

# Function to display the menu options
display_menu() {
    enc_darnix
    echo -e "${YELLOW}[${GREEN}1${YELLOW}]${RESET} ATIVAR WS-EPRO CLOUDFLARE"
    echo -e "${YELLOW}[${GREEN}2${YELLOW}]${RESET} MODIFICAR PORTA WS-EPRO"
    echo -e "${YELLOW}[${GREEN}3${YELLOW}]${RESET} DESATIVAR WS-EPRO"
    echo -e "${YELLOW}[${GREEN}0${YELLOW}]${RESET} SAIR DOS PROTOCOLOS"
    echo
    read -p " SELECIONE UMA OPÇÃO : " option

    case $option in
        1) activate_ws_epro ;;
        2) modify_ws_epro_port ;;
        3) deactivate_ws_epro ;;
        0) exit ;;
        *) echo -e "Opção inválida. Tente novamente." ;;
    esac

    echo -ne "\nPressione Enter para continuar"
    read -r enter
    display_menu
}

# Function to install and activate WS-EPRO
activate_ws_epro() {
    enc_darnix
    echo -e "${YELLOW}     >>> ${GREEN}INSTALANDO SERVIDOR PYTHON WS-EPRO ${YELLOW}<<<${RESET}"
    sleep 0.3
    echo

    # Download and install ws-epro
    download_and_install "https://docs.google.com/uc?export=download&id=1IbwfNpKpa1JzvXsDT-WgNpp5nWrklisG" "/usr/local/bin/ws-epro"

    # Download and install ws-epro service
    download_and_install "https://docs.google.com/uc?export=download&id=10hGKYNZUMHdr4y-ZxMr0wKQpj9zSQRkZ" "/etc/systemd/system/ws-epro.service"

    # Download and install ws-epro port script
    download_and_install "https://docs.google.com/uc?export=download&id=1h9QvOnXScplGTnfpbJ7KJDn4CDkwUKWa" "/usr/bin/ws-port"

    # Set port configurations
    read -p " ✓ PORTA PARA PHYTON : " wsopenssh
    read -p " ✓ PORTA LOCAL (ssh|ssl|openvpn): " openssh

    WS_DIR="/usr/local/etc/ws-epro"
    [ -d "$WS_DIR" ] && rm -rf "$WS_DIR"
    sleep 0.3
    mkdir -p "$WS_DIR"

    # Create configuration file
    cat <<EOF > "$WS_DIR/config.yml"
# verbose level 0=info, 1=verbose, 2=very verbose
verbose: 0
listen:
##openssh
- target_host: 127.0.0.1
##portopenssh
  target_port: $openssh
##wsopenssh
  listen_port: $wsopenssh
EOF

    chmod +x "$WS_DIR/config.yml"

    # Enable and start ws-epro service
    systemctl enable ws-epro
    systemctl start ws-epro

    sleep 0.3
    enc_darnix
    echo
    echo -e "${YELLOW}          INSTALADO WS-EPRO (TURBONET-PRO) ${RESET}"
    echo -e "${YELLOW}          PORTAS UTILIZADAS PARA CONEXÃO: ${RESET}"
    echo -e "${YELLOW}        ╔═══════════════════════╗${RESET}"
    echo -e "${YELLOW}             Puerto Local SSH: ${GREEN}$openssh${RESET}"
    echo -e "${YELLOW}             Puerto Phyton: ${GREEN}$wsopenssh${RESET}"
    echo -e "${YELLOW}          ╚═══════════════════════╝${RESET}"
}

# Function to download and install a file
download_and_install() {
    local download_url=$1
    local install_path=$2

    wget -q --progress=bar:fun_bar --load-cookies /tmp/cookies.txt "$download_url" -O "$install_path" && rm -rf /tmp/cookies.txt
chmod +x "$install_path"

}

# Function to modify WS-EPRO port
modify_ws_epro_port() {
    ws-port
    echo -ne "\nPressione Enter para continuar"
    read -r enter
}

# Function to deactivate WS-EPRO
deactivate_ws_epro() {
    pkill -f ws-epro
    WS_DIR="/usr/local/etc/ws-epro"
    [ -d "$WS_DIR" ] && rm -rf "$WS_DIR"
    echo -e "${YELLOW}.  >>> PROTOCOLO WS-EPRO DESATIVADO <<< ${RESET}"
}

# Main execution starts here
display_menu
