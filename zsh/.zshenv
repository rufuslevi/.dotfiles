export ZSH="$HOME/.oh-my-zsh"

. "$HOME/.cargo/env"
export PATH=$PATH:/usr/share
export PATH=$PATH:/usr/local/bin
export PATH=$PATH:/opt/homebrew/bin
export PATH=$PATH:~/.cargo/bin
export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:/opt/local/bin:/opt/local/sbin

# ruby flags
export LDFLAGS="-L/opt/homebrew/opt/ruby/lib"
export CPPFLAGS="-I/opt/homebrew/opt/ruby/include"
export PKG_CONFIG_PATH="/opt/homebrew/opt/ruby/lib/pkgconfig"

export GOPATH=/Users/rufuslevi/Developer/go

export MANPATH="/opt/local/share/man:$MANPATH"
export MANPAGER="sh -c 'col -bx | bat -l man -p'"

export LIBTOOL=glibtool
export LIBTOOLIZE=glibtoolize make

export VISUAL='nvim'

# What OS are we running?
if [[ $(uname) == "Darwin" ]]; then
    # echo "Running MacOS!"

    export JAVA_HOME=`/usr/libexec/java_home -v 18`
    # export C_INCLUDE_PATH="/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include"
    export CPLUS_INCLUDE_PATH="/opt/homebrew/include/c++/13"
    # export CPLUS_INCLUDE_PATH="/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include"
    export LUA_PATH='/opt/homebrew/Cellar/luarocks/3.9.2/share/lua/5.4/?.lua;/opt/homebrew/share/lua/5.4/?.lua;/opt/homebrew/share/lua/5.4/?/init.lua;/opt/homebrew/lib/lua/5.4/?.lua;/opt/homebrew/lib/lua/5.4/?/init.lua;./?.lua;./?/init.lua;/Users/rufuslevi/.luarocks/share/lua/5.4/?.lua;/Users/rufuslevi/.luarocks/share/lua/5.4/?/init.lua'
    export LUA_CPATH='/opt/homebrew/lib/lua/5.4/?.so;/opt/homebrew/lib/lua/5.4/loadall.so;./?.so;/Users/rufuslevi/.luarocks/lib/lua/5.4/?.so'

    export PATH=$PATH:"/Users/rufuslevi/Applications/platform-tools"
    export PATH=$PATH:"/Users/rufuslevi/Applications/grpc/bin"
    export PATH=$PATH:"$HOME/Library/Python/3.11/bin"
    export PATH=$PATH:"$HOME/Library/Python/3.11/lib/python/site-packages"
    export PATH=$PATH:"/opt/homebrew/opt/gradle@6/bin"
    export PATH=$PATH:"/opt/homebrew/opt/ruby/bin"
    export PATH=$PATH:"/opt/homebrew/opt/mbedtls@2/bin"
    export PATH=$PATH:"/opt/homebrew/opt/llvm/bin"
    export PATH=$PATH:"/Users/rufuslevi/Library/Application Support/JetBrains/Toolbox/scripts"
    export PATH=$PATH:"/Users/rufuslevi/.luarocks/share/lua/5.4"
    export PATH=$PATH:"/opt/homebrew/share/lua/5.4/luarocks"

elif command -v apt > /dev/null; then
    # echo "Running Debian based Linux!"
    export PATH=$PATH:~/Applications/gradle-6.9.4/bin

else
    # echo "Running Windows!"
fi


export DOTNET_ROOT="~/.dotnet"

# Add .NET Core SDK tools
export PATH="$PATH:/Users/rufuslevi/.dotnet/tools"

export EDITOR='nvim'
