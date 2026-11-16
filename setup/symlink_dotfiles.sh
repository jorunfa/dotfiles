#!/bin/bash

# SCRIPT_DIR == Same folder as the script is placed in
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
source "${SCRIPT_DIR}/utils.sh"

# Instead of actually copying the dotfiles in this repo to ~/, it simply symlinks them
# $1: Relative path to the dotfiles you want to symlink
# (optional) $2: Path to where the symlink will be placed (default is ~/)
# (optional) $3: Whether the files should be hidden or not. true == hidden, false == visible
symlink_dotfiles() {
    relative_source_path=$1 # Example: "../dotfiles/fish"
    absolute_source_path=$( cd "$( dirname "${BASH_SOURCE[0]}" )/$relative_source_path/" && pwd )

    # Where the symlinks should be placed. Default is ~/
    destination_path=${2:-~/}

    # Whether to hide the symlinks or not (default is hidden)
    # Example: true => ".vimrc" false => "vimrc"
    add_dot_in_front_of_filenames=${3:-true}

    # Existing files are moved to ~/dotfiles_old (see link_file in utils.sh)
    for file in "$absolute_source_path"/*; do
        file_name=${file##*/} # $file = /absolute/path/to/file.txt  VS.  $file_name = file.txt

        if [ "$add_dot_in_front_of_filenames" = true ]; then
            absolute_symlink_path=$destination_path.$file_name
        else
            absolute_symlink_path=$destination_path$file_name
        fi

        link_file "$file" "$absolute_symlink_path"
    done
}

symlink_dotfiles $1 $2 $3
