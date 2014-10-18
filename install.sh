cp -rf ./.vim ~/
cp .vimrc ~/.vimrc
cp .bash_aliases ~/.bash_aliases
cp .zshrc ~/.zshrc
cp .tmux.conf ~/.tmux.conf
cp .bashrc ~/.bashrc
git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall
