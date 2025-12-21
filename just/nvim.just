[unix]
nvim:
    @echo 'Linking nvim configs'
    mkdir -p ~/.config/nvim
    stow -v -t ~/.config/nvim nvim

[windows]
nvim:
    @echo 'Linking nvim configs'
    mkdir -p ~/AppData/Local/nvim
    dploy stow nvim ~/AppData/Local/nvim
