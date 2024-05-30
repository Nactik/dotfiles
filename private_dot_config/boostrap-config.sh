#!/bin/bash

echo "Upgrading sources ..."
sudo apt upgrade -y;

echo "Installing common utils"
sudo apt install -y curl \
  git \
  gcc \
  jq \
  python3-pip \
  alacritty \
  bspwm \
  rofi \
  polybar \
  dunst \
  apt-transport-https \
  ca-certificates \
  pavucontrol \
  fzf \
  xclip \
  gnupg

wget https://github.com/mikefarah/yq/releases/latest/download/yq_linux_amd64 -O /usr/bin/yq &&\
    chmod +x /usr/bin/yq

echo "Installing Google-chrome"
wget -q -O - https://dl.google.com/linux/linux_signing_key.pub | sudo gpg --dearmour -o /usr/share/keyrings/chrome-keyring.gpg
sudo sh -c 'echo "deb [arch=amd64 signed-by=/usr/share/keyrings/chrome-keyring.gpg] http://dl.google.com/linux/chrome/deb/ stable main" > /etc/apt/sources.list.d/google.list'

sudo apt update
sudo apt install google-chrome-stable



# i3-color dependencies
echo "Installing i3-color build deps ..."
sudo apt install autoconf gcc make pkg-config libpam0g-dev libcairo2-dev libfontconfig1-dev libxcb-composite0-dev libev-dev libx11-xcb-dev libxcb-xkb-dev libxcb-xinerama0-dev libxcb-randr0-dev libxcb-image0-dev libxcb-util-dev libxcb-xrm-dev libxkbcommon-dev libxkbcommon-x11-dev libjpeg-dev


echo "Installing brew ..."

# Brew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

test -d ~/.linuxbrew && eval "$(~/.linuxbrew/bin/brew shellenv)"
test -d /home/linuxbrew/.linuxbrew && eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
echo "eval \"\$($(brew --prefix)/bin/brew shellenv)\"" >> ~/.zshrc

/home/linuxbrew/.linuxbrew/bin/brew tap Homebrew/bundle

## Chezmoi
echo "Installing and configuring chezmoi .."
/home/linuxbrew/.linuxbrew/bin/brew install chezmoi

/home/linuxbrew/.linuxbrew/bin/chezmoi init https://github.com/Nactik/dotfiles
/home/linuxbrew/.linuxbrew/bin/chezmoi apply ~/.zshrc
/home/linuxbrew/.linuxbrew/bin/chezmoi apply ~/.config/
/home/linuxbrew/.linuxbrew/bin/chezmoi apply ~/.local
/home/linuxbrew/.linuxbrew/bin/chezmoi apply ~/.fonts

# Homebrew 
/home/linuxbrew/.linuxbrew/bin/brew bundle --file ~/.config/Brewfile

# Packer
echo "Installing packer ..."
git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim

# Zsh auto-suggestion
echo "Installing zsh auto-suggestion"
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

# Install Rust
echo "Installing Rust ..."
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

echo "Installing Golang ..."
wget -P https://go.dev/dl/go1.22.3.linux-amd64.tar.gz
sudo rm -rf /usr/local/go && tar -C /usr/local -xzf /tmp/go1.22.3.linux-amd64.tar.gz

echo "Installing nvm ..."
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash

# Docker stuff
echo "Installing docker ...."
# Add Docker's official GPG key:
sudo apt-get update -y
sudo apt-get install ca-certificates curl
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc

# Add the repository to Apt sources:
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update -y

sudo sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

echo "Adding user to docker group"
sudo groupadd docker
sudo usermod -aG docker $USER
newgrp docker

# Gcloud
echo "Installing gcloud"
curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo gpg --dearmor -o /usr/share/keyrings/cloud.google.gpg
echo "deb [signed-by=/usr/share/keyrings/cloud.google.gpg] https://packages.cloud.google.com/apt cloud-sdk main" | sudo tee -a /etc/apt/sources.list.d/google-cloud-sdk.list
sudo apt-get update && sudo apt-get install google-cloud-cli
sudo apt install google-cloud-cli-gke-gcloud-auth-plugin
