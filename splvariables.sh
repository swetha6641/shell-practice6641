#!/bin/bash

echo "allvariables psssed to script:" $@
echo "number of varaiables" $#
echo "script name" $0
echo "present working dir:" $pwd
echo "ur home dir " $home
echo "user name"$user
sleep 10 &
echo "PID of last cmd" $!



