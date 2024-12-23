#!/bin/bash
 
 set -ex #setting the automatic exit, if we ger error,set -ex for debug


 failure(){
     echo "failed at: $1:$2"
 }

 trap 'failure "${lineno}" "$bash_command"' ERR
 echo "hello"
 echoooo "hello"
 echo "hello"