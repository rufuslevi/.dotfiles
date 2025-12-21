[linux]
hyprland:
    @echo 'Linking Hyprland configs'
    mkdir -p ~/.config/hypr
    stow -v -t ~/.config/hypr hypr
