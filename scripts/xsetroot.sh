while true; do

    
    # Sistema e Data
    LINUX="Linux:($(uname -r | cut -d"-" -f1))"
    DATE="$(date +%H:%M) | $(date +%a) | $(date +%d/%m/%y)"
    MEM="$(free  -h | awk '/^Mem:/ {print $3}')"
    # Output su xsetroot
    xsetroot -name " $LINUX | $MEM |$DATE "
    sleep 60
done
