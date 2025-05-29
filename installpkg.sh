#!/bin/bash

user=$(id -u)

if [ $user -eq 0 ]
then 
   echo " user have root accesss:"
else 
    echo " user doesnt hjave root accesss:"
    exit 1
fi
dnf install mysql -y
if [ $? -eq 0 ]
then 
    echo "mysql is installed...hurray"
else 
    echo "already installed"
fi

