# zmodload zsh/zprof

source ~/.config/zsh/.zshenv
if [ -z "$PS1" ]; then
else
    source ~/.config/zsh/.zshprompt
fi

[[ -d $PYENV_ROOT/bin ]]
eval "$(pyenv init -)"

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
source <(fzf --zsh)
autoload -Uz compinit
compinit

source ~/.config/zsh/.condarc.sh
source ~/.config/zsh/.nvmrc.sh

source ~/.config/zsh/.zprofile
for file in ~/.config/scripts/global/*; do
    source "$file"
done
