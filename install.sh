#!/bin/bash

CURRENT=$(pwd)
VIMDIR=~/.vim
VIMRC=~/.vimrc
VIMBUNDLE=$VIMDIR/bundle

if [ -e $VIMDIR ] || [ -e $VIMRC ]; then 
	echo "Previois Vim configuration already exists."
	echo "Delete $VIMRC ? [Y/n]"
	read answer
	if [ "$answer" == "y" ] || [ "$answer" == "" ]; then
		rm $VIMRC
	fi
	
	echo "Delete $VIMDIR ? [Y/n]"
	read answer
	if [ "$answer" == "y" ] || [ "$answer" == "" ]; then
		rm -rf $VIMDIR
	fi

fi

ln -s $CURRENT/vim $VIMDIR
ln -s $CURRENT/vimrc $VIMRC

ls -l $VIMDIR $VIMRC

git clone https://github.com/VundleVim/Vundle.vim.git $VIMBUNDLE/Vundle.vim
vim +PluginInstall +qall

echo "Done"
