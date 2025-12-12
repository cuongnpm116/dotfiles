if [[ -z $DISPLAY && $(tty) == /dev/tty1 ]]; then
    if command -v Hyprland >/dev/null; then
        uwsm check may-start && exec uwsm start hyprland.desktop
    else
        echo "Hyprland not installed. Falling back to zsh."
        exec zsh
    fi
fi

