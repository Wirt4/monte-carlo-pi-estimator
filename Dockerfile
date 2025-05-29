
# Use Alpine Linux as the base image
FROM alpine:latest

# Install dependencies ( bash, and other required tools)
RUN apk update && apk add --no-cache \
    bash \
    curl \
    git

# Install Pixi (the Mojo package manager)
RUN curl -sSL https://get.pixilabs.io | sh

# Set the working directory inside the container
WORKDIR /app

# Copy the Hello World Mojo project into the container
COPY hello_world.mojo

# Install Mojo using Pixi (this step may not be needed if Mojo is already included)
RUN pixi install mojo  # Adjust if necessary based on Pixi's command for Mojo

# Run the Mojo application (adjust this command based on how Mojo is run)
CMD ["pixi", "run", "hello_world.moj"]
