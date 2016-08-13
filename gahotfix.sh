#!/bin/sh
mbr="master"
dbr="dev"

if [ $# -eq 0 ] 
  then
    echo "No arguments supplied"
    exit 1
fi

if [ $# -ne 1 ] 
  then
    echo "Illegal number of arguments"
    exit 1
fi

if [ -z "$1" ]
  then
     echo "Please provide the git branch name"
     exit 1
fi

#================ Dev branch

if ! git checkout $dbr
  then
    echo "Error changing to branch $dbr"
    exit
fi

if ! git status
  then
    echo "showing Status for branch $1 failed"
    exit
fi

#git merge "$1";
if ! git merge "$1"
  then
    echo "Error merging $1 to $dbr"
    exit
fi

#================ Master branch

if ! git checkout $mbr
  then
    echo "Error changing to branch $mbr"
    exit
fi

if ! git status
  then
    echo "showing Status for branch $1 failed"
    exit
fi

#git merge "$1";
if ! git merge "$1"
  then
    echo "Error merging $1 to $mbr"
    exit
fi

if ! git tag "$1"
  then
    echo "Error taging branch $mbr"
    exit
fi


#remove branch
if ! git branch -d "$1"
  then
    echo "Error deleting branch $1 to master"
    exit
fi
