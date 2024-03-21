# zmodload zsh/zprof

# pokemon-colorscripts -r -s --no-title
lua ~/Developer/pokemon-catcher/src/init.lua 1

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

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

# update automatically without asking
zstyle ':omz:update' mode auto

ENABLE_CORRECTION="true"

export NVM_LAZY_LOAD=true
export NVM_COMPLETION=true

source $ZSH/oh-my-zsh.sh

autoload -Uz vcs_info # enable vcs_info

autoload -Uz compinit
for dump in ~/.zcompdump(N.mh+24); do
  compinit
done
compinit -C

# always load before displaying the prompt
precmd () { vcs_info } 
precmd_functions+=( precmd_vcs_info )
setopt prompt_subst

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/rufuslevi/Applications/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/rufuslevi/Applications/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/Users/rufuslevi/Applications/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/rufuslevi/Applications/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

# Defer initialization of nvm until nvm, node or a node-dependent command is
# run. Ensure this block is only run once if .bashrc gets sourced multiple times
# by checking whether __init_nvm is a function.
if [ -s "$HOME/.nvm/nvm.sh" ] && [ ! "$(whence -w __init_nvm)" = function ]; then
  export NVM_DIR="$HOME/.nvm"
  [ -s "$NVM_DIR/bash_completion" ] && . "$NVM_DIR/bash_completion"
  declare -a __node_commands=('nvm' 'node' 'npm' 'yarn' 'gulp' 'grunt' 'webpack')
  function __init_nvm() {
    for i in "${__node_commands[@]}"; do unalias $i; done
    . "$NVM_DIR"/nvm.sh
    unset __node_commands
    unset -f __init_nvm
  }
  for i in "${__node_commands[@]}"; do alias $i='__init_nvm && '$i; done
fi

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

eval "$(zoxide init --cmd cd zsh)"

# What OS are we running?
if [[ $(uname) == "Darwin" ]]; then
    # echo "Running MacOS!"
    source "/Users/rufuslevi/.easier-c.sh"
    source "/Users/rufuslevi/.bazel/bin/bazel-complete.bash"

elif command -v apt > /dev/null; then
    # echo "Running Debian based Linux!"
    source "/home/rufuslevi/.easier-c.sh"

elif command -v nix > /dev/null; then
    # echo "Running NixOS based Linux!"
    source "/home/rufuslevi/.easier-c.sh"

else
    echo 'Unknown OS!'
fi

if [ -f ~/.zprofile ]; then
  source ~/.zprofile
fi
