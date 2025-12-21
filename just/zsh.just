prompt:
    @echo 'Linking zsh configs'

[unix]
zsh: prompt
    mkdir -p ~/.config/zsh
    stow -v -t ~/.config/zsh zsh

[windows]
zsh: prompt
    dploy stow ~ zsh
