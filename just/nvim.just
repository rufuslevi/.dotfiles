[unix]
nvim: prompt
    mkdir -p ~/.config/nvim
    stow -v -t ~/.config/nvim nvim

[windows]
nvim: prompt
    mkdir -p ~/AppData/Local/nvim
    dploy stow nvim ~/AppData/Local/nvim
