#!/usr/bin/env bash

# Install necessary packages
sudo yum update
sudo yum -y groupinstall "Desktop" "Desktop Platform" "X Window System" "Fonts"
sudo yum -y groupinstall "Graphical Administration Tools"
sudo yum -y groupinstall "Internet Browser"
sudo yum -y groupinstall "General Purpose Desktop"
sudo yum -y groupinstall "Graphics Creation Tools"
sudo yum -y groupinstall "Legacy X Window System compatibility"
sudo yum -y install "Git"

# Install PyCharm
sudo wget https://download.jetbrains.com/python/pycharm-community-2017.2.1.tar.gz --no-check-certificate
tar -xzvf pycharm-community-2017.2.1.tar.gz
# cd pycharm-community-2017.2.1/bin

# Start the GUI
# sudo startx
#./pycharm.sh