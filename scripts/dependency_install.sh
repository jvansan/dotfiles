#! /usr/bin/env bash

DOTFILES_DIR="$HOME/.dotfiles"

change_to_zsh() {
  if [ "$(echo "$SHELL" | grep -c "zsh")" -eq "0" ]; then
    echo "Setting shell to zsh"
    chsh -s "$(which zsh)"
  else
    echo "zsh is already the default shell"
  fi
}

create_ssh() {
  mkdir -p "$HOME"/.ssh
  chmod 0700 "$HOME"/.ssh
}

fzf_install() {
  echo "Installing fzf..."
  "$DOTFILES_DIR"/fzf/install --key-bindings --completion --no-update-rc
  echo "Finished installing fzf"
}

install_fedora() {
  sudo dnf install -y vim python3-neovim flameshot \
    make gcc zlib-devel bzip2 bzip2-devel readline-devel \
    sqlite sqlite-devel openssl-devel tk-devel libffi-devel xz-devel \
    zip unzip graphviz graphviz-devel
}

install_python() {
  echo "Installing python..."
  if [ ! -d $HOME/.pyenv ]; then
    curl https://pyenv.run | bash
  fi
  if [ ! -f $HOME/.local/bin/poetry ]; then
    curl -sSL https://install.python-poetry.org | python3 -
  fi
}

install_ohmyzsh() {
  echo "Installing ohmyzsh..."
  if [ ! -d $HOME/.oh-my-zsh/ ]; then
    curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh | bash
  else
    echo "ohmyzsh already installed"
  fi
}

install_awscli() {
  echo "Installing AWS CLI"
  if ! [ -x "$(command -v aws)" ]; then
    curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
    unzip awscliv2.zip
    sudo ./aws/install
    rm -r ./aws
    rm awscliv2.zip
  else
    echo "AWS CLI already installed"
  fi
}

install_docker() {
  echo "Installing docker"
  if ! [ -x "$(command -v docker)" ]; then
    curl -fsSL https://get.docker.com/ | bash
    sudo systemctl enable --now docker
    sudo usermod -aG docker $USER
  else
    echo "docker already installed"
  fi
}

install_vscode() {
  echo "Installing code"
  if ! [ -x "$(command -v code)" ]; then
    sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
    sudo sh -c 'echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" > /etc/yum.repos.d/vscode.repo'
    dnf check-update
    sudo dnf install -y code
  else
    echo "code already installed"
  fi
}

install_packer() {
  echo "Installing ohmyzsh..."
  if [ ! -d $HOME/.local/share/nvim/site/pack/packer ]; then
    git clone --depth 1 https://github.com/wbthomason/packer.nvim \
      ~/.local/share/nvim/site/pack/packer/start/packer.nvim
  else
      echo "packer already installed"
  fi
}

sync_nvim() {
  nvim -c 'autocmd User PackerComplete quitall' -c 'PackerSync'
}


install() {
  if [ -x "$(command -v dnf)" ]; then	  
    install_fedora
  fi
  fzf_install
  install_ohmyzsh
  install_python
  install_awscli
  install_docker
  install_vscode
  install_packer
}

create_ssh
change_to_zsh
install
sync_nvim

