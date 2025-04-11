#!/bin/bash

[[ -e /bin/xdarnix/msg ]] && source /bin/xdarnix/msg || source <(curl -sSL https://raw.githubusercontent.com/darnix1/license/main/msg)

red "¡Error!"                  # Rojo brillante  
green "Éxito"                  # Verde brillante  
blue "Información"             # Azul brillante  
yellow "Advertencia"           # Amarillo brillante  
purple "Texto misterioso"      # Morado brillante  
cyan "Nota importante"         # Celeste brillante  
black "Texto oscuro"           # Negro brillante (gris claro)  
white "Texto destacado"        # Blanco brillante (fuerte)  
