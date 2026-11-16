#!/bin/bash

# SCRIPT_DIR == Same folder as the script is placed in
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
source "${SCRIPT_DIR}/utils.sh"

create_symlinks() {
    print_info "Creating symlinks to the Augment rules"
    ${SCRIPT_DIR}/symlink_dotfiles.sh "../dotfiles/augment/rules/" ~/.augment/rules/ false
    print_info "Creating symlinks to the Augment skills"
    ${SCRIPT_DIR}/symlink_dotfiles.sh "../dotfiles/augment/skills/" ~/.augment/skills/ false
    printf "\n"
}


print_heading "Augment"
print_in_gray "Rules and skills that shape how the Augment agent behaves\n\n"

print_info "These are personal preferences. Take a look at dotfiles/augment/ before saying yes"
if ask_question "Do you want to install the Augment rules and skills?"; then
    create_symlinks
else
    print_error "Skipping Augment rules and skills"
fi
