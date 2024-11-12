#!/bin/bash

USERID=$(id -u)
CHECK_ROOT(){
if [ $USERID -ne 0 ]
then
   echo "please run the script with root privrlages"
    exit 1
fi
}
VALIDATE(){
    if [ $1 -ne 0 ]
    then
      echo "$2 is failed"
      exit 1
    else 
      echo "$2 is sucess"
fi 
}
CHECK_ROOT
  dnf list installed git 

if [ $? -ne 0 ]
then

   echo "Git is not installed, going to install"

    dnf install git -y
    VALIDATE $? "Insatlling git"
         
else
    echo "Git already install nothig to do"
fi    

   dnf list installed mysql

 if [ $? -ne 0 ]
 then
   echo "mysql is not installed going to install it"
   dnf install mysql -y
    VALIDATE $? "Insatlling mysql"
 else
   echo "mysql installed nothing to do"
fi  