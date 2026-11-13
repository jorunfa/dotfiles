# dotfiles
macOS setup for a terminal-centric developer: [fish](https://fishshell.com/), [Ghostty](https://ghostty.org/), [starship](https://starship.rs/), [mise](https://mise.jdx.dev/), git and [jj](https://jj-vcs.github.io/jj/), plus about 100 macOS tweaks.

Originally forked from [mortenvn/dotfiles](https://github.com/mortenvn/dotfiles) (credz to him).

![dotfiles-demo](https://cloud.githubusercontent.com/assets/3471625/26286320/9818992c-3e62-11e7-9f4f-00e5ebb3ba0e.gif)


# Getting started
These dotfiles are opinionated. If you want to use them yourself, **fork the repo** so you can make it your own.

1. Clone your fork. On a brand-new Mac, HTTPS is easiest, since you probably don't have an SSH key on GitHub yet:
   ```sh
   git clone https://github.com/<you>/dotfiles.git ~/projects/dotfiles
   ```
   The dotfiles are symlinked from wherever you clone them, so pick a permanent location.
2. Edit **settings.sh**
    * Fill in your git name and email (or leave them empty to be asked)
    * Remove applications (`BREW_CASKS`) and packages you don't want
3. Skim **setup/macos.sh** and remove tweaks you don't want
4. Run the install script: `./install.sh`

The installer asks before every optional step, and backs up any existing dotfiles to `~/dotfiles_old`.

You can also run a single step on its own, e.g. `./setup/ghostty.sh`. Most steps assume Homebrew and the essential packages are installed, so run `./setup/prerequisites.sh` first.


# But... What does the install script DO?
Lots of things! The following things will happen in chronological order:

<sub>**[?]** = **Optional** (the installer will ask before making the change)</sub>

* **Prerequisites**
  * Install [Xcode Command Line Tools](https://developer.apple.com/xcode/resources/)
  * Install [Homebrew](https://brew.sh/)
  * Install essential brew packages (e.g. `fish`, `mise`, `starship`, `fzf`, `jj` and `coreutils`)
  * **[?]** Install optional brew packages
* **Fish**
  * Symlink [universal dotfiles](dotfiles/universal) (such as [.gitconfig](dotfiles/universal/gitconfig) and [.vimrc](dotfiles/universal/vimrc))
  * Symlink [fish specific dotfiles](dotfiles/fish)
  * Symlink [scripts](dotfiles/bin) to `~/bin`
  * Install [fisher](https://github.com/jorgebucaran/fisher) (fish package manager) and fisher packages (e.g. [z](https://github.com/jethrokuan/z))
  * **[?]** Set fish as default shell
* **[?] Bash**
  * Symlink [bash specific dotfiles](dotfiles/bash)
  * Install bash specific brew dependencies
* **Vim**
  * Install vim-plug (vim package manager)
  * Install vim plugins (see [.vimrc](dotfiles/universal/vimrc))
* **Git**
  * Save your name and email to `~/.gitconfig.local`
* **jj**
  * Symlink the [jj config](dotfiles/jj/config.toml)
  * Copy your git name and email to `~/.config/jj/conf.d/local.toml`
* **[?] Ghostty**
  * Install [Ghostty](https://ghostty.org/)
  * Symlink the [Ghostty config](dotfiles/ghostty/config.ghostty)
* **lsd**
  * Symlink the [lsd config](dotfiles/lsd) (a prettier `ls`)
* **[?] Install global NPM packages** (skipped if `NPM_PACKAGES` is empty)
* **[?] Augment**
  * Symlink personal [Augment](https://www.augmentcode.com/) agent [rules and skills](dotfiles/augment)
* **[?] Change macOS defaults (about 100 tweaks in total)**
* **[?] Install applications (such as Chrome and VS Code)**

For more information on what the **actual dotfiles** do, take a look at the [source code](dotfiles).


# Personal and machine-specific settings
The shared dotfiles are symlinked into your home folder, so editing them edits the repo. Put things that only apply to you or one machine (work credentials, secrets, company-specific aliases) in these untracked files instead:

| File | Used for |
| --- | --- |
| `~/.gitconfig.local` | Git name, email, work credential helpers and alias overrides. Included at the bottom of [.gitconfig](dotfiles/universal/gitconfig) |
| `~/.config/jj/conf.d/local.toml` | jj name and email, or anything else that shouldn't be shared |
| `~/.config/fish/local.fish` | Fish environment variables and functions, e.g. `set -gx AWS_SSO_SESSION my-company` for `awslogin` |

A few things in the config assume specific tools, and are skipped if they're missing:
* **1Password SSH agent**: `SSH_AUTH_SOCK` is only set if the 1Password agent is enabled
* **`EDITOR`** is set to [code-wait](dotfiles/bin/code-wait), which needs VS Code's `code` command on your PATH
* The `cai` aliases in git and jj write commit messages with [auggie](https://docs.augmentcode.com/cli/overview)


# Better terminal colors
![Snazzy theme by Sindre Sorhus](https://github.com/sindresorhus/terminal-snazzy/raw/master/screenshot.png)


### Ghostty
You don't have to do anything. Just run `install.sh` or `setup/ghostty.sh`.


### Terminal
1. Open the file `other/snazzy.terminal`
2. Open **Settings** ➔ **Profiles**
3. Select **Snazzy** and click **Default**


### iTerm
1. Open the file `other/snazzy.itermcolors`
2. Select **Snazzy** from **Settings** ➔ **Profiles** ➔ **Colors** ➔ **Color Presets**
