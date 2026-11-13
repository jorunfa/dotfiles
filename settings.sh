# GIT
# Used for both git and jj. Leave empty to be asked during the install.
# Saved to ~/.gitconfig.local and ~/.config/jj/conf.d/local.toml (not tracked by the dotfiles)
GIT_NAME=""
GIT_EMAIL=""

# APPLICATIONS
# The applications below are regular apps such as Chrome.
# Please make sure that you remove all the programs you don't want to install on your computer
# P.S. The installer script won't install the applications unless you tell it to. It's your call  :)
BREW_CASKS="google-chrome keybase rectangle visual-studio-code alfred sublime-text vlc discord google-drive obs docker intellij-idea slack aws-vault spotify firefox steam keepassxc steelseries-exactmouse-tool logitech-g-hub"

# BREW_CASKS_OLD="abstract chromedriver google-chrome keybase sizeup streamlink-twitch-gui visual-studio-code alfred homebrew/cask-versions/google-chrome-canary logitech-gaming-software sketch sublime-text vlc android-studio discord google-drive-file-stream skyfonts supertuxkart zulu android-studio-preview disk-inventory-x hyper obs skype tor-browser zulu8 docker intellij-idea slack aws-vault osu spotify ubiquiti-unifi-controller balsamiq-mockups firefox postman steam videostream brave-browser-dev google-backup-and-sync keepassx steelseries-exactmouse-tool virtualbox"

# NODE
# NPM_PACKAGES="n ncu"

# BREW (OPTIONAL)
OPTIONAL_BREW_PACKAGES="wget gpg curl rsync ack awscli git lolcat nyancat"
# OPTIONAL_BREW_PACKAGES="python3 wget gpg curl ncdu rsync ack yarn awscli git lolcat nyancat streamlink ruby"

# --------------------------------------------------------------
# DANGER ZONE! EDIT THE FOLLOWING SETTINGS WITH CARE
# Removing some of them might break the setup :/
# --------------------------------------------------------------

# BREW (ESSENTIAL)
# config.fish expects mise, starship and fzf to be installed
ESSENTIAL_BREW_PACKAGES="coreutils diff-so-fancy fish mise starship fzf node python pyenv vim bat ripgrep fd lsd sd gh jj dust duf dnsmasq"

# FISH (installed with fisher)
FISHERMAN_PACKAGES="jethrokuan/z evanlucas/fish-kubectl-completions"

# BASH (installed with brew)
BASH_BREW_PACKAGES="bash bash-completion z"
