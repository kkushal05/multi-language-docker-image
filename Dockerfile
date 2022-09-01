FROM alpine:latest
LABEL maintainer="kushal.kumar"
RUN apk update
RUN apk add bash
RUN apk add curl wget zip unzip bison
RUN curl -s "https://get.sdkman.io" | bash
RUN bash "$HOME/.sdkman/bin/sdkman-init.sh"
RUN curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.38.0/install.sh | bash
RUN bash ~/.nvm/nvm.sh
ENV PYTHONUNBUFFERED=1
RUN apk add --update --no-cache python3 && ln -sf python3 /usr/bin/python
RUN python3 -m ensurepip
RUN pip3 install --no-cache --upgrade pip setuptools
RUN apk add build-base git
SHELL ["/bin/bash", "-c"]
RUN bash < <(curl -s -S -L https://raw.githubusercontent.com/moovweb/gvm/master/binscripts/gvm-installer) && source /root/.gvm/scripts/gvm 
COPY entrypoint.sh /
RUN ls -lrth / 
RUN pwd
RUN chmod 755 entrypoint.sh 
ENTRYPOINT ["./entrypoint.sh"]
