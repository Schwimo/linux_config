#/usr/bin/env bash

cd /home/$USER/phand/python_libs
git clone --depth=1 https://github.com/Bash-it/bash-it.git ~/.bash_it
~/.bash_it/install.sh

# Exchange the .bashrc
cp $1/config/.netrc ~/.netrc
cp $1/config/.smbcredentials ~/.smbcredentials

# Get github credentials
echo "Enter github username :"
read username
echo "Enter github password :"
read -s pass

git config credential.helper store
git config --global user.name username
git config --global user.password pass