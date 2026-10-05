
xrandr --output  DisplayPort-2 --mode 2560x1440 --rate 180
feh --bg-fil mdwm/assets/rettangles.png &
picom &
redshift -O 3600 &
~/mdwm/scripts/xsetroot.sh &

# Setta il timeout di inattività di X11 a 300 secondi (5 minuti)
xset s 300 300
xset dpms 300 300 300

# Avvia xss-lock in background accoppiato con il tuo locker preferito
xss-lock -- slock &

exec dbus-run-session -- dwm
