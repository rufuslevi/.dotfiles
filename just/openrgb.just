[unix]
openrgb:
    @echo 'Linking openrgb config'
    mkdir -p ~/.config/OpenRGB
    stow -v -t ~/.config/OpenRGB openrgb
