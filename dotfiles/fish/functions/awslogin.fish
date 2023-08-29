# Retrieve and cache the AWS SSO access token.
function awslogin
    aws sso login --sso-session wgtwo
end
