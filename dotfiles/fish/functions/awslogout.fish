# Clear the cached AWS SSO access token.
function awslogout
    aws sso logout
end
