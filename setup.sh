#!bin/bash

tmux_override=""
vim_override=""
if [ -f ~/.tmux.conf ] ; then
  read -p "Tmux conf already exists. Overwrite? (y/n)"; yn
  case $yn in 
    [Yy]* ) tmux_override="-f";;
    [Nn]* ) exit 1;;
    * ) echo "What?";;
  esac
fi
ln -s $tmux_override .tmux.conf ~/.tmux.conf
if [ -f ~/.vimrc ] ; then
  read -p "Vimrc already exists. Overwrite? (y/n)"; yn
  case $yn in 
    [Yy]* ) vim_override="-f";;
    [Nn]* ) exit 1;;
    * ) echo "What?";;
  esac
fi
ln -s $vim_override .vimrc ~/.vimrc
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
if ! which pip3 ; then
  echo "install pip3, then run 'pip3 install --user powerline'"
  exit 1;
fi
pip3 install --user git+git://github.com/powerline/powerline
