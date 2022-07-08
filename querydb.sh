#!/usr/bin/expect
log_user 0
# set the variables Pimn to unlock Entity to get the required data
set Pin [lindex $argv 0 ]
set Entity [lindex $argv 1] 
#call the DB
spawn /usr/local/bin/keepassxc-cli show -s -a Password -a UserName /Users/can/Documents/Conciso_P_DB.kdbx $Entity
expect "Conciso_P_DB.kdbx: " 
send "$Pin\r"
interact
