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
    # Configs reserved for the Dracula theme
    mkdir -p ~/.themes/Dracula
    cd gtk; \
    stow -v -t ~/.themes/Dracula Dracula; \
    cd Dracula; \
    stow -v -t ~/.config/assets assets
    ln -s gtk/Dracula/gtk-4.0/gtk.css ~/.config/gtk-4.0/gtk.css 
    ln -s gtk/Dracula/gtk-4.0/gtk-dark.css ~/.config/gtk-4.0/gtk-dark.css 

helix:
    @echo 'Linking helix configs'
    mkdir -p ~/.config/helix
    stow -v -t ~/.config/helix helix

quickshell:
    @echo 'Linking quickshell configs'
    mkdir -p ~/.config/quickshell
    stow -v -t ~/.config/quickshell quickshell
    



