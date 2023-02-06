# Activate the aliases
source ~/.config/fish/aliases.fish

# Source local settings (if exists™)
if test -e ~/.config/fish/local.fish
    source ~/.config/fish/local.fish
end

# Use a newer version of coreutils (includes cat, cp, chmod, ls, mv and so on)
# Requires: brew install coreutils
set -gx PATH $HOME/bin $PATH
set -gx PATH /usr/local/opt/coreutils/libexec/gnubin $PATH
set -g fish_user_paths "/usr/local/opt/curl/bin" $fish_user_paths

# Prefer US English and use UTF-8 encoding
set -gx LANG en_US
set -gx LC_ALL en_US.UTF-8

# Start virtualfish (to automatically activate python virtualenvs)
# eval (python -m virtualfish auto_activation)

# Color highlighting inside manpages (and elsewhere)
set -gx LESS_TERMCAP_mb \e'[01;31m'       # begin blinking
set -gx LESS_TERMCAP_md \e'[01;38;5;74m'  # begin bold
set -gx LESS_TERMCAP_me \e'[0m'           # end mode
set -gx LESS_TERMCAP_se \e'[0m'           # end standout-mode
set -gx LESS_TERMCAP_so \e'[38;5;246m'    # begin standout-mode - info box
set -gx LESS_TERMCAP_ue \e'[0m'           # end underline
set -gx LESS_TERMCAP_us \e'[04;38;5;146m' # begin underline


# Ruby stuff
set -g fish_user_paths "/usr/local/opt/ruby/bin" $fish_user_paths

# Rust stuff
set -g fish_user_paths "/Users/jorunfa/.cargo/bin" $fish_user_paths

# Volta
set -gx VOLTA_HOME "$HOME/.volta"
set -gx PATH "$VOLTA_HOME/bin" $PATH

# pnpm
set -gx PNPM_HOME "/Users/jorunfa/Library/pnpm"
set -gx PATH "$PNPM_HOME" $PATH
