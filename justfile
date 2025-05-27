cargo:
    @echo 'Running cargo for the system...'
    cargo install krabby
    cargo install taplo-cli
    cargo install just

helix:
    @echo 'Linking helix configs'
    mkdir -p ~/.config/helix
    stow -v -t ~/.config/helix helix



