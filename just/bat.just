[unix]
bat:
    @echo 'Linking bat config'
    mkdir -p ~/.config/bat
    stow -v -t ~/.config/bat bat
