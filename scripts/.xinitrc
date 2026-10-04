
xrandr --output  DisplayPort-2 --mode 2560x1440 --rate 180
feh --bg-fil mdwm/assets/rettangles.png &

redshift -O 3600 
~/mdwm/scripts/xsetroot.sh &
exec dbus-run-session -- dwm
