#!/bin/bash

user=$(id -u)
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"
Log_folder="/var/log/shellop-log"
script=$(echo $0 | cut -d "." -f1)
log_file="$Log_folder/$script.log"
packages=("mysql" "nginx" "python" "httpd")

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
for package in ${package[@]}
do 
  dnf list installed $package &>>$log_file
  if  [ $? -ne 0 ]
  then
    echo "$package will install soon" | tee -a $log_file 
    dnf install $package -y  &>>$log_file
    VALIDATE $? "$package"
  else 
    echo -e "$package is already installed, $Y nothing to do ...!!$N" | tee -a $log_file 
  fi
done
