#!/bin/sh
mbr="master"
dbr="dev"

if [ $# -eq 0 ] 
  then
    echo "No arguments supplied"
fi

if [ $# -ne 1 ] 
  then
    echo "Illegal number of arguments"
    exit 1
fi

if [ -z "$1" ]
  then
     echo "Error: Please provide the version tag. Ex: vX.X"
     exit 1
fi

if ! git checkout $mbr
  then
    echo "Error: Switching to master branch failed"
    exit
fi

if ! git merge $dbr
  then
    echo "Error: Merging branch dev to master"
    exit
fi

if ! git tag $1
  then
    echo "Error: Taging the master"
    exit
fi

if ! git checkout $dbr
  then
    echo "Error: Swtiching to dev"
    exit
fi

