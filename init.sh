#! /bin/bash
echo 'enter absolute path of Keepass database file'
read pfad
echo $pfad > init.ini

echo "please enter Keepass DB password"
read keepasspwd
echo "${keepasspwd}" | openssl aes-256-cbc -a -pass pass:$tuz > ~/.ssh/salted

