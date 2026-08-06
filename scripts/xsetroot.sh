
while true; do
    BAT=`cat /sys/class/power_supply/BAT0/capacity`
    if [ -f /sys/class/power_supply/BAT0/current_now ] && [ -f /sys/class/power_supply/BAT0/voltage_now ]; then
        CURRENT=$(cat /sys/class/power_supply/BAT0/current_now)
        VOLTAGE=$(cat /sys/class/power_supply/BAT0/voltage_now)
        WATTS=$(awk "BEGIN {printf \"%.2fW\", ($CURRENT * $VOLTAGE)/1000000000000}")
    else
        WATTS="N/A"
    fi


    xsetroot -name " Linux:($(uname -r | cut -d"-" -f1)) | $(date +%H:%M) | $(date +%a) | $(date +%d/%m/%y) | 🔋 $BAT% ($WATTS) "
	sleep 60
done
