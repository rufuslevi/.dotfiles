cargo:
    @echo 'Running cargo for the system...'
    cargo install just
    cargo install krabby
    cargo install oxipng
    cargo install taplo-cli

gtk:
    @echo 'Linking all gtk dependencies'
    mkdir -p ~/.config/gtk-4.0
    mkdir -p ~/.config/assets
    mkdir -p ~/.themes
    mkdir -p ~/.icons
    # Configs reserved for the Dracula theme
    mkdir -p ~/.themes/Dracula
    mkdir -p ~/.icons/Dracula
    cd gtk/icons; \
    stow -v -t ~/.icons/Dracula Dracula; \
    cd ../themes; \
    stow -v -t ~/.themes/Dracula Dracula; \
    cd Dracula; \
    stow -v -t ~/.config/assets assets
    ln -s -f ~/.dotfiles/gtk/themes/Dracula/gtk-4.0/gtk.css ~/.config/gtk-4.0/gtk.css
    ln -s -f ~/.dotfiles/gtk/themes/Dracula/gtk-4.0/gtk-dark.css ~/.config/gtk-4.0/gtk-dark.css

helix:
    @echo 'Linking helix configs'
    mkdir -p ~/.config/helix
    stow -v -t ~/.config/helix helix

hyprland:
    @echo 'Linking Hyprland configs'
    mkdir -p ~/.config/hypr
    stow -v -t ~/.config/hypr hypr

quickshell:
    @echo 'Linking quickshell configs'
    mkdir -p ~/.config/quickshell
    stow -v -t ~/.config/quickshell quickshell

scripts:
    mkdir -p ~/.config/scripts
    stow -v -t ~/.config/scripts scripts

sketchybar:
    @echo 'Linking sketchybar configs'
    mkdir -p ~/.config/sketchybar
    mkdir -p ~/.config/dynamic-island-sketchybar
    stow -v -t ~/.config/sketchybar sketchybar
    ln -s -f ~/.dotfiles/sketchybar/dynamic-island-sketchybar/mbp2021_14.sh ~/.config/dynamic-island-sketchybar/userconfig.sh

zed:
    @echo 'Linking sketchybar configs'
    mkdir -p ~/.config/zed
    stow -v -t ~/.config/zed zed
