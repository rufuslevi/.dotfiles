import 'just/aerospace.just'
import 'just/bat.just'
import 'just/borders.just'
import 'just/btop.just'
import 'just/darkman.just'
import 'just/dunst.just'
import 'just/fuzzel.just'
import 'just/gammastep.just'
import 'just/ghostty.just'
import 'just/gtk.just'
import 'just/hyprland.just'
import 'just/kitty.just'
import 'just/nvim.just'
import 'just/openrgb.just'
import 'just/pulse.just'
import 'just/quickshell.just'
import 'just/sketchybar.just'
import 'just/tofi.just'
import 'just/wlogout.just'
import 'just/yabai.just'
import 'just/yazi.just'
import 'just/zed.just'
import 'just/zsh.just'

cargo:
    @echo 'Running cargo for the system...'
    cargo install just
    cargo install krabby
    cargo install oxipng
    cargo install taplo-cli

[unix]
scripts:
    mkdir -p ~/.config/scripts
    stow -v -t ~/.config/scripts scripts
