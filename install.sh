#!/bin/bash

CURRENT=$(pwd)
VIMDIR=~/.vim
VIMRC=~/.vimrc
VIMBUNDLE=$VIMDIR/bundle
VIM3RD=$VIMDIR/3rd


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
vim -c "call coc#util#install()"   # finishes the installation of CoC

echo "Install Elm language server (needs npm) ? [Y/n]"
read answer
if [ "$answer" == "y" ] || [ "$answer" == "" ]; then
        npm install -g @elm-tooling/elm-language-server
fi

echo "Install Elixir language server (needs mix) ? [Y/n]"
read answer
if [ "$answer" == "y" ] || [ "$answer" == "" ]; then
    git clone https://github.com/JakeBecker/elixir-ls.git $VIM3RD/elixir-ls
    cd $VIM3RD/elixir-ls
    mix deps.get
    mix compile
    mix elixir_ls.release -o release
    sed -i "s:<<VIM3RDPATH>>:$VIM3RD:g" $VIMDIR/coc-settings.json
    cd -
fi

echo "Install Python language server ? [Y/n]"
read answer
if [ "$answer" == "y" ] || [ "$answer" == "" ]; then
        vim  -c "CocInstall coc-python"
fi

echo "Done"
