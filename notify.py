#!/usr/bin/python3

import subprocess
import sys

def get_screenname():
    screendata = subprocess.Popen(["xrandr"], stdout=subprocess.PIPE, stderr=subprocess.DEVNULL)
    return [line for line in screendata.communicate()[0].decode("utf-8").split("\n") if " connected" in line][0].split(" ")[0]

screen = get_screenname()
answer = 1

while answer == 1:
    subprocess.Popen(["xrandr", "--output", screen, "--gamma", "1:1:0.3", "--brightness", "0.6"])
    answer = subprocess.call(["zenity", "--question", "--text="+str(sys.argv[2]),  "--ok-label=OK", "--cancel-label=Cancel", "--title="+str(sys.argv[1]) ])
subprocess.call(["xrandr", "--output", screen, "--gamma", "1:1:1", "--brightness", "1"])

