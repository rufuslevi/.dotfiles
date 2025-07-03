alias lg='lazygit'
alias code='codium'
alias pokemon='lua $HOME/Developer/pokemon-catcher/src/init.lua'
alias ls='eza --icons=always --hyperlink --no-quotes --color=always -1 --group-directories-first'
alias lsa='ls -a'
alias y='yazi'
alias vibe_check='git status'
alias big_yikes="git clean -dx $@"
alias slay="git add $@"
alias rizz="git commit -m $@"
alias yeet="git push $@"
alias yoink="git pull"
alias cat="bat"
alias nixgodot="LD_LIBRARY_PATH=$NIX_LD_LIBRARY_PATH godot"

if [[ $(uname) == "Darwin" ]]; then
    alias gdnvim="nvim --listen ~/.tmp/godot.pipe"
elif command -v nix > /dev/null; then
    alias gdnvim="uwsm app -- nvim --listen ~/.tmp/godot.pipe"
fi

HISTSIZE=1000
SAVEHIST=1000
