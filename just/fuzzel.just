[linux]
fuzzel:
    @echo 'Linking fuzzel configs'
    mkdir -p ~/.config/fuzzel
    stow -v -t ~/.config/fuzzel fuzzel
