#!/bin/bash

# SCRIPT_DIR == Same folder as the script is placed in
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
source "${SCRIPT_DIR}/utils.sh"

create_symlinks() {
    print_info "Creating symlinks to the lsd config"
    ${SCRIPT_DIR}/symlink_dotfiles.sh "../dotfiles/lsd/" ~/.config/lsd/ false
    printf "\n"
}


print_heading "lsd"
print_in_gray "A prettier 'ls'. It's installed as an essential brew package, so this only sets up the colors\n\n"

create_symlinks
