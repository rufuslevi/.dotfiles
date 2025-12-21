[linux]
gammastep:
    @echo 'Linking pulse config'
    mkdir -p ~/.pulse
    stow -v -t ~/.pulse pulse
