[macos]
yabai_setup:
    @echo 'Linking yabai config'
    mkdir -p ~/.config/yabai
    stow -v -t ~/.config/yabai yabai

[macos]
yabai_upgrade:
    @echo 'Upgrading yabai'
    sudo yabai --stop-service
    sudo yabai --uninstall-service
    brew upgrade yabai
    /bin/bash ../yabai/update-sudoers.sh
    sudo yabai --start-service
