export XDG_SESSION_TYPE=x11
xrandr --output  DisplayPort-2 --mode 2560x1440 --rate 180
#feh --bg-fil mdwm/assets/rettangles.png &
~/wall.sh &
picom &
redshift -O 3600 &
~/mdwm/scripts/xsetroot.sh &

# Setta il timeout di inattività di X11 a (10 minuti)
xset s 600 600
xset dpms 600 600 600

# Avvia xss-lock in background accoppiato con il tuo locker preferito
xss-lock -- slock &

exec dbus-run-session -- dwm
