
* [Core Linux config installation](#Core-Linux-config-script)
* [ROS setup script](#ROS-setup-script)
* [Setup the BionicSoftHand](#Setup-BionicSoftHand)
<br></br>

# Core Linux config script

Execute the following command to download and start the shell script:
```
bash <(wget -qO- https://raw.githubusercontent.com/Schwimo/linux_config/master/scripts/setup_linux_env.bash)
```

This will execute the following steps:
1. Check if vscode is installed and install accordingly
2. Install git
3. Setup [bash-it](https://github.com/Bash-it/bash-it); nice theme for the terminal
4. Adapt the .bashrc in your home directory
5. Add tmux
6. Basic git setup (username, mail)
    
# ROS setup script

Execute the following command to download and start the shell script:
```
bash <(wget -qO- https://raw.githubusercontent.com/Schwimo/linux_config/master/scripts/setup_ros.bash)
```

This will execute the following steps:
1. Check if ROS is already installed
2. Check Ubuntu Version
    * On 18.04 install ROS melodic
    * On 20.04 install ROS noetic
3. Install other ROS tools like the webbridge
4. Source your ROS distro

# Setup BionicSoftHand with ROS

Execute the following command to download and start the shell script:
```
bash <(wget -qO- https://raw.githubusercontent.com/Schwimo/linux_config/master/scripts/setup_phand.bash)
```

This will execute the following steps:
1. Ask if you want to install the corresponding ROS environment also
    * If yes, execute the [ROS setup script](#Ros-setup-script)
2. Create the directories for the ROS workspace and the python libraries
3. Clone all related repositories
4. Install the python libraries
5. Execute rosdep to install the ROS dependencies
6. Build & source the phand ROS environment
