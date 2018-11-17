#!/bin/bash

tmux_override=""
vim_override=""
pip_cmd="pip3 install --user git+git://github.com/powerline/powerline"
if [ -f ~/.tmux.conf ] ; then
  read -p "Tmux conf already exists. Overwrite? (y/n)"; yn
  case $yn in 
    [Yy]* ) rm ~/.tmux.conf;;
    [Nn]* ) exit 1;;
    * ) echo "What?";;
  esac
fi
cp .tmux.conf ~/.tmux.conf
if [ -f ~/.vimrc ] ; then
  read -p "Vimrc already exists. Overwrite? (y/n)"; yn
  case $yn in 
    [Yy]* ) rm ~/.vimrc;;
    [Nn]* ) exit 1;;
    * ) echo "What?";;
  esac
fi
cp .vimrc ~/.vimrc
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
if ! which pip3 ; then
  echo "install pip3, then run '$pip_cmd'"
  exit 1;
fi
$pip_cmd
echo 'PATH=$PATH:$HOME/.local/bin/' >> ~/.bashrc
source ~/.bashrc
powerline-deamon -q
echo "Update the powerline location in ~/.tmux.conf"
