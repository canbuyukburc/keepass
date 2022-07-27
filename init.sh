#! /bin/bash
echo 'enter absolute path of Keepass database file'
read pfad
echo $pfad > init.ini

echo "please enter Keepass DB password"
read keepasspwd
#echo "${keepasspwd}" | openssl aes-256-cbc -a -pass pass:$tuz > ~/.ssh/salted
echo "${keepasspwd}" | openssl aes-256-cbc -md sha512 -pbkdf2 -iter 100000 -a -pass pass:$tuz > ~/.ssh/salted

