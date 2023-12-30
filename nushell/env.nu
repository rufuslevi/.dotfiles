# Nushell Environment Config File
#
# version = "0.87.1"

def create_right_prompt [] {
    let time_segment = ([
        (ansi reset)
        (ansi magenta)
        (date now | format date '%X')
    ] | str join | str replace --regex --all "([/:])" $"(ansi green)${1}(ansi magenta)" |
        str replace --regex --all "([AP]M)" $"(ansi magenta_underline)${1}")

    let last_exit_code = if ($env.LAST_EXIT_CODE != 0) {([
        (ansi rb)
        ($env.LAST_EXIT_CODE)
    ] | str join)
    } else { "" }

    ([$last_exit_code, (char space), $time_segment] | str join)
}

# PROMPT
$env.STARSHIP_SHELL = "nu"

def create_left_prompt [] {
    starship prompt --cmd-duration $env.CMD_DURATION_MS $'--status=($env.LAST_EXIT_CODE)'
}

# Use nushell functions to define your right and left prompt
$env.PROMPT_COMMAND = { || create_left_prompt }
$env.PROMPT_COMMAND_RIGHT = {|| create_right_prompt }

# The prompt indicators are environmental variables that represent
# the state of the prompt
$env.PROMPT_INDICATOR = ""
$env.PROMPT_INDICATOR_VI_INSERT = ": "
$env.PROMPT_INDICATOR_VI_NORMAL = "〉"
$env.PROMPT_MULTILINE_INDICATOR = "::: "

# $env.TRANSIENT_PROMPT_COMMAND = {|| "🚀 " }
# $env.TRANSIENT_PROMPT_INDICATOR = {|| "" }
# $env.TRANSIENT_PROMPT_INDICATOR_VI_INSERT = {|| "" }
# $env.TRANSIENT_PROMPT_INDICATOR_VI_NORMAL = {|| "" }
# $env.TRANSIENT_PROMPT_MULTILINE_INDICATOR = {|| "" }
# $env.TRANSIENT_PROMPT_COMMAND_RIGHT = {|| "" }

# Specifies how environment variables are:
# - converted from a string to a value on Nushell startup (from_string)
# - converted from a value back to a string when running external commands (to_string)
# Note: The conversions happen *after* config.nu is loaded
$env.ENV_CONVERSIONS = {
    "PATH": {
        from_string: { |s| $s | split row (char esep) | path expand --no-symlink }
        to_string: { |v| $v | path expand --no-symlink | str join (char esep) }
    }
    "Path": {
        from_string: { |s| $s | split row (char esep) | path expand --no-symlink }
        to_string: { |v| $v | path expand --no-symlink | str join (char esep) }
    }
}

# Directories to search for scripts when calling source or use
$env.NU_LIB_DIRS = [
    # FIXME: This default is not implemented in rust code as of 2023-09-06.
    ($nu.default-config-dir | path join 'scripts') # add <nushell-config-dir>/scripts
]

# Directories to search for plugin binaries when calling register
$env.NU_PLUGIN_DIRS = [
    # FIXME: This default is not implemented in rust code as of 2023-09-06.
    ($nu.default-config-dir | path join 'plugins') # add <nushell-config-dir>/plugins
]

# PATH
if (sys).host.name == "Windows" {
    $env.Path = ($env.Path | split row (char esep) | prepend '/opt/homebrew/bin')
    $env.Path = ($env.Path | split row (char esep) | prepend '~/.cargo/bin')
    $env.Path = ($env.Path | split row (char esep) | prepend '/usr/local/bin')
    $env.Path = ($env.Path | split row (char esep) | prepend '~/Library/Python/3.11/bin')
    $env.Path = ($env.Path | split row (char esep) | prepend '~/Library/Python/3.11/lib/python/site-packages')
    $env.Path = ($env.Path | split row (char esep) | prepend '/opt/homebrew/opt/mbedtls@2/bin')
} else {
    $env.PATH = ($env.PATH | split row (char esep) | prepend '/opt/homebrew/bin')
    $env.PATH = ($env.PATH | split row (char esep) | prepend '~/.cargo/bin')
    $env.PATH = ($env.PATH | split row (char esep) | prepend '/usr/local/bin')
    $env.PATH = ($env.PATH | split row (char esep) | prepend '~/Library/Python/3.11/bin')
    $env.PATH = ($env.PATH | split row (char esep) | prepend '~/Library/Python/3.11/lib/python/site-packages')
    $env.PATH = ($env.PATH | split row (char esep) | prepend '/opt/homebrew/opt/mbedtls@2/bin')
    $env.PATH = ($env.PATH | split row (char esep) | prepend '/opt/homebrew/bin')
    $env.PATH = ($env.PATH | split row (char esep) | prepend '/usr/share')
}

# GOPATH
$env.GOPATH = '~/Developer/go'
