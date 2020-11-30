exec compton &
exec feh --bg-scale /home/nvn/Pictures/wallpaper/simple-saitama-wallpaper-i-just-made-for-personal-use.-2560×1440.jpg &
# exec feh --bg-scale /home/nvn/Pictures/wallpaper/TmbCjky.jpg &
# exec dwmblocks &
exec dunst &

# if dwm exits 0, restart -- this allows hot reloading of config.h
while type dwm >/dev/null ; do dwm && continue || break ; done

