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

rainbarf_install() {
  echo "Installing rainbarf..."
  if ! [ -x ~/lib/perl5/bin/rainbarf ]; then
    cpan Module::Build # choose sudo when installing
    cd "$DOTFILES_DIR"/rainbarf
    perl Build.PL --install_base ~/lib/perl5
    ./Build test
    ./Build install
    cd -
  else
    echo "rainbarf already installed"
  fi
  echo "Finished installing rainbarf locally"
}

install_ohmyzsh() {
  echo "Installing ohmyzsh..."
  if [ ! -d $HOME/.oh-my-zsh/ ]; then
    curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh
  else
    echo "ohmyzsh already installed"
  fi
}

install() {
  fzf_install
  rainbarf_install
  install_ohmyzsh
}

create_ssh
change_to_zsh
install 
