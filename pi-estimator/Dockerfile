# syntax=docker/dockerfile:1

# Comments are provided throughout this file to help you get started.
# If you need more help, visit the Dockerfile reference guide at
# https://docs.docker.com/go/dockerfile-reference/


################################################################################
FROM alpine:3.21.3 
RUN apk update && apk add --no-cache curl
################################################################################

WORKDIR /app 
RUN echo "installing pixi"

#install pixi, mojo's package manager
RUN curl -fsSL https://pixi.sh/install.sh -o install.sh && \
    chmod +x install.sh && \
    ./install.sh -y && \
    echo "Pixi install complete" && \
    find / -type f -name pixi
ENV PATH="/root/.pixi/bin:$PATH"
# TODO: write the settings to the correct directory so pixi is recognized
# Copy the project from the host to the app

