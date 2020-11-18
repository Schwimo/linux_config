#!/bin/bash

# Install vscode
vscode=`dpkg -s code | grep Package`
if [ "$vscode" == "" ]; then
    wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
    sudo install -o root -g root -m 644 packages.microsoft.gpg /etc/apt/trusted.gpg.d/
    sudo sh -c 'echo "deb [arch=amd64 signed-by=/etc/apt/trusted.gpg.d/packages.microsoft.gpg] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'
    sudo apt-get install apt-transport-https
    sudo apt-get update
    sudo apt-get install code
fi

# Install Git
sudo apt-get install -y git

# Install Tmux
sudo apt-get install -y tmux

# Install Bash-IT
BASH_IT="/home/$USER/.bash_it/"
if [ -d "$BASH_IT" ]; then
    # IF the path already exists, do nothing
    :
else
    # Else install it
    git clone --depth=1 https://github.com/Bash-it/bash-it.git ~/.bash_it
    ~/.bash_it/install.sh
fi

# Clone the linux config repo
git clone https://github.com/Schwimo/linux_config /home/$USER/linux_config

# Exchange the .bashrc
cp /home/$USER/linux_config/configs/.bashrc ~/.bashrc
cp /home/$USER/linux_config/configs/.tmux.conf ~/.tmux.conf
cp -r /home/$USER/linux_config/configs/.tmux ~/.tmux

sudo rm -r /home/$USER/linux_config

# Get github credentials
echo "Enter github username :"
read username
echo "Enter github mail :"
read mail

git config --global user.name $username
git config --global user.email $mail

bash