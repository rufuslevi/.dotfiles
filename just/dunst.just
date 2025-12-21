[linux]
dunst:
    @echo 'Linking dunst configs'
    mkdir -p ~/.config/dunst
    stow -v -t ~/.config/dunst dunst
