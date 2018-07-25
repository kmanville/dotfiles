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
ln -s `pwd`/Xresources ~/.Xresources
ln -s `pwd`/Xmodmap ~/.Xmodmap
ln -s `pwd`/xinitrc ~/.xinitrc
ln -s `pwd`/i3status.conf ~/.i3status.conf
mkdir ~/.i3 && ln -s `pwd`/i3config ~/.i3/config
mkdir ~/.vim/undo
vim +BundleInstall +qall
