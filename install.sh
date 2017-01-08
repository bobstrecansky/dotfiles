# Install Dependencies                                                                                                                                                                                                                                                                                                                                                      
# Remove vim-minimal garbage to install regular vim
yum -y remove vim-minimal

# Install necessary system packages
yum -y install sudo vim git zsh tmux cmake patch bzip2-devel readline-devel openssl-devel sqlite-devel python-devel python3-devel automake gcc gcc-c++ kernel-devel clang clang-devel tar
yum -y groupinstall "Development Tools"

# pyenv
curl -L https://raw.githubusercontent.com/yyuu/pyenv-installer/master/bin/pyenv-installer | bash

# oh-my-zsh
curl -L https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh | bash

# Copy dotfiles
cp vim/.vimrc ~/.vimrc
cp zsh/.zshrc ~/.zshrc

# vim plugins
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
git clone https://github.com/ctrlpvim/ctrlp.vim.git ~/.vim/bundle/ctrlp.vim
mkdir -p ~/.vim/colors/
cp vim/badwolf.vim ~/.vim/colors/
vim +PluginInstall +qall

# install python environment
PYTHON_CONFIGURE_OPTS="--enable-shared"
pyenv install 3.5.2
cp python/.python-version ~/.python-version

# install YCM
cd ~/.vim/bundle/YouCompleteMe && ./install.py --clang-completer --system-libclang
zsh
