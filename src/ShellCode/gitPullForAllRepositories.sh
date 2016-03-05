#!/bin/bash
#
#   Description: Execute 'git pull' command for every .git repositories under one directory '/cygdrive/d/open-src'
#   How to use : Put all git repositories in directory '/cygdrive/d/open-src', 
#                and put this script under the directory and execute it. 

dir="/cygdrive/d/open-src"
arr=`ls ${dir}`

echo -e "\033[31m  ready for git pull for all .git! \033[0m"

for i in $arr
do
  if [ -d $i ]
  then
    cd $i
	cmd='git pull origin master'
    echo -e "\033[31m  $cmd ${dir}"/$i.git" \033[0m"
    git pull origin master
    cd ..
  fi
done


echo -e "\033[31m  end for git pull for all .git! \033[0m"
