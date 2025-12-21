[linux]
gammastep:
    @echo 'Linking gammastep config'
    mkdir -p ~/.config/gammastep
    stow -v -t ~/.config/gammastep gammastep
