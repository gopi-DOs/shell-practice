#!/bin/bash

# for i in {0..10}
# do 
#   echo $i 
# done



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
  # sh 14-loops.sh git mysql postfix ngnix 

  for package in $@ # $@ refers to all arguments passed to it 

  do 
    dnf list installed $package 
    if [ $? -ne 0 ]
    then 
       echo "$Pacakge is not installed insatll it "
       dnf install $package -y 
       VALIDATE $? "Installing $package"
    else
        echo "$package is already insatalled nothing to do "
    fi    
  done    