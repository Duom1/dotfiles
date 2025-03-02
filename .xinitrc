xset r rate 200 30 &
xmodmap ~/.Xmodmap &
firefox 'ext+container:name=discord&url=https://discord.com/app' &
slstatus &
xbanish &
redshift &
picom --experimental-backends &
nitrogen --restore &
xrandr --output HDMI-0 --mode 1920x1080 --rate 60.00 &
#xrandr --output DP-0 --mode 1920x1080 --rate 144.00 &
/home/user/force-rate.pl > /home/user/force-rate.log 2>&1 &
xrandr --output DP-0 --left-of HDMI-0 &
exec dwm
