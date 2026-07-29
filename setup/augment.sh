#!/bin/bash

# SCRIPT_DIR == Same folder as the script is placed in
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
source "${SCRIPT_DIR}/utils.sh"

create_symlinks() {
    print_info "Creating symlinks to the Augment rules"
    ${SCRIPT_DIR}/symlink_dotfiles.sh "../dotfiles/augment/rules/" ~/.augment/rules/ false
    printf "\n"
}


print_heading "Augment"
print_in_gray "Rules that shape how the Augment agent behaves\n\n"

create_symlinks
