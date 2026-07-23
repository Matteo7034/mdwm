export __GL_MaxFramesAllowed=1
export __GL_YIELD="USLEEP"
export __GL_THREADED_OPTIMIZATIONS=1

export XDG_SESSION_TYPE=x11
export DESKTOP_SESSION=dwm

#resolution
xrandr --output DP-2 --mode 2560x1440 --rate 180

#compositor
picom --daemon

#night light
redshift -O 3600

if [ -x /usr/bin/dbus-update-activation-environment ]; then
    dbus-update-activation-environment --systemd --all
fi

#Audio
pkill -f pipewire
pkill -f pipewire-pulse
pkill -f wireplumber

pipewire  > /dev/null 2>&1 &

pipewire-pulse  > /dev/null 2>&1 &
 
wireplumber  > /dev/null 2>&1 &

# sfondo
feh --bg-fill ~/dwm/wall/gentoodark.png

# Esegui la sessione D-Bus con dwm
exec dbus-run-session dwm


