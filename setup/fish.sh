#!/bin/bash

# SCRIPT_DIR == Same folder as the script is placed in
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
source "${SCRIPT_DIR}/../settings.sh"
source "${SCRIPT_DIR}/utils.sh"

create_symlinks() {
    print_info "Creating symlinks to the dotfiles"
    ${SCRIPT_DIR}/symlink_dotfiles.sh "../dotfiles/fish/config/" ~/.config/fish/ false
    ${SCRIPT_DIR}/symlink_dotfiles.sh "../dotfiles/fish/functions/" ~/.config/fish/functions/ false
    ${SCRIPT_DIR}/symlink_dotfiles.sh "../dotfiles/fish/conf.d/" ~/.config/fish/conf.d/ false
    ${SCRIPT_DIR}/symlink_dotfiles.sh "../personal/fish/" ~/.config/fish/conf.d/ false
    ${SCRIPT_DIR}/symlink_dotfiles.sh "../dotfiles/fish/completions/" ~/.config/fish/completions/ false
    ${SCRIPT_DIR}/symlink_dotfiles.sh "../dotfiles/universal/"

    # ~/bin is added to PATH in config.fish
    ${SCRIPT_DIR}/symlink_dotfiles.sh "../dotfiles/bin/" ~/bin/ false
    printf "\n"
}

add_fish_as_allowed_shell() {
    # Add fish to /etc/shells (the list of allowed shells)
    # If "/opt/homebrew/bin/fish" isn't already in "/etc/shells", add it to the list"
    grep -q -F '/opt/homebrew/bin/fish' '/etc/shells' || echo '/opt/homebrew/bin/fish' | sudo tee -a '/etc/shells'
}

install_fisherman() {
    print_info "Installing fisher (package manager)"
    curl -Lo ~/.config/fish/functions/fisher.fish --create-dirs https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish
    print_result $? "Install fisher\n"
}

install_fisherman_packages() {
    print_info "Installing fisher packages:"
    print_list $FISHERMAN_PACKAGES
    /opt/homebrew/bin/fish -c "fisher install $FISHERMAN_PACKAGES"
    print_result $? "Install fisher packages\n"
}

set_fish_as_default_shell() {
    if ask_question "Do you want to set Fish as your default shell?"; then
        # Set fish as default shell
        chsh -s /opt/homebrew/bin/fish
        print_result $? "Set Fish as default shell\n"
    else
        print_error "Alright. When the installer is finished, you can type 'fish' in the terminal to test it without setting it as your default"
    fi
}


print_heading "Fish"
print_in_gray "Fins down the best shell in the tunaverse! (sorry)\n\n"

create_symlinks
add_fish_as_allowed_shell
install_fisherman
install_fisherman_packages
set_fish_as_default_shell
