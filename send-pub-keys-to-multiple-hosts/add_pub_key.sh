#!/usr/bin/expect

set f [open "/home/jenkins/.ssh/hosts.txt"]
set hosts [split [read $f] "\n"]
close $f

foreach host $hosts {
    spawn ssh-copy-id -i /home/jenkins/.ssh/id_rsa.pub jenkins@$host
    expect {
        "continue" { send "yes\n"; exp_continue }
        "assword" { send "******\n"; exp_continue}
    }        
}}        
}