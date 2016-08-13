#!/bin/bash

ip=`curl -s --socks5 127.0.0.1:9050 http://checkip.amazonaws.com`; 
echo "  IP: $ip";
name=`host $ip | grep -oE "[^' ']+$"`;
echo "NAME: $name";
IFS=',' read -ra geo <<< `curl -s --socks5 127.0.0.1:9050 freegeoip.net/csv/$ip`
geo=${geo[@]:1}
echo "FROM: ${geo}"
# echo "FROM: ${geo[2]}(${geo[1]}) ${geo[4]}(${geo[3]}) ${geo[5]} ${geo[6]} ${geo[7]} ${geo[8]} ${geo[9]} ${geo[10]}" 
 

