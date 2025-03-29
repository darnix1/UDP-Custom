#!/bin/bash

# Función para obtener la versión desde GitHub
get_version() {
    VERSION_URL="https://raw.githubusercontent.com/tu-usuario/tu-repositorio/main/version.txt"
    VERSION=$(curl -s "$VERSION_URL" || echo "v?.?.?")
    echo "$VERSION"
}

# Función para mostrar el banner
show_banner() {
    # Colores ANSI
    BG_COLOR="\e[48;5;214m"  # Fondo naranja claro
    TEXT_COLOR="\e[38;5;0m"  # Texto negro
    RESET="\e[0m"            # Restablecer estilos

    # Mostrar el banner
    echo -e "${BG_COLOR}${TEXT_COLOR}   💻 𝘿 𝘼 𝙍 𝙉 𝙄 𝙓 | 𝙑 ${VERSION} 💻   ${RESET}"
    echo "Bienvenido a DARNIX - Tu herramienta de automatización favorita."
    echo ""
}

# Función para mostrar opciones con colores
show_options() {
    # Colores ANSI
    OPTION_COLOR="\e[38;5;39m"  # Verde claro
    RESET="\e[0m"               # Restablecer estilos

    echo "Seleccione una opción:"
    echo -e "${OPTION_COLOR}1. Opción 1: Descripción de la opción 1${RESET}"
    echo -e "${OPTION_COLOR}2. Opción 2: Descripción de la opción 2${RESET}"
    echo -e "${OPTION_COLOR}3. Opción 3: Descripción de la opción 3${RESET}"
    echo -e "${OPTION_COLOR}4. Salir${RESET}"
    echo ""
}

# Obtener la versión actual
VERSION=$(get_version)

# Mostrar el banner
show_banner

# Mostrar opciones
show_options

# Leer la elección del usuario
read -p "Ingrese su elección [1-4]: " choice
echo ""

# Procesar la elección del usuario
case $choice in
    1)
        echo "Ejecutando Opción 1..."
        # Aquí va el código para la opción 1
        ;;
    2)
        echo "Ejecutando Opción 2..."
        # Aquí va el código para la opción 2
        ;;
    3)
        echo "Ejecutando Opción 3..."
        # Aquí va el código para la opción 3
        ;;
    4)
        echo "Saliendo del script..."
        exit 0
        ;;
    *)
        echo "Opción inválida. Intente nuevamente."
        ;;
esac
