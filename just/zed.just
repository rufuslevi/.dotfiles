[unix]
zed:
    @echo 'Linking sketchybar configs'
    mkdir -p ~/.config/zed
    stow -v -t ~/.config/zed zed
