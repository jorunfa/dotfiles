#!/bin/bash

# SCRIPT_DIR == Same folder as the script is placed in
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
source "${SCRIPT_DIR}/../settings.sh"
source "${SCRIPT_DIR}/utils.sh"

# ~/.gitconfig is a symlink into this repo, so personal settings go in
# ~/.gitconfig.local instead (it's included at the bottom of the shared gitconfig)
LOCAL_GITCONFIG=~/.gitconfig.local

print_heading "Git"
printf "To setup Git properly you'll need to specify your name and email\n\n"

if [ -n "$GIT_NAME" ] && [ -n "$GIT_EMAIL" ]; then
    print_info "Found the following name and email in settings.sh:"
    print_in_blue "      * Name: $GIT_NAME\n"
    print_in_blue "      * Email: $GIT_EMAIL\n"

    if ! ask_question "Use the name and email mentioned above?"; then
        GIT_NAME=""
        GIT_EMAIL=""
    fi
fi

if [ -z "$GIT_NAME" ] || [ -z "$GIT_EMAIL" ]; then
    print_question "Enter your full name: "
    read -r GIT_NAME </dev/tty

    print_question "Enter your email: "
    read -r GIT_EMAIL </dev/tty
fi

git config --file "$LOCAL_GITCONFIG" user.name "$GIT_NAME" &&
    git config --file "$LOCAL_GITCONFIG" user.email "$GIT_EMAIL"

print_result $? "Set git name and email in $(tildify $LOCAL_GITCONFIG)"
