Multi Language Container image


This container image has been built to allow support for multiple programming languages inside the same container image. Below are the languages supported.

Go
NodeJs
Java
Python

All the languages supported by the below tools have been installed inside this image.


1 ) JDK and SDK version manager - https://sdkman.io/
2 ) Node Version Manager - https://github.com/nvm-sh/nvm
3 ) Go Version Manager - https://github.com/moovweb/gvm


Steps:

1. Build docker image
    docker build -t sdkman:1.0 -f Dockerfile .
   If you are behind a company firewall, use the below command.
   
   
    docker build --build-arg http_proxy=http://myproxy.example.com:3128  --build-arg https_proxy=http://myproxy.example.com:3128  -t sdkman:1.0 -f Dockerfile .
    
    
2. Run the container using the built image using default versions for Java, Go, NodeJS, CFX
   docker run -it --name sdkman sdkman:1.0
   
   If you want to change the versions, then pass then as environment variables
   
   docker run -it -e JDK_VERSION_VAL=17.0.2-zulu -e CFX_VERSION_VAL=x.y -e NODE_VERSION_VAL=12.9 -e GO_VERSION_VAL=1.9 --name sdkman sdkman:1.0
   
