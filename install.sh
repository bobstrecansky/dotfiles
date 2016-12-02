sudo yum -y install vim git zsh cmake
curl -L https://raw.githubusercontent.com/yyuu/pyenv-installer/master/bin/pyenv-installer | bash
curl -L https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh | bash
curl -o ~/.zshrc https://raw.githubusercontent.com/bobstrecansky/dotfiles/master/.zshrc
curl -o ~/.vimrc https://raw.githubusercontent.com/bobstrecansky/dotfiles/master/.vimrc
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
mkdir -p ~/.vim/colors/
cp vim/badwolf.vim ~/.vim/colors/
vim +PluginInstall +qall
