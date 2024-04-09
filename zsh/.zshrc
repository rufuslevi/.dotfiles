# zmodload zsh/zprof

source ~/.config/zsh/.zshenv

# pokemon-colorscripts -r -s --no-title
lua ~/Developer/pokemon-catcher/src/init.lua 1

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

ENABLE_CORRECTION="true"

zstyle ':omz:update' mode auto
autoload -Uz vcs_info 
autoload -Uz compinit
for dump in ~/.zcompdump(N.mh+24); do
  compinit
done
compinit -C

# always load before displaying the prompt
precmd () { vcs_info } 
precmd_functions+=( precmd_vcs_info )
setopt prompt_subst

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
source ~/.config/zsh/.p10k.zsh
source ~/.config/scripts/.easier-c.sh
