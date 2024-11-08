#!/bin/bash

echo "all variables passed to the script: $@"
echo "number of variables passed: $#"
echo "Script name: $0"
echo "current directory: $PWD"
echo "home directory: $HOME"
echo "PID of the script excution: $$"

sleep 100 

echo :PID of last excution: $!"