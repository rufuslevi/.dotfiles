[linux]
tofi:
    @echo 'Linking tofi config'
    mkdir -p ~/.config/tofi
    stow -v -t ~/.config/tofi tofi
