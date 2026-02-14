
[linux]
niri:
    @echo 'Linking niri configs'
    mkdir -p ~/.config/niri
    stow -v -t ~/.config/niri niri
