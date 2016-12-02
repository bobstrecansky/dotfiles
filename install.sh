yum -y install vim git zsh tmux cmake patch bzip2-devel readline-devel openssl-devel sqlite-devel python-devel
yum -y groupinstall "Development Tools"
curl -L https://raw.githubusercontent.com/yyuu/pyenv-installer/master/bin/pyenv-installer | bash
curl -L https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh | bash
cp vim/.vimrc ~/.vimrc
cp zsh/.zshrc ~/.zshrc
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
git clone https://github.com/ctrlpvim/ctrlp.vim.git ~/.vim/bundle/ctrlp.vim

mkdir -p ~/.vim/colors/
cp vim/badwolf.vim ~/.vim/colors/
vim +PluginInstall +qall
pyenv install 3.5.2
cp python/.python-version ~/.python-version
cd ~/.vim/bundle/YouCompleteMe && ./install.py --clang-completer
