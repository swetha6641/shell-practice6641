#!/bin/bash

user=$(id -u)

if [ $user -eq 0 ]
then 
   echo " user have root accesss:"
else 
    echo " user doesnt hjave root accesss:"
fi