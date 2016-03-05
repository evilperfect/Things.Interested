#!/bin/bash
#
#   Description: Execute 'git pull' command for every .git repositories under one directory '/cygdrive/d/open-src'
#   How to use : Put all git repositories in directory '/cygdrive/d/open-src', 
#                and put this script anywhere you want and execute it. 

dir="/cygdrive/d/open-src"
pushd $dir

arr=`ls ${dir}`

echo -e "\033[31m  ready for git pull for all .git!\n \033[0m"

for i in $arr
do
  if [ -d $i ]
  then
    cd $i
	cmd='git pull origin master'
    echo -e "\033[31m  $cmd ${dir}"/$i.git" \033[0m"
	eval $cmd
    cd ..
  fi
done


echo -e "\033[31m  \n end for git pull for all .git! \033[0m"

popd
