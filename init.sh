#! /bin/bash
echo 'enter absolute path of Keepass database file'
read pfad


#Discover OpenSSL version
Version=$(openssl version |awk '{print $2}'|tr -dc '0-9')
if [ $Version == "111" ]
then 
  echo "version is 111"
fi
if [ $Version == "110" ]
then 
  echo "version is 110"
fi
if [ $Version != "111" ] && [ $Version != "110" ]
then
  echo "no version is found "
  exit 1 
fi

tuz=$(cat ~/.ssh/id_rsa|tr -dc '0-9'|head -c 16)

echo $pfad > init.ini
echo $Version >> init.ini

echo "please enter Keepass DB password"
read keepasspwd
if [ $Version == "110" ]
then
  echo "${keepasspwd}" | openssl aes-256-cbc -a -pass pass:$tuz > ~/.ssh/salted
else
  echo "${keepasspwd}" | openssl enc -aes256 -pbkdf2 -S ${tuz} -pass pass: > ~/.ssh/salted
fi



