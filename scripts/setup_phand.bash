echo "Installing the BionicSoftHand 2.0 python libraries and the ROS workspace"
echo "Creating the directories under /home/" + $USER

# Create the directories
mkdir -p /home/$USER/dev/phand/phand_ws/src
mkdir -p /home/$USER/dev/phand/python_libs

# Change directory
cd /home/$USER/dev/phand/python_libs

# Clone the relevant python library repositories
git clone https://github.com/Schwimo/bionic-message-tools
git clone https://github.com/Schwimo/bionic-pid-control
git clone https://github.com/Schwimo/bionic-dhcp
git clone https://github.com/Schwimo/phand-python-libs

# install the python libraries
pip3 install --editable /home/$USER/dev/phand/python_libs/bionic-dhcp
pip3 install --editable /home/$USER/dev/phand/python_libs/bionic-pid-control
pip3 install --editable /home/$USER/dev/phand/python_libs/bionic-message-tools
pip3 install --editable /home/$USER/dev/phand/python_libs/phand-python-libs

# Change directory and clone the ROS repository
cd /home/$USER/dev/phand/phand_ws/src
git clone https://github.com/Schwimo/phand-ros
cd /home/$USER/dev/phand/phand_ws/

rosdep update
rosdep install --from-paths src --ignore-src -r -y

catkin build

echo "source /home/$USER/dev/phand/phand_ws/devel/setup.bash" >> ~/.bashrc
bash