# mydotfiles

i am using ubuntu and this repository stores my important dot files present in my home folder


# How to Setup Ubuntu 14.04 

## VBOX-GUEST-ADDITIONS [Reference](https://mylinuxramblings.wordpress.com/2014/12/06/how-to-install-virtualbox-guest-editions-in-ubuntu-server-14-04/):
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

## GIT [Reference](https://git-scm.com/book/en/v2/Getting-Started-Installing-Git)
```
sudo apt-get install git-all
```

## Enable SSH [Reference](http://askubuntu.com/questions/265982/unable-to-start-sshd)
```
sudo apt-get install openssh-server
```
