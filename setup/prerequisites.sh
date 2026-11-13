#!/bin/bash

# SCRIPT_DIR == Same folder as the script is placed in
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
source "${SCRIPT_DIR}/../settings.sh"
source "${SCRIPT_DIR}/utils.sh"

install_xcode_select() {
  print_info "Installing Xcode Command Line Tools (This might take a few minutes)"

  if xpath=$( xcode-select --print-path 2>/dev/null ) && test -d "${xpath}" && test -x "${xpath}" ; then
      print_success "Oh! Seems like the Xcode tools were already installed ¯\_(ツ)_/¯\n"
  else
      touch /tmp/.com.apple.dt.CommandLineTools.installondemand.in-progress;
      PROD=$(softwareupdate -l |
          grep "\*.*Command Line" |
          head -n 1 | awk -F"*" '{print $2}' |
          sed -e 's/^ *//' |
          tr -d '\n')
      softwareupdate -i "$PROD" --verbose;

      print_result $? "Install Xcode Command Line Tools\n";
  fi
}

install_brew() {
    print_info "Installing Homebrew"
    if ! which brew > /dev/null; then
        /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
        print_result $? "Install Homebrew\n"
        eval "$(/opt/homebrew/bin/brew shellenv)"
    else
        print_success "Oh! Homebrew was already installed!\n"
    fi
}

install_brew_packages() {
    print_info "Installing essential homebrew packages:"
    print_list $@
    brew install "$@"
    print_result $? "Install brew packages\n"
}

install_optional_brew_packages() {
    print_info "The following are a collection of OPTIONAL brew packages. They aren't really need for the setup to work, but you might still find them useful:"
    print_list $@
    printf "\n"

    if ask_question "Do you want to install the (completely optional) brew packages mentioned above?"; then
        brew install "$@"
        print_result $? "Install optional brew packages\n"
    fi
}

print_heading "Install prerequisites"
install_xcode_select
install_brew
install_brew_packages $ESSENTIAL_BREW_PACKAGES
install_optional_brew_packages $OPTIONAL_BREW_PACKAGES
