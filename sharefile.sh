#!/bin/bash

file=$1
port=$2

if [[ -z "${port}" ]]; then
    port=8080;
fi

if [[ -f $file ]]; then
	echo "FILE: $file";
	echo "PORT: $port";
	{ echo -ne "HTTP/1.0 200 OK\r\nContent-Length: $(wc -c <$file)\r\n\r\n"; cat $file; } | nc -l $port;
else
	echo "Missing file or file doesn't exist";
	exit;
fi

