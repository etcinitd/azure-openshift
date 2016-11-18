# Red Hat OpenShift Container Platform on Azure

## SSH Key Generation - Linux/Centos/Fedora
1. Open the Terminal in the Application/Utilities folder.
![Terminal ScreenShot][terminal]
2. Enter the commands:
```bash
mkdir ~/.ssh
chmod 700 ~/.ssh
ssh-keygen -t rsa
```
3. At this point you will be prompted:

```bash
Generating public/private rsa key pair.
Enter file in which to save the key (/home/b/.ssh/id_rsa):
Enter passphrase (empty for no passphrase):
Enter same passphrase again:
Your identification has been saved in /home/b/.ssh/id_rsa.
Your public key has been saved in /home/b/.ssh/id_rsa.pub.
```

Your public and private keys are now available in your home folder under the .ssh directory.


[terminal]:  https://github.com/glennswest/azure-openshift/raw/master/images/terminal.png
