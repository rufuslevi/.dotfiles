[unix]
btop:
    @echo 'Linking btop config'
    mkdir -p ~/.config/btop
    stow -v -t ~/.config/btop btop
