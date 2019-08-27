#http://gazebosim.org/tutorials?tut=install_ubuntu&cat=install
#curl -sSL http://get.gazebosim.org | sh
sudo apt install gazebo7 libgazebo7-dev
sudo apt install libjansson-dev nodejs npm nodejs-legacy libboost-dev imagemagick libtinyxml-dev mercurial cmake build-essential

sudo apt-get -qq install mercurial
cd ~; hg clone https://bitbucket.org/osrf/gzweb
cd ~/gzweb
hg up gzweb_1.4.0
source /usr/share/gazebo/setup.sh


sudo apt-get -qq install npm
sudo apt-get -qq install libjansson-dev
sudo apt-get -qq install imagemagick
npm run deploy --- -m
