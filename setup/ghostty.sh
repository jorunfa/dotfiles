#!/bin/bash

# SCRIPT_DIR == Same folder as the script is placed in
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
source "${SCRIPT_DIR}/../settings.sh"
source "${SCRIPT_DIR}/utils.sh"

CONFIG_SOURCE="${SCRIPT_DIR}/../dotfiles/ghostty/config.ghostty"
CONFIG_DESTINATION="$HOME/Library/Application Support/com.mitchellh.ghostty/config"

install_ghostty() {
    print_info "Installing Ghostty"
    brew install --cask ghostty
    print_result $? "Install Ghostty\n"
}

# Ghostty reads both this path and ~/.config/ghostty/config, so only symlink the
# one it prefers. Having both makes it load the same config twice
create_symlink() {
    print_info "Creating symlink to the Ghostty config"

    absolute_source_path="$( cd "$( dirname "$CONFIG_SOURCE" )" && pwd )/config.ghostty"
    mkdir -p "$( dirname "$CONFIG_DESTINATION" )"

    if [ -e "$CONFIG_DESTINATION" ]; then
        print_info "Existing config detected! Moving it to ~/dotfiles_old"
        mkdir -p ~/dotfiles_old
        mv -f "$CONFIG_DESTINATION" ~/dotfiles_old/ghostty_config
    fi

    ln -s "$absolute_source_path" "$CONFIG_DESTINATION"
    print_result $? "$(tildify "$CONFIG_DESTINATION") → $(tildify "$absolute_source_path")"
    printf "\n"
}

print_heading "Ghostty"
printf "Ghostty is a fast, native terminal emulator. This setup will...\n"
printf "  * Install Ghostty\n"
printf "  * Symlink the Ghostty config\n\n"

if ask_question "Do you want to install Ghostty?"; then
    install_ghostty
    create_symlink
    print_in_yellow "Cmd+, opens the config with 'open -t', which always uses the default plain text editor.\n"
    print_in_yellow "To edit it in something other than TextEdit, set that default: Get Info on any .txt file → Open with → Change All\n"
else
    print_error "Fine. It's your choice... ಠ_ಠ"
fi
