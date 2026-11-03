#!/bin/bash

# SCRIPT_DIR == Same folder as the script is placed in
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
source "${SCRIPT_DIR}/utils.sh"

create_symlinks() {
    print_info "Creating symlinks to the jj config"
    ${SCRIPT_DIR}/symlink_dotfiles.sh "../dotfiles/jj/" ~/.config/jj/ false
    printf "\n"
}


print_heading "jj"
print_in_gray "Jujutsu, a Git-compatible version control system. It's installed as an essential brew package, so this only sets up the config\n\n"

create_symlinks
