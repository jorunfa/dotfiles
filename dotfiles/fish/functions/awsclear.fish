# Clear the credentials from the exported shell vars.
function awsclear
    set -e AWS_SECRET_ACCESS_KEY
    set -e AWS_ACCESS_KEY_ID
    set -e AWS_CREDENTIAL_EXPIRATION
    set -e AWS_SESSION_TOKEN
    set -e AWS_REGION
end
