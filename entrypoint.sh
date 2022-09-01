#!/bin/bash
set -x

source /root/.gvm/scripts/gvm
source $HOME/.sdkman/bin/sdkman-init.sh

if [ -z "$JDK_VERSION_VAL" ];
then
    echo "Skipping installation. JDK_VERSION_VAL is empty"
else
    echo "Installing Java ${JDK_VERSION_VAL}"
    sdk install java ${JDK_VERSION_VAL}
fi

if [ -z "$CFX_VERSION_VAL" ];
then
    echo "Skipping installation. CFX_VERSION_VAL is empty"
else
    echo "Installing CFX ${CFX_VERSION_VAL}"
    sdk install cfx ${CFX_VERSION_VAL}
fi

if [ -z "$NODE_VERSION_VAL" ];
then
    echo "Skipping installation. NODE_VERSION_VAL is empty"
else
    echo "Installing Node ${NODE_VERSION_VAL}"
    nvm install -s ${NODE_VERSION_VAL}
fi

if [ -z "$GO_VERSION_VAL" ];
then
    echo "Skipping installation. GO_VERSION_VAL is empty"
else
    echo "Installing Go ${GO_VERSION_VAL}"
    gvm install  go${GO_VERSION_VAL}
    gvm use   go${GO_VERSION_VAL}
fi
