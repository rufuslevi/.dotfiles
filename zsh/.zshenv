export ZSH="$HOME/.oh-my-zsh"

if [ -f ~/.cargo/env ]; then
    . "$HOME/.cargo/env"
fi

export PYENV_ROOT=$HOME/.pyenv

export PATH=$PYENV_ROOT/bin:$PATH
export PATH=/usr/share:$PATH
export PATH=/usr/local/bin:$PATH
export PATH=/opt/local/bin:$PATH
export PATH=/opt/local/sbin:$PATH
export PATH=$HOME/.local/bin:$PATH
export PATH=$HOME/.cargo/bin:$PATH
export PATH=$HOME/Applications/bin:$PATH

export GOPATH=$HOME/.go
export GOBIN=$HOME/.go/bin

export MANPATH="/opt/local/share/man:$MANPATH"
export MANPAGER="sh -c 'col -bx | bat -l man -p'"
export MANROFFOPT="-c"

export LIBTOOL=glibtool
export LIBTOOLIZE=glibtoolize make

export VISUAL='nvim'

# What OS are we running?
if [[ $(uname) == "Darwin" ]]; then
    # echo "Running MacOS!"

    eval "$(/opt/homebrew/bin/brew shellenv)"
    export PATH=/opt/homebrew/bin:$PATH
    export PATH=/opt/homebrew/sbin:$PATH
    export PATH=/run/current-system/sw/bin:$PATH

    export JAVA_HOME=`/usr/libexec/java_home -v 18`
    export LUA_PATH='/opt/homebrew/Cellar/luarocks/3.9.2/share/lua/5.4/?.lua;/opt/homebrew/share/lua/5.4/?.lua;/opt/homebrew/share/lua/5.4/?/init.lua;/opt/homebrew/lib/lua/5.4/?.lua;/opt/homebrew/lib/lua/5.4/?/init.lua;./?.lua;./?/init.lua;/Users/rufuslevi/.luarocks/share/lua/5.4/?.lua;/Users/rufuslevi/.luarocks/share/lua/5.4/?/init.lua'
    export LUA_CPATH='/opt/homebrew/lib/lua/5.4/?.so;/opt/homebrew/lib/lua/5.4/loadall.so;./?.so;/Users/rufuslevi/.luarocks/lib/lua/5.4/?.so'

    export PATH=$PATH:"/Users/rufuslevi/Applications/platform-tools"
    export PATH=$PATH:"/Users/rufuslevi/Applications/grpc/bin"
    export PATH=$PATH:"$HOME/Library/Python/3.11/bin"
    export PATH=$PATH:"$HOME/Library/Python/3.11/lib/python/site-packages"
    export PATH=$PATH:"/Users/rufuslevi/Library/Application Support/JetBrains/Toolbox/scripts"
    export PATH=$PATH:"/Users/rufuslevi/.luarocks/share/lua/5.4"
    export PATH=$PATH:"/opt/homebrew/share/lua/5.4/luarocks"

elif command -v apt > /dev/null; then
    # echo "Running Debian based Linux!"
    export PATH=$PATH:~/Applications/gradle-6.9.4/bin

elif command -v nix > /dev/null; then
    # echo "Running NixOS based Linux!"

else
    # echo "Running Windows!"
fi

export DOTNET_ROOT="~/.dotnet"

# Add .NET Core SDK tools
export PATH="$PATH:/Users/rufuslevi/.dotnet/tools"

export EDITOR='nvim'
setopt no_global_rcs
