# Export credentials for the given profile as shell vars.
function awshell
    set -l profile (if test -n "$argv[1]"; echo $argv[1]; else; echo "test"; end)
    aws --profile="$profile" configure export-credentials --format env | source
    set -gx AWS_REGION (aws --profile="$profile" configure get region)
end
