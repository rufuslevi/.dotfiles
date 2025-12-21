[macos]
borders:
    @echo 'Linking borders config'
    mkdir -p ~/.config/borders
    stow -v -t ~/.config/borders borders
