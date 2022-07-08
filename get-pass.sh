#! /bin/bash
#create the salt
pfad=$(cat init.ini)
if [[ $? -ne 0 ]]
then
	echo "please run init.sh"
	exit 1
fi

tuz=`cat ~/.ssh/id_rsa | tr -dc '0-9' | head -c 12`
#Use the salt to unlock the DB pass
gatekeeper=`cat  ~/.ssh/salted | openssl aes-256-cbc -d -a -pass pass:$tuz`
#send it to expect script with the name of the DB entry that is wanted
Returning=$(querydb.sh $gatekeeper $1)

# Parse it output of expect
Pass=$(echo $Returning |awk '{print $2}')
Username=$(echo $Returning |awk '{print $3}')
echo $Pass | pbcopy  # send it to clipboard
echo "$Username" # display the user name
