#! /bin/bash
pfad=$(cat init.ini)
if [[ $? -ne 0 ]]
then
        echo "please run init.sh"
        exit 1
fi
#create the salt
tuz=`cat ~/.ssh/id_rsa | tr -dc '0-9' | head -c 12`
#Use the salt to unlock the DB pass
gatekeeper=`cat  ~/.ssh/salted | openssl aes-256-cbc -d -a -pass pass:$tuz`
#List the contents of the db
echo "$tuz"
echo "gatekeeper = $gatekeeper"
echo $gatekeeper | keepassxc-cli ls ${pfad}

