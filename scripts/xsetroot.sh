
while true; do
    BAT=`cat /sys/class/power_supply/BAT0/capacity`
    if [ -f /sys/class/power_supply/BAT0/current_now ] && [ -f /sys/class/power_supply/BAT0/voltage_now ]; then
        CURRENT=$(cat /sys/class/power_supply/BAT0/current_now)
        VOLTAGE=$(cat /sys/class/power_supply/BAT0/voltage_now)
        WATTS=$(awk "BEGIN {printf \"%.2fW\", ($CURRENT * $VOLTAGE)/1000000000000}")
    else
        WATTS="N/A"
    fi
    DBM=$(wpa_cli scan_results | grep "-" | awk '{print $3}')
    if [ -n "$DBM" ]; then
        quality=$(( (DBM + 100) *2))
        [ $quality -gt 100 ] && quality=100
        [ $quality -lt 0 ] && quality=0

        if [ "$quality" -gt 75 ]; then
            WIFI_ICON="󰤨"
        elif [ "$quality" -gt 50 ]; then
            WIFI_ICON="󰤥"
        elif [ "$quality" -gt 25 ]; then
            WIFI_ICON="󰤢"
        else WIFI_ICON="󰤟"
        fi
        WIFI="$WIFI_ICON  $(wpa_cli status | grep  -E '^ssid' | cut -d"=" -f2)"
    else
        WIFI="󰤯 Disconnected"
    fi

    LINUX="Linux:($(uname -r | cut -d"-" -f1))"
    DATE="$(date +%H:%M) | $(date +%a) | $(date +%d/%m/%y)"
    xsetroot -name " $LINUX | $WIFI | $DATE |🔋$BAT%($WATTS) "
	sleep 60
done
