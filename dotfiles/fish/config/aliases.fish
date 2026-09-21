# Navigation
function ..    ; cd .. ; end
function ...   ; cd ../.. ; end
function ....  ; cd ../../.. ; end
function ..... ; cd ../../../.. ; end

# git shortcuts
abbr master 'git checkout master'
abbr push 'git push'

# Edit hosts file
abbr hosts 'sudo vim /etc/hosts'

# Check free diskspace
abbr diskspace_report 'df -P -kHl'

# Recursively delete `.DS_Store` files
abbr cleanup_dsstore "find . -name '*.DS_Store' -type f -ls -delete"

# Run previous command with sudo
function sudo!!
    eval sudo $history[1]
end

abbr c bat


abbr ls lsd

abbr l 'lsd -l'
abbr la 'lsd -a'
abbr lla 'lsd -la'
abbr tres 'lsd --tree'

# most used commands
abbr g git
abbr k kubectl
abbr kx kubectx
abbr b bazel
