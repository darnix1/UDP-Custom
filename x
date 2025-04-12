#!/bin/bash

fun_bar() {
    #== Comando a ejecutar ==
    comando="$1"

    #== Colores ==
    verde="\033[1;32m"
    blanco="\033[1;37m"
    rojo="\033[1;31m"
    reset="\033[0m"

    #== Animación de puntos ==
    bar=(
        "${verde}•${reset}                   "
        " ${verde}•${reset}                  "
        "  ${verde}•${reset}                 "
        "   ${blanco}•${reset}               "
        "    ${blanco}•${reset}              "
        "     ${rojo}•${reset}               "
        "      ${rojo}•${reset}              "
        "       ${rojo}•${reset}             "
        "        ${verde}•${reset}           "
        "         ${verde}•${reset}          "
        "          ${blanco}•${reset}        "
        "           ${blanco}•${reset}       "
        "            ${rojo}•${reset}        "
        "             ${rojo}•${reset}       "
        "              ${verde}•${reset}     "
        "               ${verde}•${reset}    "
        "                ${blanco}•${reset}  "
        "                 ${blanco}•${reset} "
        "                  ${rojo}•${reset}  "
        "                   ${rojo}•${reset} "
        "                  ${blanco}•${reset} "
        "                 ${verde}•${reset}  "
        "                ${verde}•${reset}   "
        "               ${blanco}•${reset}    "
        "              ${rojo}•${reset}      "
        "             ${rojo}•${reset}       "
        "            ${verde}•${reset}       "
        "           ${verde}•${reset}        "
        "          ${blanco}•${reset}        "
        "         ${rojo}•${reset}           "
    )

    #== Ejecutar comando en segundo plano ==
    _=$($comando > /dev/null 2>&1) & > /dev/null
    pid=$!

    #== Animación ==
    while [[ -d /proc/$pid ]]; do
        for i in "${bar[@]}"; do
            echo -ne "\r [ESPERE] $i"
            sleep 0.1
        done
    done

    #== Finalización ==
    echo -e "\r [LISTO]   ${verde}•${blanco}•${rojo}•${reset}   "
}

# Llamada de prueba
fun_bar "sleep 10"  # Simula un comando que tarda 3 segundos
