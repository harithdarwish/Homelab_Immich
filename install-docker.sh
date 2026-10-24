#!/bin/bash

# Exit immediately if a command exits with a non-zero status
set -e

echo "=== Starting Docker & Docker Compose Installation ==="

# 1. Add Docker's official GPG key:
echo "-> Adding Docker GPG key..."
sudo apt update
sudo apt install -y ca-certificates curl
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc

# 2. Add the repository to Apt sources:
echo "-> Adding Docker repository to APT sources..."
sudo tee /etc/apt/sources.list.d/docker.sources <<DEEOF
Types: deb
URIs: https://download.docker.com/linux/ubuntu
Suites: $(. /etc/os-release && echo "${UBUNTU_CODENAME:-$VERSION_CODENAME}")
Components: stable
Architectures: $(dpkg --print-architecture)
Signed-By: /etc/apt/keyrings/docker.asc
DEEOF

# 3. Update package index and install Docker + Compose plugin:
echo "-> Installing Docker Engine and Docker Compose..."
sudo apt update
sudo apt install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

# 4. Optional: Add current user to the docker group so you don't need sudo
echo "-> Adding user to docker group..."
sudo usermod -aG docker $USER

echo "=== Docker Installation Complete! ==="
echo "Note: If you want to run docker without sudo right now, run: newgrp docker"
