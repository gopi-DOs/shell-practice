#!/bin/bash

USERID=$(id -u)
# echo "userid is:$USERID"

if [ $userid -ne 0 ]
then
 echo "please run the script with root privrlages"
 fi

 dnf install git -y