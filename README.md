## Basic Bash and expect scripting to Get passwords from KeepassXC

It uses the local Keepass Database and keepassXC-Cli to query the DB on MAC OS X.

## Requirements

1. You should have **KeepassXC** installed.
2. You should have be using **MACOSX**.
3. You should set the **PATH** environment to use the scripts.
4. You should create the first salted file with keepass.db password.
---
## Create first salted file 
tuz=`cat ~/.ssh/id_rsa | tr -dc '0-9' | head -c 12`
echo '<keepass password>' | openssl aes-256-cbc -a -pass pass:$tuz > ~/.ssh/salted


## Basic usage

1. on the basc CLI first query DB list
    $ list-pass.sh
Enter password to unlock /Users/can/Documents/Conciso_P_DB.kdbx:
Samsung
MSAccount
Wireless
Clockify
youtube
CloudAcademy
AppleID
Recycle Bin/

2. after learning the name of the DB Entry we can ask for password and user name.
$ get-pass.sh CloudAcademy
<username>
The Password is already copied to **Clipboard**


---

##  Questions : can.buyukburc@conciso.de
