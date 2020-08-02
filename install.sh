#!/bin/bash

#wget https://www.realvnc.com/download/file/vnc.files/VNC-Server-6.6.0-Linux-x64.deb
#sudo dpkg -i VNC-Server-6.6.0-Linux-x64.deb

wget https://www.realvnc.com/download/file/viewer.files/VNC-Viewer-6.20.113-Linux-x64.deb
sudo dpkg -i VNC-Viewer-6.20.113-Linux-x64.deb

wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add -
echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list

wget https://d2t3ff60b2tol4.cloudfront.net/builds/insync_3.1.3.40790-bionic_amd64.deb
sudo dpkg -i insync_3.1.3.40790-bionic_amd64.deb

sudo apt-add-repository ppa:ansible/ansible

sudo apt-get update

# Install node
curl -sL https://deb.nodesource.com/setup_14.x | sudo -E bash -
sudo apt-get install nodejs -y
node -v 
npm -v

# Install requirements.
sudo apt install -y \
    terminator \
    gparted \
    synaptic \
    zsh \
    htop \
    apt-transport-https \
    ca-certificates \
    curl \
    software-properties-common \
    meld \
    git-cola \    
    vlc \
    npm \
    gimp \
    flameshot \
    ctags \
    php-cli php-mbstring php-xml \
    gconf2 gconf-service gvfs-bin \
    sublime-text \
    snapd \
    ansible \
    openjdk-8-jdk

# git reg
#git config --global user.email "you@example.com"
#git config --global user.name "Your Name"

# dbeavere
#wget -O - https://dbeaver.io/debs/dbeaver.gpg.key | sudo apt-key add -
#echo "deb https://dbeaver.io/debs/dbeaver-ce /" | sudo tee /etc/apt/sources.list.d/dbeaver.list
#sudo apt update
#sudo apt install dbeaver-ce

# Install chrome.
if ! [ -x "$(command -v google-chrome)" ]; then
  echo "Installing chrome ..."
  wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
  sudo dpkg -i google-chrome-stable_current_amd64.deb
  rm google-chrome-stable_current_amd64.deb
fi

# Install composer.
sudo curl -s https://getcomposer.org/installer | php
sudo mv composer.phar /usr/local/bin/composer

# Copy over terminator config.
cp -R ./includes/terminator ~/.config/

# Install powerline font.
./includes/powerline/install.sh

# Install docker.
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"

sudo apt-get update
sudo apt-get install docker-ce -y

docker --version

#sudo mkdir /etc/systemd/system/docker.service.d
#sudo cp ./includes/10_docker_proxy.conf /etc/systemd/system/docker.service.d/

# Install docker-compose.
sudo curl -L "https://github.com/docker/compose/releases/download/1.23.1/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
docker-compose --version

sudo groupadd docker
sudo gpasswd -a tim docker

# Install atom code editor.
#wget -O atom-amd64.deb https://atom.io/download/deb
#sudo dpkg -i atom-amd64.deb
#rm atom-amd64.deb
#cd ~/Projects && git clone ssh://git@uk-gitlab.almuk.santanderuk.corp:2220/open-banking/api-security/labs.git
#rm -rf ~/.atom
#ln -s ~/Projects/labs/labs/atom_settings ~/.atom

# Install node sass so auto compiles from atom.
#sudo npm install node-sass -g

# Install drupal coding standards and phpcs so code reviewed from atom.
#composer global require drupal/coder
#sudo rm /usr/local/bin/phpcs
#sudo ln -s ~/.config/composer/vendor/bin/phpcs /usr/local/bin
#phpcs --config-set installed_paths ~/.config/composer/vendor/drupal/coder/coder_sniffer

# Install oh my zsh.
NO_INTERACTIVE=true sh -c "$(curl -fsSL https://raw.githubusercontent.com/subtlepseudonym/oh-my-zsh/feature/install-noninteractive/tools/install.sh)"

# This will switch terminal and halt this script ^^ so need to run these again, just
# comment out the above line after run the first time.
chsh -s $(which zsh)

#if host is thor or loki install private repo