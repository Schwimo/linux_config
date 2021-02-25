#!/bin/bash

# Install Git
apt-get install -y git

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
git clone https://github.com/Schwimo/linux_config /root/linux_config

# Exchange the .bashrc
cp /root/linux_config/configs/.bashrc ~/.bashrc
cp /root/linux_config/configs/.tmux.conf ~/.tmux.conf
cp -r /root/linux_config/configs/.tmux ~/.tmux

rm -r /root/linux_config

bash
