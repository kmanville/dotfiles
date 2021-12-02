git submodule init
git submodule update

ln -s `pwd`/gdbinit $HOME/.gdbinit

ln -s `pwd`/zshrc $HOME/.zshrc
ln -s `pwd`/oh-my-zsh/ $HOME/.oh-my-zsh

ln -s `pwd`/gitconfig $HOME/.gitconfig
ln -s `pwd`/tmux.conf $HOME/.tmux.conf

# vim setup
mkdir $HOME/.vim/undo
ln -s `pwd`/vim/ $HOME/.vim
ln -s `pwd`/vim/vimrc $HOME/.vimrc
echo | echo | vim +PluginInstall +qall &> /dev/null

ln -s `pwd`/Xresources $HOME/.Xresources
ln -s `pwd`/Xmodmap $HOME/.Xmodmap
ln -s `pwd`/xinitrc $HOME/.xinitrc

ln -s `pwd`/i3status.conf $HOME/.i3status.conf
mkdir $HOME/.i3 && ln -s `pwd`/i3config ~/.i3/config

ln -s `pwd`/ubersicht/simple-bar $HOME/Library/Application\ Support/Übersicht/widgets/simple-bar
ln -s `pwd`/yabairc $HOME/.yabairc
ln -s `pwd`/skhdrc $HOME/.skhdrc
ln -s `pwd`/simplebarrc $HOME/.simplebarrc

