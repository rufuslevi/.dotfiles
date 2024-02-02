export ZSH="$HOME/.oh-my-zsh"

. "$HOME/.cargo/env"
export PATH=$PATH:/usr/share
export PATH=$PATH:/opt/homebrew/bin
export PATH=$PATH:~/.cargo/bin
export PATH=$PATH:/usr/local/bin
export PATH=$PATH:$HOME/Library/Python/3.11/bin
export PATH=$PATH:$HOME/Library/Python/3.11/lib/python/site-packages
export PATH=$PATH:/Users/rufuslevi/Library/Python/3.11/bin
export PATH=$PATH:/Users/rufuslevi/Library/Python/3.11/lib/python/site-packages
export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:/Users/rufuslevi/Applications/platform-tools
export PATH=$PATH:/opt/homebrew/opt/gradle@6/bin
export PATH=$PATH:/opt/homebrew/opt/ruby/bin
export PATH=$PATH:/opt/homebrew/opt/mbedtls@2/bin
export PATH=$PATH:/opt/local/bin:/opt/local/sbin
export PATH=$PATH:"/Users/rufuslevi/Library/Application Support/JetBrains/Toolbox/scripts"

# ruby flags
export LDFLAGS="-L/opt/homebrew/opt/ruby/lib"
export CPPFLAGS="-I/opt/homebrew/opt/ruby/include"
export PKG_CONFIG_PATH="/opt/homebrew/opt/ruby/lib/pkgconfig"

export GOPATH=/Users/rufuslevi/Developer/go

export MANPATH="/opt/local/share/man:$MANPATH"
export MANPAGER="sh -c 'col -bx | bat -l man -p'"

export VISUAL='nvim'

# What OS are we running?
if [[ $(uname) == "Darwin" ]]; then
    # echo "Running MacOS!"
    export JAVA_HOME=`/usr/libexec/java_home -v 1.8`

elif command -v apt > /dev/null; then
    # echo "Running Debian based Linux!"
    export PATH=$PATH:~/Applications/gradle-6.9.4/bin

else
    echo 'Unknown OS!'
fi


export DOTNET_ROOT="~/.dotnet"

# Add .NET Core SDK tools
export PATH="$PATH:/Users/rufuslevi/.dotnet/tools"

export EDITOR='nvim'
