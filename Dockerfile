# Use a specific Ubuntu base image
FROM ubuntu:20.04

# Set environment variables to avoid interaction
ENV DEBIAN_FRONTEND=noninteractive \
    TZ=UTC

# Install system dependencies and clean up
RUN apt-get update && \
    apt-get install -y \
    build-essential \
    clang \
    gcc \
    g++ \
    gdb \
    llvm \
    gobjc \
    gobjc++ \
    libobjc-10-dev \
    libstdc++-10-dev \
    rustc \
    cargo \
    dub \
    valac \
    openjdk-11-jdk \
    wget \
    python3 \
    python3-pip \
    git && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Install Meson, Ninja, and Cython using pip
RUN python3 -m pip install --no-cache-dir meson ninja

# Set environment variables
ENV CC=/usr/bin/clang
ENV CXX=/usr/bin/clang++
ENV LD_LIBRARY_PATH=/usr/local/lib

# Set working directory
WORKDIR /workspace

# Default command
CMD ["bash"]