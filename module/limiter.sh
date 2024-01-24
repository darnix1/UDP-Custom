function efecto_pedorro(){
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
sleep 0.5s
}

