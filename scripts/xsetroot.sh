while true; do
    # Batteria e Consumo Energetico
    BAT=$(cat /sys/class/power_supply/BAT0/capacity)
    if [ -f /sys/class/power_supply/BAT0/current_now ] && [ -f /sys/class/power_supply/BAT0/voltage_now ]; then
        CURRENT=$(cat /sys/class/power_supply/BAT0/current_now)
        VOLTAGE=$(cat /sys/class/power_supply/BAT0/voltage_now)
        WATTS=$(awk "BEGIN {printf \"%.2fW\", ($CURRENT * $VOLTAGE)/1000000000000}")
    else
        WATTS="N/A"
    fi

    # Wi-Fi tramite nmcli
    # Ricava SSID e Segnale (%) dell'interfaccia Wi-Fi attiva
    WIFI_INFO=$(nmcli | grep -E "(^| )wlo1:" | cut -d " " -f4-7)
    #nmcli -f IN-USE,SSID,SIGNAL device wifi | grep "*"
    if [ -n "$WIFI_INFO" ]; then
        SSID=$(echo "$WIFI_INFO" | cut -d';' -f1)
        quality=$(nmcli -f IN-USE,SIGNAL device wifi | grep "*" | cut -d "*" -f2)
        if [ "$quality" -gt 75 ]; then
            WIFI_ICON="󰤨"
        elif [ "$quality" -gt 50 ]; then
            WIFI_ICON="󰤥"
        elif [ "$quality" -gt 25 ]; then
            WIFI_ICON="󰤢"
        else
            WIFI_ICON="󰤟"
        fi
        WIFI="$WIFI_ICON  $SSID"
    else
        WIFI="󰤯 Disconnected"
    fi

    # Sistema e Data
    LINUX="Linux:($(uname -r | cut -d"-" -f1))"
    DATE="$(date +%H:%M) | $(date +%a) | $(date +%d/%m/%y)"
    MEM="$(free  -h | awk '/^Mem:/ {print $3}')"
    # Output su xsetroot
    xsetroot -name " $LINUX | $WIFI | $MEM | $DATE |🔋$BAT%($WATTS) "
    sleep 20
done
