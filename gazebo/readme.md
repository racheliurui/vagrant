# Setup Env

Default password is vagrant

```shell
# start the vagrant box locally
cd ~/github
git clone git@github.com:racheliurui/vagrant.git
```

```shell
cd ~/github/vagrant/gazebo
vagrant up
```

```shell
vagrant ssh -- -vvv -X
gzserver --verbose
cd ~/gzweb
npm start
vagrant ssh -- -L 8080:localhost:8080
```

# Enable GUI for ubuntu vagrant

>https://draculaservers.com/tutorials/install-x2go-ubuntu-remote-desktop/

* Tips with X2Go Client
    * When create the session using X2Go Client use 127.0.0.1 as hostname (to match the certificate)
    * Make sure XFCE is selected as "session type"


# Clean up Env

```bash
# Reprovision
vagrant reload --provision
```

```shell
cd ~/github/vagrant/gazebo
vagrant halt
vagrant destroy --force
rm -rf .vagrant
rm -rf *.log
```


# Reference

* Ubuntu installation guideline
>
http://gazebosim.org/tutorials?tut=install_ubuntu&cat=install#InstallGazebousingUbuntupackages
ubuntu/xenial64
