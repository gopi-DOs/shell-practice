#!/bin/bash

USERID=$(id -u)
# echo "userid is:$USERID"

if [ $USERID -ne 0 ]
then
   echo "please run the script with root privrlages"
    exit 1
fi

 dnf install git -y