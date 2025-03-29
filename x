#!/bin/bash

# Función para obtener la versión desde GitHub
get_version() {
    VERSION_URL="https://raw.githubusercontent.com/tu-usuario/tu-repositorio/main/version.txt"
    VERSION=$(curl -s "$VERSION_URL" || echo "v?.?.?")
    echo "$VERSION"
}

# Función para mostrar el banner
show_banner() {
    # Detectar si el terminal soporta colores (tema claro u oscuro)
    if [[ $(tput colors) -ge 256 ]]; then
        BG_COLOR="\e[48;5;214m"  # Naranja claro
        TEXT_COLOR="\e[38;5;0m"  # Negro
    else
        BG_COLOR="\e[48;5;208m"  # Naranja básico
        TEXT_COLOR="\e[38;5;15m" # Blanco
    fi

    # Mostrar el banner
    echo -e "${BG_COLOR}${TEXT_COLOR}   💻 𝘿 𝘼 𝙍 𝙉 𝙄 𝙓 | 𝙑 ${VERSION} 💻   \e[0m"
    echo "Bienvenido a DARNIX - Tu herramienta de automatización favorita."
    echo ""
}

# Función para mostrar un menú interactivo
show_menu() {
    echo "Seleccione una opción:"
    echo "1. Opción 1: Descripción de la opción 1"
    echo "2. Opción 2: Descripción de la opción 2"
    echo "3. Opción 3: Descripción de la opción 3"
    echo "4. Salir"
    echo ""
    read -p "Ingrese su elección [1-4]: " choice
    echo ""

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
            show_menu
            ;;
    esac
}

# Función para animación de carga
loading_animation() {
    echo -n "Cargando "
    for i in {1..5}; do
        echo -n "."
        sleep 0.3
    done
    echo ""
}

# Obtener la versión actual
VERSION=$(get_version)

# Mostrar el banner
show_banner

# Animación de carga
loading_animation

# Mostrar el menú interactivo
while true; do
    show_menu
done
