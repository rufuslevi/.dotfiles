[linux]
quickshell:
    @echo 'Linking quickshell configs'
    mkdir -p ~/.config/quickshell
    stow -v -t ~/.config/quickshell quickshell
