if uwsm check may-start; then
    exec uwsm start hyprland.desktop
fi

export XMODIFIERS=@im=fcitx
export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx
