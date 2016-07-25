# mydotfiles

i am using ubuntu and this repository stores my important dot files present in my home folder


# How to Setup Ubuntu 14.04 

## VBOX-GUEST-ADDITIONS ([link](https://mylinuxramblings.wordpress.com/2014/12/06/how-to-install-virtualbox-guest-editions-in-ubuntu-server-14-04/))
1. Update your APT database:  `sudo apt-get update`
2. Install the latest security updates:  `sudo apt-get upgrade`
3. Install required packages:  `sudo apt-get install build-essential module-assistant`
4. Configure your system for building kernel modules:  `sudo m-a prepare`
5. Click on `Insert Guest Additions CD image...` from the `Devices` menu
6. Mount the virtual CD Rom: `sudo mount /dev/cdrom /media/cdrom`
7. Change directory to the virtual CD Rom Drive: `cd /media/cdrom`
8. Install Guest Editions: `sudo ./VBoxLinuxAdditions.run`
9. Restart VM by entering: `sudo reboot`
10. To check that Guest Editions are installed: `lsmod | grep vboxguest`
11. To enable the permission for shared folders: `sudo adduser xxxxxxx vboxsf`

## GIT ([link](https://git-scm.com/book/en/v2/Getting-Started-Installing-Git))
```
sudo apt-get install git-all
```

### Configure git using the below commands
```
git config --global user.name "Rajeshwaran Paulchamy"
git config --global user.email "XXXX@gmail.com"
```

## Enable SSH ([link](http://askubuntu.com/questions/265982/unable-to-start-sshd))
```
sudo apt-get install openssh-server
```

## Install Node.JS ([link](https://codewithintent.com/how-to-install-update-and-remove-node-js-from-linux-or-ubuntu/))
1. Download the latest `tar.gz` from the link [https://nodejs.org/dist/latest/](https://nodejs.org/dist/latest/)
2. Execute the below commands 
```
tar -xf node-vX.X.X-linux-x64.tar.xz
sudo mv node-vX.X.X-linux-x64/bin/* /usr/local/bin/
sudo mv node-vX.X.X-linux-x64/lib/node_modules/ /usr/local/lib/
```
3. Make sure the version of `node` and `npm` using the below commands
```
node -v
npm -v
```
4. To uninstall `node` and `npm` use the below command
```
sudo rm /usr/local/bin/{node,npm}
````

### Configure NPM global package location ([link](https://www.sitepoint.com/beginners-guide-node-package-manager/))
1. Create a directory to store the npm global modules
```
mkdir /home/rajesh/myworks/node_modules_global
```

2. Check the global package location
```
npm config get prefix
```

3. Still we are using the `npm` owned by root, to change it to the new global package location, install `npm` again
```
npm install npm --global
```
4. Finally, we need to add `$HOME/myworks/node_modules_global/bin` to our `$PATH` environment variable (** Note: Use .bashrc it has this line already **)
```
export PATH="$HOME/myworks/node_modules_global/bin:$PATH"
```
