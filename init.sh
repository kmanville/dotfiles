git submodule init
git submodule update
ln -s `pwd`/gdbinit ~/.gdbinit
ln -s `pwd`/gitconfig ~/.gitconfig
ln -s `pwd`/oh-my-zsh/ ~/.oh-my-zsh
ln -s `pwd`/slate ~/.slate
ln -s `pwd`/tmux.conf ~/.tmux.conf
ln -s `pwd`/vim/ ~/.vim
ln -s `pwd`/vim/vimrc ~/.vimrc
ln -s `pwd`/zshrc ~/.zshrc
mkdir ~/.vim/undo
vim +BundleInstall +qall
