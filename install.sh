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
# Enable emoji with this document: https://opensource.com/article/19/10/how-type-emoji-linux
sudo dnf -y install sudo vim git zsh tmux cmake patch bzip2-devel readline-devel openssl-devel sqlite-devel python-devel python3-devel automake gcc gcc-c++ kernel-devel clang clang-devel tar htop hg gnome-tweaks emoji-picker wget jq barrier

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

# Install hey (load tester)
wget https://hey-release.s3.us-east-2.amazonaws.com/hey_linux_amd64
sudo mv hey_linux_amd64 /usr/local/bin/hey
sudo chmod +x /usr/local/bin/hey

# Install stern (k8s log streamer)
URL=$(curl -L -s https://api.github.com/repos/wercker/stern/releases/latest | grep -o -E "https://github.com/wercker/stern/releases/download/(.*)_linux_amd64")
wget $URL
chmod +x stern_linux_amd64
sudo mv stern_linux_amd64 /usr/local/bin/stern

# Install kubectl
sudo cat <<EOF > /etc/yum.repos.d/kubernetes.repo
[kubernetes]
name=Kubernetes
baseurl=https://packages.cloud.google.com/yum/repos/kubernetes-el7-x86_64
enabled=1
gpgcheck=1
repo_gpgcheck=1
gpgkey=https://packages.cloud.google.com/yum/doc/yum-key.gpg https://packages.cloud.google.com/yum/doc/rpm-package-key.gpg
EOF
dnf install -y kubectl

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
