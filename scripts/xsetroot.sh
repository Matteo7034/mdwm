
while true; do
    BAT=`cat /sys/class/power_supply/BAT0/capacity`
    xsetroot -name " $(date +%H:%M) | $(date +%d/%m/%y) | 🔋 $BAT"
	sleep 60
done
