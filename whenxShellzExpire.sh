#!/bin/bash

status=`ps -efww | grep -w "notify.py" | grep -v grep | grep -v $$ | awk '{ print $2 }'`
if [ ! -z "$status" ]; then
	exit 1;
fi

hours=`curl -s https://www.xshellz.com/api/plain/downtempo/shellexpires`
# FIND A WAY TO USE PROXY WITHOUT BOT VERIFICATION 
# hours=`curl --socks5 localhost:9050 -s https://www.xshellz.com/api/plain/downtempo/shellexpires`

echo $hours;

export DISPLAY=:0 # on which display the notification and alarm will be displayed
#export DISPLAY=:1 # on which display the notification and alarm will be displayed
eval "export $(egrep -z DBUS_SESSION_BUS_ADDRESS /proc/$(pgrep -u $LOGNAME gnome-session)/environ)";

DISPLAY=:0.0 /usr/bin/notify-send 'NOTE!!' "Checking when xShellz expires ($hours hours left)" --icon=dialog-information

if [ $hours -le 40 ]; then
	killall notify-osd;
	/usr/bin/notify-send 'WARNING!!' "xShellz will expire in $hours hours." --icon=dialog-information;
	/home/subnetcat/apps/bin/notify.py 'WARNING!!' "xShellz will expire in $hours hours.\n Come to our irc.freenode.net #xShellz channel\nand type: !keep downtempo (Your shell will be extended for 336 hours more)"
fi
