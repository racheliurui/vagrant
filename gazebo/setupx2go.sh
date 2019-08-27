# install x2go
# https://draculaservers.com/tutorials/install-x2go-ubuntu-remote-desktop/
sudo apt-get install software-properties-common
sudo add-apt-repository ppa:x2go/stable
sudo apt-get update
sudo apt-get -qq install x2goserver x2goserver-xsession

#Install Your Preferred Desktop Environment
sudo apt-get -qq install xfce4
sudo apt-get -qq install lxde
sudo apt-get -qq install mate-core mate-desktop-environment mate-notification-daemon
