sudo apt-get update

#http://gazebosim.org/tutorials?tut=install_ubuntu&cat=install
#curl -sSL http://get.gazebosim.org | sh
echo y| sudo apt install gazebo7
echo y| sudo apt install libgazebo7-dev
echo y| sudo apt install libjansson-dev nodejs npm nodejs-legacy libboost-dev imagemagick libtinyxml-dev mercurial cmake build-essential

sudo apt-get -qq install mercurial
sudo apt-get -qq install npm
sudo npm cache clean -f
sudo npm install -g n
sudo n stable

cd ~; hg clone https://bitbucket.org/osrf/gzweb
cd ~/gzweb
hg up gzweb_1.4.0
source /usr/share/gazebo/setup.sh
sudo npm run deploy --- -m
