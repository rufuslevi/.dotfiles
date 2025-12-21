[linux]
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
