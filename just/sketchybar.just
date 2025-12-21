[macos]
sketchybar:
    @echo 'Linking sketchybar configs'
    mkdir -p ~/.config/sketchybar
    mkdir -p ~/.config/dynamic-island-sketchybar
    stow -v -t ~/.config/sketchybar sketchybar
    ln -s -f ~/.dotfiles/sketchybar/dynamic-island-sketchybar/mbp2021_14.sh ~/.config/dynamic-island-sketchybar/userconfig.sh
