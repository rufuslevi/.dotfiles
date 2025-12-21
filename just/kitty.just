[unix]
kitty:
    @echo 'Linking kitty config'
    mkdir -p ~/.config/kitty
    stow -v -t ~/.config/kitty kitty
