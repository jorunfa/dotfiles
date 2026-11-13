# Retrieve and cache the AWS SSO access token.
# Set AWS_SSO_SESSION (e.g. in ~/.config/fish/local.fish) to pick an SSO session.
function awslogin
    if set -q AWS_SSO_SESSION
        aws sso login --sso-session $AWS_SSO_SESSION $argv
    else
        aws sso login $argv
    end
end
