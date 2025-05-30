FROM ubuntu:22.04

# Set up working directory
WORKDIR /app

# Install system packages
RUN apt-get update && apt-get install -y \
    curl \
    git \
    bash \
    vim \
    python3 \
    ca-certificates \
    clang \
    build-essential \
    && rm -rf /var/lib/apt/lists/*

# Install Pixi
RUN curl -fsSL https://pixi.sh/install.sh | sh
ENV PATH="/root/.pixi/bin:$PATH"

# Copy project files
COPY . /app

