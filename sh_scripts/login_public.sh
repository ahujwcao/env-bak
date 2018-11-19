#! /usr/bin/expect

spawn ssh ubuntu@127.0.0.1 -p 9527
expect "*password:*"
send "test\r"
interact
