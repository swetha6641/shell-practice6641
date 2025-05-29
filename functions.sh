#!/bin/bash

user=$(id -u)

if [ $user -eq 0 ]
then 
   echo " user have root accesss:"
#chekcing the installled pkgs
VALIDATE () {
    if [ $1-eq 0 ]
    then 
      echo "$2  already intsalled - suucess"
    else 
      echo "$2  already intsalled - fail"
      exit 1
    fi
}
dnf list installed mysql
if  [ $? -ne 0 ]
then
     echo "my sql will intsall soon"
    dnf install mysql -y
    VALIDATE ()
else 
    echo "mysql is already intsalled, nothing to do ...!!"
fi
#installing nginx
dnf list installed nginx
if  [ $? -ne 0 ]
then
     echo "my nginx wil install soon"
    dnf install nginx -y
    VALIDATE ()
else 
    echo "nginx alady intsalled, nothing to do ...!!"
fi
# intsllaing python3
dnf list installed python3
if  [ $? -ne 0 ]
then
     echo "my python3 wil install soon"
    dnf install python3 -y
    validate ()
else 
    echo "python3 alrrady instd, nothing to do ...!!"
fi
else 
    echo " user doesnt have root accesss:"
    exit 1
fi

