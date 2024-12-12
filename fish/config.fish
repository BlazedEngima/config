# Env var
set -gx EDITOR nvim
set -gx XDG_CONFIG_HOME "$HOME/.config"
set -gx GPG_TTY (tty)
set -gx STARSHIP_CONFIG "$HOME/.config/starship/starship.toml"
set -gx QHOME "$HOME/q/"
set -gx VCPKG_ROOT "$HOME/.local/bin/vcpkg"

switch $(uname)
    case "Linux"
        set -x OSTYPE 'Linux'
    case "Darwin"
	set -x OSTYPE 'macOS'
    case '*BSD' 'DragonFly'
	set -x OSTYPE 'BSD'
    case '*'
	set -x OSTYPE 'UNKNOWN'
end

function fish_user_key_bindings

    # Standard terminal commands in insert mode
    fish_default_key_bindings -M insert

    # Enable vi mode
    fish_vi_key_bindings --no-erase default
end

function fish_greeting
  fortune
end

function starship_transient_rprompt_func
    starship module time
end

if status is-interactive
    # Commands to run in interactive sessions can go here

    set -l func_dir $XDG_CONFIG_HOME/fish/alias.fish
    [ -f $func_dir ] && source $func_dir || echo -e (set_color -o red) "[ERR] $func_dir does not exist!"

    set fish_cursor_default block
    set fish_cursor_insert line
    set fish_cursor_replace_one underscore
    set fish_cursor_replace underscore
    set fish_vi_force_cursor

    zoxide init --cmd cd fish | source
    starship init fish | source
    enable_transience
end
