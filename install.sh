#!/bin/bash
for num in "$@"; do
	if [ "$num" == "--vim" or "$num" == "--all" ]; then
		hash vim 2>/dev/null || { echo >&2 "I require vim but it's not installed.  Installing."; sudo apt-get install gnome-vim; }
		cp -rf .vim ~/
		cp .vimrc ~/.vimrc
	elif [ "$num" == "--zsh" or "$num" == "--all" ]; then
		hash zsh 2>/dev/null || { echo >&2 "I require zsh but it's not installed.  Installing."; sudo apt-get install zsh; }
		hash curl 2>/dev/null || { echo >&2 "I require curl but it's not installed.  Installing."; sudo apt-get install curl; }
		curl -L http://install.ohmyz.sh | sh	
		cp .bashrc ~/.bashrc
		cp .bash_aliases ~/.bash_aliases
		cp .zshrc ~/.zshrc
		cp -rf .oh-my-zsh ~/
	elif [ "$num" == "--tmux" or "$num" == "--all" ]; then
		hash tmux 2>/dev/null || { echo >&2 "I require tmux but it's not installed.  Installing."; sudo apt-get install tmux; }
		cp .tmux.conf ~/.tmux.conf
		cp .snapshot ~/.snapshot
	elif [ "$num" == "--plugins" or "$num" == "--all" ]; then
		git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
		vim +PluginInstall +qall
	elif [ "$num" == "--font" or "$num" == "--all" ]; then
		xdg-open ubuntu_mono_derivative_powerline.ttf
	fi
done
