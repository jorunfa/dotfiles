#### AWS SSO
# Retrieve and cache the AWS SSO access token.
function awslogin
    aws sso login --sso-session wgtwo
end

# Export credentials for the given profile as shell vars.
function awshell
    set -l profile (if test -n "$argv[1]"; echo $argv[1]; else; echo "test"; end)
    eval (aws --profile="$profile" configure export-credentials --format env)
    set -gx AWS_REGION (aws --profile="$profile" configure get region)
end

# Clear the credentials from the exported shell vars.
function awsclear
    set -e AWS_SECRET_ACCESS_KEY
    set -e AWS_ACCESS_KEY_ID
    set -e AWS_CREDENTIAL_EXPIRATION
    set -e AWS_SESSION_TOKEN
    set -e AWS_REGION
end

# Clear the cached AWS SSO access token.
function awslogout
    aws sso logout
end
