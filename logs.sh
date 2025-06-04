#!/bin/bash

user=$(id -u)
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"
Log_folder="/var/log/shellop-log"
script=$(echo $0 | cut -d "." -f1)
log_file="$Log_folder/$script.log"

mkdir -p $Log_folder
echo "script started at :$(date)" | tee -a $log_file 
if [ $user -ne 0 ]
then  
   echo -e "$R error: user doesn't have root accesss:$N" | tee -a $log_file  
   exit 1
else 
   echo "you are running with root access" | tee -a $log_file 
fi
#chekcing the installled pkgs
VALIDATE () {
    if [ $1 -eq 0 ]
    then 
      echo  -e "installing $2 is .. $G suucess $N" | tee -a $log_file 
    else 
      echo  -e "installing $2 is .. $R Failure $N" | tee -a $log_file 
      exit 1
    fi
}
dnf list installed mysql &>>$log_file 
if  [ $? -ne 0 ]
then
    echo "my sql will install soon" | tee -a $log_file 
    dnf install mysql -y  &>>$log_file
    VALIDATE $? "mysql"
else 
    echo -e "mysql is already installed, $Y nothing to do ...!!$N" | tee -a $log_file 
fi
#installing nginx
dnf list installed nginx &>>$log_file 
if  [ $? -ne 0 ]
then
     echo "my nginx wil install soon" | tee -a $log_file 
    dnf install nginx -y  &>>$log_file
    VALIDATE $? "nginx"
else 
    echo -e "nginx alady installed, $Y nothing to do ...!!$N" | tee -a $log_file 
fi
# intsllaing python3
dnf list installed python3 &>>$log_file 
if  [ $? -ne 0 ]
then
     echo "my python3 wil install soon" | tee -a $log_file 
    dnf install python3 -y &>>$log_file 
    VALIDATE $? "python3"
else 
    echo  -e "python3 alrrady instd, $G nothing to do....$N!!" | tee -a $log_file 
fi
