#!/bin/bash

# Create a custom MOTD
MOTD_TEXT=`cat <<__MOTD__
#########################

 WELCOME!


 This system has been customized:
 - installed Python 'pip' and 'virtualenv'


 ENJOY!

#########################

__MOTD__
`

echo "${MOTD_TEXT}" > /etc/motd

#--

# Install Vim
yum -y install vim-enhanced

# Install some Python addons (not sure if this is required)
yum -y install python-py.noarch

# Install Python 'pip' utility
wget --no-check-certificate -O /vagrant/get-pip.py https://bootstrap.pypa.io/get-pip.py
chmod +x /vagrant/get-pip.py

# Install Python 'virtualenv'
pip install virtualenv

# EOF
