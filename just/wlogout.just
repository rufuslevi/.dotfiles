[linux]
wlogout:
    @echo 'Linking wlogout config'
    mkdir -p ~/.config/wlogout
    stow -v -t ~/.config/wlogout wlogout
