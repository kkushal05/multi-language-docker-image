#!/bin/bash
#set -x
source /root/.gvm/scripts/gvm
bash << (sdkman install java ${JDK_VERSION_VAL})
bash << (sdkman install cfx ${CFX_VERSION_VAL})
bash << (nvm install -s  ${NODE_VERSION_VAL})
bash << (gvm install go${GO_VERSION_VAL})

