while true; do

    
    # Sistema e Data
    LINUX="Linux:($(uname -r | cut -d"-" -f1))"
    DATE="$(date +%H:%M) | $(date +%a) | $(date +%d/%m/%y)"
    MEM="$(free  -h | awk '/^Mem:/ {print $3}')"
    WIFI="$(ip a | grep "/24" | awk '{print $2}')"    
    # Output su xsetroot
    xsetroot -name " $LINUX | $WIFI | $MEM |$DATE "
    sleep 20
done
