# zmodload zsh/zprof

source ~/.config/zsh/.zshenv
source ~/.config/zsh/.zshprompt

# What OS are we running?
if [[ $(uname) == "Darwin" ]]; then
    # echo "Running MacOS!"
    if [ -e '/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh' ]; then
        . '/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh'
    fi
elif command -v apt > /dev/null; then
    # echo "Running Debian based Linux!"
    ZSH_THEME="powerlevel10k/powerlevel10k"
    plugins+=(
      git
      zsh-autosuggestions
      zsh-syntax-highlighting
      colored-man-pages
    )
elif command -v nix > /dev/null; then
    # echo "Running NixOS based Linux!"
else
    echo 'Unknown OS!'
fi

eval "$(zoxide init --cmd cd zsh)"

source ~/.config/zsh/.condarc.sh
source ~/.config/zsh/.nvmrc.sh

source ~/.config/zsh/.zprofile
source ~/.config/scripts/.easier-c.sh
