#!/bin/bash


USERID=$(id -u)
R="\e[31m"
G="\e[32m"
N="\e[0m"

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
      echo -e "$2 is...$R  failed $N"
      exit 1
    else 
      echo -e "$2...$G  success $N"
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