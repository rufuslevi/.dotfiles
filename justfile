cargo:
    @echo 'Running cargo for the system...'
    cargo install just
    cargo install krabby
    cargo install oxipng
    cargo install taplo-cli

helix:
    @echo 'Linking helix configs'
    mkdir -p ~/.config/helix
    stow -v -t ~/.config/helix helix



