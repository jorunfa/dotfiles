#!/bin/bash

# SCRIPT_DIR == Same folder as the script is placed in
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
source "${SCRIPT_DIR}/utils.sh"

# For settings that only apply to this machine. Not tracked by the dotfiles
LOCAL_GITCONFIG=~/.gitconfig.local

create_symlinks() {
    print_info "Creating symlink to the personal git config"
    ${SCRIPT_DIR}/symlink_dotfiles.sh "../personal/git/"
    printf "\n"
}

ask_for_name_and_email() {
    print_question "Enter your full name: "
    read -r git_name </dev/tty

    print_question "Enter your email: "
    read -r git_email </dev/tty

    if [ -z "$git_name" ] || [ -z "$git_email" ]; then
        print_error "Name and email can't be empty. Run setup/git.sh again to set them"
        return 1
    fi

    git config --file "$LOCAL_GITCONFIG" user.name "$git_name" &&
        git config --file "$LOCAL_GITCONFIG" user.email "$git_email"
    print_result $? "Set git name and email in $(tildify $LOCAL_GITCONFIG)"
}

print_heading "Git"

create_symlinks

if [ -n "$(git config user.name)" ] && [ -n "$(git config user.email)" ]; then
    print_info "Found the following name and email in the git config:"
    print_in_blue "      * Name: $(git config user.name)\n"
    print_in_blue "      * Email: $(git config user.email)\n"

    if ! ask_question "Use the name and email mentioned above?"; then
        ask_for_name_and_email
    fi
else
    printf "To setup Git properly you'll need to specify your name and email\n\n"
    ask_for_name_and_email
fi
