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
    if [ $? -ne 0 ]
    then
       echo "Git installation is not sucess check it "
       exit 1
    else 
        echo "Git installation is  suscess"
    fi       
else
    echo "Git already install nothig to do"
fi    

 dnf list installed mysql

 if[ $? -ne 0 ]
 then
   echo "mysql is not installed going to install it"
   dnf install mysqlll -y
   if[ $? -ne 0 ]
    then 
    echo "mysql is not installation is not sucess check it"
    exit 1
else
    echo "mysql is sucess"
    fi
 else
   echo "mysql installed nothing to do"
fi  