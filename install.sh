# Remove vim-minimal garbage to install regular vim
yum -y remove vim-minimal

# Install necessary system packages
yum -y install sudo vim git zsh tmux cmake patch bzip2-devel readline-devel openssl-devel sqlite-devel python-devel python3-devel automake gcc gcc-c++ kernel-devel clang clang-devel tar brightnessctl newsbeuter i3 i3lock 
yum -y groupinstall "Development Tools"

# pyenv
curl -L https://raw.githubusercontent.com/yyuu/pyenv-installer/master/bin/pyenv-installer | bash

# oh-my-zsh
curl -L https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh | bash

# Copy dotfiles
cp vim/.vimrc ~/.vimrc
cp zsh/.zshrc ~/.zshrc
cp i3/config /etc/i3/config
cp i3/i3status.conf /etc/i3status.conf

# vim plugins
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
git clone https://github.com/ctrlpvim/ctrlp.vim.git ~/.vim/bundle/ctrlp.vim
mkdir -p ~/.vim/colors/
cp vim/badwolf.vim ~/.vim/colors/
vim +PluginInstall +qall

# Make Backlight Keys Changeable by a normal user:
sudo chmod 666 /sys/class/leds/smc::kbd_backlight/brightness
# install python environment
PYTHON_CONFIGURE_OPTS="--enable-shared"
echo $PYTHON_CONFIGURE_OPTS
export PYENV_ROOT="$HOME/.pyenv"
eval "$(pyenv init -)"
pyenv install 3.5.2
cp python/.python-version ~/.python-version

cp i3/config /etc/i3/config
cp i3/i3status.conf /etc/i3status.conf
cp i3/style.txt /etc/i3/style.txt

# install YCM
cd ~/.vim/bundle/YouCompleteMe && ./install.py --clang-completer --system-libclang
zsh
