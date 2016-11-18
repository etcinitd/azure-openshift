In Windows, use PuTTYgen to generate your public and private keys.

1. Install PuTTY - [PuTTY](http://www.chiark.greenend.org.uk/~sgtatham/putty/download.html)
2. Launch PuTTYgen, and press the Generate Button. This will generate the key.
![PuttyGen Screenshot][PuTTYgen]


Enter a unique key passphrase in the Key passphrase and Confirm passphrase fields. For additional information about using passphrases, see Log in with a SSH Private Key on Windows.
Save the public and private keys by clicking the Save public key and Save private key buttons.
From the Public key for pasting into OpenSSH authorized_keys file field at the top of the window, copy all the text (starting with ssh-rsa) to your clipboard by pressing Ctrl-C. You need this key available on your clipboard to paste either into the public key tool in the Control Panel or directly into the authorized keys on your cloud server.


[PuTTYgen]: https://github.com/glennswest/azure-openshift/raw/master/images/puttygen.png
