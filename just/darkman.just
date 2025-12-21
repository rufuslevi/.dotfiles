[linux]
darkman:
    @echo 'Linking darkman configs'
    mkdir -p ~/.config/darkman
    stow -v -t ~/.config/darkman darkman
