#!/bin/bash

LOGS_FOLDER="/var/log/shell-practice"
SCRIPT_NAME=$(echo $0 | cut -d "." -f1)
TIMESTAMP=$(date +%Y-%m-%d-%H-%M-%S)
LOG_FILE="$LOGS_FOLDER/$SCRIPT_NAME-$TIMESTAMP.log"
mkdir -p $LOGS_FOLDER

USERID=$(id -u)
R="\e[31m"
G="\e[32m"
N="\e[0m"
Y="\e[33m"

CHECK_ROOT(){
   if [ $USERID -ne 0 ]
   then
        echo -e "$R please run the script with root privrlages $N"  | tee -a $LOG_FILE
        exit 1
    fi
}

VALIDATE(){
    if [ $1 -ne 0 ]
    then
      echo -e "$2 is...$R  failed $N"  | tee -a $LOG_FILE
      exit 1
    else 
      echo -e "$2...$G  success $N"  | tee -a $LOG_FILE
      fi 
}
USAGE(){
    echo -e "$R USAGE:: $N sudo sh 16-redirectors.sh package1 package2 ..." | 
    exit 1
}
echo "script started executing at: $(date)" | tee -a $LOG_FILE
CHECK_ROOT 
  # sh 14-loops.sh git mysql postfix ngnix 

if [ $# -eq 0 ]
then
   USAGE 
fi 

  for package in $@ # $@ refers to all arguments passed to it 

  do 
    dnf list installed $package &>>$LOG_FILE
    if [ $? -ne 0 ]
    then 
       echo "$Pacakge is not installed insatll it " | tee -a $LOG_FILE
       dnf install $package -y &>>$LOG_FILE
       VALIDATE $? "Installing $package"
    else
        echo -e  "$package is already $Y insatalled nothing to do $N" | tee -a $LOG_FILE
    fi    
  done 