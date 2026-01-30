#!/usr/bin/env bash
set -e

echo "== Installing base packages =="

sudo apt-get update

sudo apt-get install -y \
  git \
  curl \
  vim \
  tmux \
  stow \
  fzf \
  ripgrep \
  tree \
  build-essential \
  nodejs \
  npm

echo "== Installing language servers =="

npm install -g \
  yaml-language-server \
  bash-language-server \
  pyright


echo "== Installing vim-plug =="

curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

echo "== Installing vim plugins =="

vim +PlugInstall +qall

echo "== Stowing dotfiles =="

stow vim tmux

echo "== Done =="
echo "Restart your shell."

