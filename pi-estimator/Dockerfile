# syntax=docker/dockerfile:1

# Comments are provided throughout this file to help you get started.
# If you need more help, visit the Dockerfile reference guide at
# https://docs.docker.com/go/dockerfile-reference/


################################################################################
# Pick a base image to serve as the foundation for the other build stages in
FROM alpine:3.21.3 as base

################################################################################

WORKDIR /app 
FROM base as build
RUN echo "installing pixi"
RUN curl -fsSL https://pixi.sh/install.sh | sh
RUN echo "installed pixi"
# TODO: write the settings to the correct directory so pixi is recognized
# Copy the project from the host to the app

