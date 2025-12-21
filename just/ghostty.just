[unix]
ghostty:
    @echo 'Linking ghostty configs'
    mkdir -p ~/.config/ghostty
    stow -v -t ~/.config/ghostty ghostty
