sudo apt-get -y install zsh build-essential cmake
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
curl -L https://raw.githubusercontent.com/yyuu/pyenv-installer/master/bin/pyenv-installer | bash
curl -o $HOME/.zshrc https://raw.githubusercontent.com/bobstrecansky/dotfiles/master/.zshrc
curl -o $HOME/.vimrc https://raw.githubusercontent.com/bobstrecansky/dotfiles/master/.vimrc
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
mkdir -p $HOME/.vim/colors/
curl -o $HOME/.vim/colors/ http://bitbucket.org/sjl/badwolf/raw/tip/colors/badwolf.vim
vim +PluginInstall +qall
