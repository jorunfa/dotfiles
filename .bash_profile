export LC_CTYPE=en_GB.UTF-8
export LC_ALL="en_GB.UTF-8"
export LANG="en_GB"

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

# added by Anaconda 1.6.1 installer
export PATH="/Users/jorunfa/anaconda/bin:$PATH"
export PATH="$PATH:/Users/jorunfa/android-sdk-macosx/platform-tools:/Users/jorunfa/android-sdk-macosx/tools"

# Load ~/.extra, ~/.bash_prompt, ~/.exports, ~/.aliases and ~/.functions
# ~/.extra can be used for settings you don’t want to commit
for file in ~/.{extra,bash_prompt,exports,aliases,functions}; do
	[ -r "$file" ] && source "$file"
done
unset file

# init z   https://github.com/rupa/z
. ~/projects/z/z.sh

# Add tab completion for SSH hostnames based on ~/.ssh/config, ignoring wildcards
[ -e "$HOME/.ssh/config" ] && complete -o "default" -o "nospace" -W "$(grep "^Host" ~/.ssh/config | grep -v "[?*]" | cut -d " " -f2)" scp sftp ssh

# Add tab completion for `defaults read|write NSGlobalDomain`
# You could just use `-g` instead, but I like being explicit
complete -W "NSGlobalDomain" defaults

# For Brew
export PATH=/usr/local/bin:$PATH
