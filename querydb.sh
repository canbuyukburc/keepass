#!/usr/bin/expect
log_user 0
pfad=$(cat init.ini)
if [[ $? -ne 0 ]]
then
        echo "please run init.sh"
        exit 1
fi
# set the variables Pimn to unlock Entity to get the required data
set Pin [lindex $argv 0 ]
set Entity [lindex $argv 1] 
#call the DB
spawn /usr/local/bin/keepassxc-cli show -s -a Password -a UserName ${pfad} $Entity
expect ": " 
send "$Pin\r"
interact
