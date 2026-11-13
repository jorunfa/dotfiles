#!/bin/bash

# SCRIPT_DIR == Same folder as the script is placed in
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
source "${SCRIPT_DIR}/utils.sh"

create_symlinks() {
    print_info "Creating symlinks to the jj config"
    ${SCRIPT_DIR}/symlink_dotfiles.sh "../dotfiles/jj/" ~/.config/jj/ false
    printf "\n"
}

# ~/.config/jj/config.toml is a symlink into this repo, so the name and email go in
# conf.d/local.toml instead. Reuses the values git.sh saved
set_name_and_email() {
    local_config=~/.config/jj/conf.d/local.toml
    print_info "Copying git name and email to $(tildify $local_config)"
    mkdir -p "$(dirname "$local_config")"
    jj config set --file "$local_config" user.name "$(git config user.name)" &&
        jj config set --file "$local_config" user.email "$(git config user.email)"
    print_result $? "Set jj name and email\n"
}


print_heading "jj"
print_in_gray "Jujutsu, a Git-compatible version control system. It's installed as an essential brew package, so this only sets up the config\n\n"

create_symlinks
set_name_and_email
