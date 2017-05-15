# mydotfiles

i am using ubuntu and this repository stores my important dot files present in my home folder


# Setup guidelines for Ubuntu 14.04 (Node.JS, MongoDB)

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
## Enable VIM
* To install all VIM plugins first you need to install `Vundle` package
* Execute the below command to install `Vundle` package
```
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
```

* Next you need to install the `Vim` packages
* Launch `vim` and run `:PluginInstall`

## Install Node.JS ([link](https://codewithintent.com/how-to-install-update-and-remove-node-js-from-linux-or-ubuntu/))
* Download the latest `tar.gz` from the link [https://nodejs.org/dist/latest/](https://nodejs.org/dist/latest/)
* Execute the below commands 
```
tar -xf node-vX.X.X-linux-x64.tar.xz
sudo mv node-vX.X.X-linux-x64/bin/* /usr/local/bin/
sudo mv node-vX.X.X-linux-x64/lib/node_modules/ /usr/local/lib/
```
* Make sure the version of `node` and `npm` using the below commands
```
node -v
npm -v
```
* To uninstall `node` and `npm` use the below command
```
sudo rm /usr/local/bin/{node,npm}
````

### Configure NPM global package location ([link](https://www.sitepoint.com/beginners-guide-node-package-manager/))
* Create a directory to store the npm global modules
```
mkdir /home/rajesh/myworks/node_modules_global
```
* Check the global package location
```
npm config get prefix
```
* Still we are using the `npm` owned by root, to change it to the new global package location, install `npm` again
```
npm install npm --global
```
* Finally, we need to add `$HOME/myworks/node_modules_global/bin` to our `$PATH` environment variable (** Note: Use .bashrc it has this line already **)
```
export PATH="$HOME/myworks/node_modules_global/bin:$PATH"
```

## Install MongoDB ([link](https://docs.mongodb.com/manual/tutorial/install-mongodb-on-ubuntu/))

```
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv EA312927
echo "deb http://repo.mongodb.org/apt/ubuntu trusty/mongodb-org/3.2 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-3.2.list
sudo apt-get update
sudo apt-get install -y mongodb-org
```
After that, check the running status by executing the below command
```
sudo service mongod start
```

## Configure BABEL and GULP for ES6 support.

### Configure BABEL

* Create a JS project using npm init
```
npm init myproject
cd myproject
```
* Execute the below commands
```
npm install babel babel-cli --save-dev
npm install babel-preset-es2015 --save-dev
npm install babel-plugin-add-module-exports --save-dev
npm install babel-plugin-transform-es2015-modules-amd
```

* Update the below content in to the file "package.json", since babel installed locally, you can't execute the babel command directly in the command prompt, so execute this command through `npm`
```
"scripts": {
	"babel": "babel script.js --out-file script-transpiled.js"
},
```
* Update the below content in to the file ".babelrc", it configures the behaviour of 'babel'
```
.babelrc
{
	"presets": ["es2015"],
	"plugins": [
		"add-module-exports"
	]
}
```
* The below command will start the babel activity
```
npm run babel
```

### Configure Gulp to automate the process.
* Install `gulp` and `gulp-babel` (Gulp plugin for Babel) together locally
```
npm install gulp gulp-babel --save-dev
```

* Update the below content in to the file `gulpfile.js` to automate the Babel task
```
var gulp = require("gulp"),
    babel = require("gulp-babel");

gulp.task("transpile", function(){
    return gulp.src(["script.js"])
        .pipe(babel())
        .pipe(gulp.dest("dist"));
});
```

* Update the below content in to the file `package.json`, since gulp installed locally, you can't execute the `gulp` command directly in the command prompt, so execute this command through `npm`
```
"scripts": {
	"babel": "babel script.js --out-file script-transpiled.js", /* Already added for babel */
	"gulp": "gulp transpile"
},
```
* Run the below command to start the babel polyfill process using gulp.
```
npm run gulp
```

### Install `PM` node process manager
```
sudo npm install -g pm2
```

### Install and Configure `Nginx`
```
sudo apt-get install nginx
```
* Now open the default server block configuration file for editing:
```
sudo vim /etc/nginx/sites-available/default
```
* Delete everything in the file and insert the following configuration. Be sure to substitute your own domain name for the `server_name` directive. Additionally, change the port `8080` if your application is set to listen on a different port:
```
server {
    listen 80;

    server_name example.com;

    location / {
        proxy_pass http://localhost:8080;
        proxy_http_version 1.1;
        proxy_set_header Upgrade $http_upgrade;
        proxy_set_header Connection 'upgrade';
        proxy_set_header Host $host;
        proxy_cache_bypass $http_upgrade;
    }
}
```
* Make sure you didn't introduce any syntax errors by typing:
```
sudo nginx -t
```
* Next, restart Nginx:
```
sudo systemctl restart nginx
```
* Next, permit traffic to Nginx through the firewall, if you have it enabled:
```
sudo ufw allow 'Nginx Full'
```

### DOCKER 

```
$ sudo apt-get install apt-transport-https ca-certificates
$ curl -fsSL https://yum.dockerproject.org/gpg | sudo apt-key add -
$ apt-key fingerprint 58118E89F3A912897C070ADBF76221572C52609D
```

Now create a new apt configuration file /etc/apt/sources.list.d/docker.list and one of below docker

For Ubuntu Xenial 16.04 (LTS)
```
deb https://apt.dockerproject.org/repo ubuntu-xenial main
```
For Ubuntu Wily 15.10
```
deb https://apt.dockerproject.org/repo ubuntu-wily main
```
For Ubuntu Trusty 14.04 (LTS)
```
deb https://apt.dockerproject.org/repo ubuntu-trusty main
```
Start install DOCKER
```
$ sudo apt-get update
$ sudo apt-get install docker-engine
```


# Connect to VPS server from Ubuntu
1. Open PuttyGen (Open in Windows PC)
2. Click Load
3. Load your private key (if it is encrypted private key then it will ask for the password)
4. Go to Conversions->Export OpenSSH and export your private key in the name of 'assetinsight_private'
5. Copy your private key to ~/.ssh/
6. Enter the below commands

```
cd ~/.ssh/
ssh-keygen -e -f assetinsight_private > assetinsight_pub.pub
ssh-keygen -i -f assetinsight_pub.pub > assetinsight.pub
ssh -i assetinsight_private root@xxx.xxx.xxx.xxx -p xxxx
Enter passphrase for key 'assetinsight_private': < ENTER PASSWORD  >
```
### Connect to VPS server using FTP
[Refer this link](https://www.digitalocean.com/community/tutorials/how-to-use-filezilla-to-transfer-and-manage-files-securely-on-your-vps)
