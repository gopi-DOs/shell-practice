#!/bin/bash

USERID=$(id -u)
# echo "userid is:$USERID"

if [ $USERID -ne 0 ]
then
   echo "please run the script with root privrlages"
    exit 1
fi
  dnf list installed git 

if [ $? -ne 0 ]
then

   echo "Git is not installed, going to install"

    dnf install git -y
else
    echo "Git already install nothig to do"
fi    