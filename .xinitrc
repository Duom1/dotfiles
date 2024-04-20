xset r rate 200 30 &
xmodmap ~/.Xmodmap &
xrandr --output HDMI-0 --mode 1920x1080 --rate 60.00 &
xrandr --output DP-0 --mode 1920x1080 --rate 144.00 &
xrandr --output DP-0 --left-of HDMI-0 &
firefox 'ext+container:name=discord&url=https://discord.com/app' &
slstatus &
xbanish &
redshift &
picom &
nitrogen --restore &
exec dwm
