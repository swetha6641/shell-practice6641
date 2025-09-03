#!/bin/bash

echo "allvariables psssed to script:$@ "
echo "number of varaiables $# "
echo "script name $0"
echo "present working dir: $PWD"
echo "ur home dir  $HOME"
echo "user name $USER"
sleep 10 &
echo "PID of last cmd $!"
echo "PID of current $$"
echo "first arugument : $1"

