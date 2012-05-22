AWS_SWITCH_HOME=$HOME/.ec2/

function aws-switch {
    local ENV_NAME=$1
    local ENV_HOME=${AWS_SWITCH_HOME}${ENV_NAME}
    if [ ! -d $ENV_HOME ]; then
        echo "Error: cannot find environment named ${ENV_NAME}"
        return 1
    else
        export EC2_PRIVATE_KEY="${ENV_HOME}/pk.pem"
        export EC2_CERT="${ENV_HOME}/cert.pem"
        source ${ENV_HOME}/access.sh
        echo "Using ${ENV_NAME}"
    fi
}

function aws-list {
    ls -F $AWS_SWITCH_HOME | grep '/$' | sed 's|/||'
}
