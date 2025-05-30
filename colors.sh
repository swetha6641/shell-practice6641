#!/bin/bash

user=$(id -u)
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"


if [ $user -eq 0 ]
then 
   echo " user have root accesss:"
#chekcing the installled pkgs
VALIDATE () {
    if [ $1-eq 0 ]
    then 
      echo -e "$2  already installed - $G Success $N"
    else 
      echo -e "$2  already installed - $R Failure $N"
      exit 1
    fi
}
dnf list installed mysql
if  [ $? -ne 0 ]
then
     echo -e "$Y my sql will intsall soon $N "
    dnf install mysql -y
    VALIDATE $? "mysql"
else 
    echo -e " Nothing to do...$Y MYSQL installed already $N"
fi
#installing nginx
dnf list installed nginx
if  [ $? -ne 0 ]
then
     echo -e "$Y NGINGX Will install soon $N "
    dnf install nginx -y
    VALIDATE $? "nginx"
else 
     echo -e " Nothing to do...$Y nginx installed already $N"
fi
# intsllaing python3
dnf list installed python3
if  [ $? -ne 0 ]
then
     echo "my python3 wil install soon"
    dnf install python3 -y
    VALIDATE $? "python3"
else 
    echo -e "Nothing to do....$Y python3 already installed $N "
fi
else 
    echo -e " $R user not having root access, please run with root $N"
    exit 1
fi

