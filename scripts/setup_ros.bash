#!/bin/bash

checkCommand () {
    if command -v $1 >/dev/null; then
        : # OK command exists                
    else        
        echo "${1} is not available"
        return 1
    fi
}

installRosMelodic() {
    sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'
    sudo apt-key adv --keyserver 'hkp://keyserver.ubuntu.com:80' --recv-key C1CF6E31E6BADE8868B172B4F42ED6FBAB17C654
    sudo apt-get update
    sudo apt-get install -y ros-melodic-desktop-full
    sudo apt-get install -y ros-melodic-rosbridge-server   
    sudo apt-get install -y ros-melodic-plotjuggler 
    sudo apt-get install -y python3-pip python3-yaml
    sudo apt-get install -y python-catkin-tools
    sudo apt-get install -y python-rosdep
    sudo pip3 install rospkg catkin_pkg

    # Enable resourcing the ROS environment everytime you open a terminal
    echo "source /opt/ros/melodic/setup.bash" >> ~/.bashrc       
}

installRosNoetic() {
    sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'
    sudo apt-key adv --keyserver 'hkp://keyserver.ubuntu.com:80' --recv-key C1CF6E31E6BADE8868B172B4F42ED6FBAB17C654
    sudo apt-get install -y ros-noetic-desktop
    sudo apt-get install -y ros-noetic-rosbridge-server   
    sudo apt-get install -y ros-noetic-plotjuggler ros-noetic-plotjuggler-ros    
    sudo apt-get install -y python3-pip python3-yaml
    sudo apt-get install -y python3-catkin-tools
    sudo apt-get install -y python3-rosdep
    sudo apt-get install -y python3-osrf-pycommon
    
    sudo pip3 install rospkg catkin_pkg
    # Enable resourcing the ROS environment everytime you open a terminal
    echo "source /opt/ros/noetic/setup.bash" >> ~/.bashrc    
}

# Check if ros is already installed
if checkCommand "rosversion"; then    
    
    echo "ROS $(rosversion -d) is already installed on your machine."

else
    
    # Ubuntu 18.04 -> Install ROS Melodic
    if [ $(lsb_release -rs) == "18.04" ]; then
       
       echo "You have Ubuntu 18.04 and therefore ROS melodic will be installed"
       installRosMelodic
       
    # Ubuntu 20.04 -> Install ROS Noetic
    elif [ $(lsb_release -rs) == "20.04" ]; then

        echo "You have Ubuntu 20.04 and therefore ROS noetic will be installed"
        installRosNoetic
    fi
    
    # Execute rosdep only if it was newly installed
    sudo rosdep init
fi

echo "source /home/$USER/dev/linux_config/scripts/extend_env_ros.bash --extend"

# Execute Source 
source ~/.bashrc
