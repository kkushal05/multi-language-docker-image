FROM jenkins/inbound-agent:latest
LABEL maintainer="kushal.kumar"

# SET ENVIRONMENT VARIABLES
ENV PYTHONUNBUFFERED=1
ENV JDK_VERSION_VAL="14.0.2-zulu"
ENV NODE_VERSION_VAL="v16.9.1"
ENV GO_VERSION_VAL="1.4"
ENV CFX_VERSION_VAL="14.0.2-zulu"

#INSTALL DEPENDENCIES
RUN apt-get update -y
RUN apt-get install curl git make binutils bison gcc build-essential wget zip unzip ca-certificates openssl coreutils g++  \
grep util-linux binutils findutils file patchelf
RUN apt-get install  python3 python3-pip && ln -sf python3 /usr/bin/python
RUN pip3 install --no-cache --upgrade pip setuptools

#INSTALL JDK AND SDK VERSION MANAGER
RUN curl -s "https://get.sdkman.io" | bash
RUN bash "$HOME/.sdkman/bin/sdkman-init.sh"

#INSTALL NODE VERSION MANAGER
RUN curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash
RUN bash ~/.nvm/nvm.sh

#INSTALL GO VERSION MANAGER
SHELL ["/bin/bash", "-c"]
RUN bash < <(curl -s -S -L https://raw.githubusercontent.com/moovweb/gvm/master/binscripts/gvm-installer) && source /root/.gvm/scripts/gvm 
COPY entrypoint.sh /
RUN chmod 755 /entrypoint.sh 
ENTRYPOINT ["./entrypoint.sh"]
