#!/bin/bash
echo "Checking file: $1"
echo "For sum: $2"

SUM=`sha256sum $1 | awk '{print $1}'`
echo "Calculated sum: $SUM";

if [ "$SUM" == "$2" ]
then
	echo -e "OK\n"
else
	echo -e "NOT EQUAL\n"
fi
