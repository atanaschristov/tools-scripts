#!/usr/bin/python3

import subprocess
import time
import sys

# snooze time
snooze_time = 90

def get_screenname():
    screendata = subprocess.Popen(["xrandr"], stdout=subprocess.PIPE)
    return [line for line in screendata.communicate()[0].decode("utf-8").split("\n") if " connected" in line][0].split(" ")[0]

screen = get_screenname()
snoozeoption = 1

while snoozeoption == 1:
    subprocess.Popen(["xrandr", "--output", screen, "--gamma", "1:1:0.3", "--brightness", "0.6"])
    snoozeoption = subprocess.call(["zenity", "--question", "--text="+str(sys.argv[2]),  "--ok-label=Dismiss", "--cancel-label=Snooze", "--title="+str(sys.argv[1]) ])
    if snoozeoption == 1:
        subprocess.call(["xrandr", "--output", screen, "--gamma", "1:1:1", "--brightness", "1"])
        time.sleep(snooze_time)
    else:
        pass
subprocess.call(["xrandr", "--output", screen, "--gamma", "1:1:1", "--brightness", "1"])
