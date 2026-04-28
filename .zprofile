if [ -z "$DISPLAY" ] && [ "$XDG_VTNR" = 1 ]; then
  exec startx
fi

xbindkeys -f $HOME/.xbindkeysrc
