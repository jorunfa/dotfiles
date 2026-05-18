# Activate the aliases
source ~/.config/fish/aliases.fish

# Source local settings (if exists™)
if test -e ~/.config/fish/local.fish
    source ~/.config/fish/local.fish
end

# Use a newer version of coreutils (includes cat, cp, chmod, ls, mv and so on)
# Requires: brew install coreutils
fish_add_path -gP $HOME/bin
fish_add_path -gP /opt/homebrew/opt/coreutils/libexec/gnubin
fish_add_path -gP /opt/homebrew/opt/curl/bin

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
fish_add_path -gP /opt/homebrew/opt/ruby/bin

# Rust stuff
fish_add_path -gP $HOME/.cargo/bin

# pnpm
set -gx PNPM_HOME "$HOME/Library/pnpm"
fish_add_path -gP $PNPM_HOME

# brew
eval "$(/opt/homebrew/bin/brew shellenv)"

# idea
fish_add_path -gP '/Applications/IntelliJ IDEA.app/Contents/MacOS'

# bun
set -gx BUN_INSTALL "$HOME/.bun"
fish_add_path -gP $BUN_INSTALL/bin

# go install path
set -gx GOPATH "$HOME/go"
fish_add_path -gP $GOPATH/bin

# Created by `pipx` on 2025-02-18 19:40:30
fish_add_path -gPa $HOME/.local/bin

# mise (must run last so its tool paths win over brew/bun/etc.).
# The Homebrew mise package's vendor conf.d snippet that would auto-activate
# mise too early is suppressed via dotfiles/fish/conf.d/mise-activate.fish.
mise activate fish | source
set -gx CATALINA_HOME (mise where tomcat 2>/dev/null)/(ls (mise where tomcat 2>/dev/null) 2>/dev/null)[1]
source (/opt/homebrew/bin/starship init fish --print-full-init | psub)

# fzf
fzf --fish | source
