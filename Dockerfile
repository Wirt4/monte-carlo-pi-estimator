FROM ubuntu:22.04

# Set up working directory
WORKDIR /app

# Install system packages
RUN apt-get update && apt-get install -y \
    curl \
    bash \
    python3 \
    ca-certificates \
    clang \
    build-essential \
    zlib1g-dev \
    && rm -rf /var/lib/apt/lists/*

# Download Pixi
RUN curl -fsSL https://pixi.sh/install.sh | sh
ENV PATH="/root/.pixi/bin:$PATH"

ENV PIXI_PLATFORM=linux-arm64
# Copy project files
COPY . /app

# Install Pixi
# RUN pixi install
