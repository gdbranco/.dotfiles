#!/bin/bash
for num in "$@"; do
	if [ "$num" == "--vim" ] || [ "$num" == "--all" ]; then
		type vim 2>/dev/null || { echo >&2 "I require vim but it's not installed.  Installing."; sudo apt-get install gnome-vim; }
		cp -rf .vim ~/
		cp .vimrc ~/.vimrc
	fi
	if [ "$num" == "--zsh" ] || [ "$num" == "--all" ]; then
		type zsh 2>/dev/null || { echo >&2 "I require zsh but it's not installed.  Installing."; sudo apt-get install zsh; }
		type curl 2>/dev/null || { echo >&2 "I require curl but it's not installed.  Installing."; sudo apt-get install curl; }
		curl -L http://install.ohmyz.sh | sh
		\curl -sSL https://get.rvm.io | bash
		cp .bashrc ~/.bashrc
		cp .bash_aliases ~/.bash_aliases
		cp .zshrc ~/.zshrc
		cp .oh-my-zsh/themes/fino.zsh-theme ~/.oh-my-zsh/themes/fino.zsh-theme
	fi
	if [ "$num" == "--tmux]" ] || [ "$num" == "--all" ]; then
		type tmux 2>/dev/null || { echo >&2 "I require tmux but it's not installed.  Installing."; sudo apt-get install tmux; }
		cp .tmux.conf ~/.tmux.conf
		cp .snapshot ~/.snapshot
	fi
	if [ "$num" == "--plugins" ] || [ "$num" == "--all" ]; then
		git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
		vim +PluginInstall +qall
	fi
	if [ "$num" == "--font" ] || [ "$num" == "--all" ]; then
		xdg-open ubuntu_mono_derivative_powerline.ttf
	fi
done
