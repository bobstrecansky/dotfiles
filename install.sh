# Set Hostname
hostnamectl set-hostname shadow

# Install RPM Fusion
sudo dnf install https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm
sudo dnf install https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm

# Install Nvida Driver and Cuda Support
sudo dnf -y install akmod-nvidia
sudo dnf install xorg-x11-drv-nvidia-cuda
sudo grubby --update-kernel=ALL --args='nvidia-drm.modeset=1'
sudo dnf -y install nvidia-xconfig
sudo nvidia-xconfig -a --cool-bits=28 --allow-empty-initial-configuration

# Add Xwrapper.config (for GPU fan control)
sudo echo "#needs_root_rights = auto\nallowed_users = anybody\nneeds_root_rights = yes" > /etc/X11/Xwrapper.config
sudo chmod 2644 /etc/X11/Xwrapper.config

# Disable firewalld & auditd (annoying)
sudo systemctl disable firewalld.service
sudo systemctl disable auditd.service
sudo systemctl disable abrtd.service
sudo systemctl disable cups.service

# Install packages
sudo dnf -y install sudo vim git zsh tmux cmake patch bzip2-devel readline-devel openssl-devel sqlite-devel python-devel python3-devel automake gcc gcc-c++ kernel-devel clang clang-devel tar htop hg

# Install media codecs from RPMFusion
sudo dnf -y install gstreamer1-plugins-{bad-\*,good-\*,base} gstreamer1-plugin-openh264 gstreamer1-libav --exclude=gstreamer1-plugins-bad-free-devel
sudo dnf -y install lame\* --exclude=lame-devel
sudo dnf -y group upgrade --with-optional Multimedia

# Install google chrome
sudo dnf config-manager --set-enabled google-chrome
sudo dnf -y install google-chrome-stable

# setup snapd
sudo dnf install snapd
sudo ln -s /var/lib/snapd/snap /snap

# Install snaps
sudo snap install signal-desktop
sudo snap install spotify
sudo snap install intellij-idea-ultimate --classic
sudo snap install slack --classic
sudo snap install 1password
sudo snap install zoom-client

# Install scaleft
curl -C - https://pkg.scaleft.com/scaleft_yum.repo | sudo tee /etc/yum.repos.d/scaleft.repo
sudo rpm --import https://dist.scaleft.com/pki/scaleft_rpm_key.asc
sudo dnf -y install scaleft-client-tools
sudo dnf -y install scaleft-url-handler

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
echo $PYTHON_CONFIGURE_OPTS
export PYENV_ROOT="$HOME/.pyenv"
eval "$(pyenv init -)"
pyenv install 3.9.1
cp python/.python-version ~/.python-version

# install YCM
cd ~/.vim/bundle/YouCompleteMe && ./install.py --clang-completer --system-libclang
zsh
