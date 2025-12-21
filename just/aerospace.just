[macos]
aerospace:
    @echo 'Linking aerospace config'
    mkdir -p ~/.config/aerospace
    stow -v -t ~/.config/aerospace aerospace
