#!/bin/bash

user=$(id -u)

if [ $user -eq 0 ]
then 
   echo " user have root accesss:"
dnf list installed mysql
if  [ $? -ne 0 ]
then
     echo "my sql will intsall soon"
    dnf install mysql -y
    if [ $? -eq 0 ]
    then 
      echo "mysql is already intsalled - suucess"
    else 
      echo "mysql is already intsalled - fail"
      exit 1
    fi
else 
    echo "mysql is already intsalled, nothing to do ...!!"
fi
else 
    echo " user doesnt hjave root accesss:"
    exit 1
fi
# dnf install mysql -y
# if [ $? -eq 0 ]
# then 
#     echo "mysql is installed...hurray"
# else 
#     echo "already installed"
# fi

