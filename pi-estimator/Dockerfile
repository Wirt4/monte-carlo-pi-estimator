# syntax=docker/dockerfile:1

# Comments are provided throughout this file to help you get started.
# If you need more help, visit the Dockerfile reference guide at
# https://docs.docker.com/go/dockerfile-reference/


################################################################################
# Pick a base image to serve as the foundation for the other build stages in
FROM alpine:3.21.3 as base

################################################################################
# Create a stage for building/compiling the application.
#
# The following commands will leverage the "base" stage above to generate
# a "hello world" script and make it executable, but for a real application, you
# would issue a RUN command for your application's build process to generate the
# executable. For language-specific examples, take a look at the Dockerfiles in
# the Awesome Compose repository: https://github.com/docker/awesome-compose

WORKDIR /app 
FROM base as build
RUN echo "installing pixi"
RUN curl -fsSL https://pixi.sh/install.sh | sh
RUN echo "installed pixi"
# RUN echo -e '#!/bin/sh\n\
# echo Hello world from $(whoami)! In order to get your application running in a container, take a look at the comments in the Dockerfile to get started.'\
#> /bin/hello.sh
# RUN chmod +x /bin/hello.sh

################################################################################
# Create a final stage for running your application.
#
# The following commands copy the output from the "build" stage above and tell
# the container runtime to execute it when the image is run. Ideally this stage
# contains the minimal runtime dependencies for the application as to produce
# the smallest image possible. This often means using a different and smaller
# image than the one used for building the application, but for illustrative
# purposes the "base" image is used here.
FROM base AS final

# Create a non-privileged user that the app will run under.
# See https://docs.docker.com/go/dockerfile-user-best-practices/
# ARG UID=10001
# RUN adduser \
#   --disabled-password \
#    --gecos "" \
#    --home "/nonexistent" \
#    --shell "/sbin/nologin" \
#    --no-create-home \
#    --uid "${UID}" \
#    appuser
# USER appuser

# Copy the project from the host to the app
COPY . /app

CMD ["/bin/sh", "-i"]
