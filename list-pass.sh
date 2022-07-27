#!/bin/bash
#get the path 
pfad=$(cat init.ini|head -1)
if [[ $? -ne 0 ]]
then
   echo "please run init.sh"
   exit 1
fi

#get the version of OpenSSL
Version=$(cat init.ini |tail -1)
if [ $Version == "111" ]
then
   #create the salt
   tuz=`cat ~/.ssh/id_rsa | tr -dc '0-9' | head -c 16`

   #Use the salt to unlock the DB pass
   gatekeeper=`cat  ~/.ssh/salted | openssl enc -aes256 -pbkdf2 -S ${tuz} -d -pass pass:`
fi


if [ $Version == "110" ]
then

   #create the salt
   tuz=`cat ~/.ssh/id_rsa | tr -dc '0-9' | head -c 16`

   #Use the salt to unlock the DB pass
   gatekeeper=`cat  ~/.ssh/salted | openssl aes-256-cbc -d -a -pass pass:$tuz`

fi

#List the contents of the db
#echo "$tuz"
#echo "gatekeeper = $gatekeeper"
echo $gatekeeper | keepassxc-cli ls ${pfad}

