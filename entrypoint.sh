#!/bin/bash
#set -x
source /root/.gvm/scripts/gvm
echo "JDK_VERSION_VAL : $JDK_VERSION_VAL"
echo "CFX_VERSION_VAL : $CFX_VERSION_VAL"
echo "NODE_VERSION_VAL : $NODE_VERSION_VAL"
echo "GO_VERSION_VAL : $GO_VERSION_VAL"
bash << (sdkman install java ${JDK_VERSION_VAL})
bash << (sdkman install cfx ${CFX_VERSION_VAL})
bash << (nvm install -s  ${NODE_VERSION_VAL})
bash << (gvm install go${GO_VERSION_VAL})

