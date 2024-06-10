#!/bin/bash

DIR="/home/vsevolod/Downloads/wallpapers/"

if [ -d "$DIR" ]; then
     random_wallpaper=$(ls "$DIR" | shuf -n 1)  # chooses random wallpaper
     echo "File "
else
     echo "Directory $DIR does not exist."
fi

if [ -n $random_wallpaper ]; then
     xwallpaper --zoom "$DIR/$random_wallpaper"  # sets a wallpaper
     wal -i "$DIR/$random_wallpaper" -n
     bash /home/vsevolod/.config/polybar/material/scripts/pywal.sh "$DIR/$random_wallpaper"
     sudo "/home/vsevolod/generate_theme.sh"  # generates themes for chromium and telegram
     walogram -B  # creates telegram theme
     echo "Theme changed"
else
     echo "Something went wrong."
fi

