#!/usr/bin/env python
# -*- coding: utf-8 -*-
import commands
import math
import subprocess
import sys

from os import path, access, R_OK

# Update of script at https://github.com/seipherdj/zsh_linux_battery_status
# for Debian GNU/Linux on Lenovo Thinkpad X60s

# We can also call `acpi -b` to get the battery status via ACPI
# http://pissedoffadmins.com/general/thinkpad-tmux-battery-status.html

PATH='/sys/class/power_supply/BAT0/uevent'
rem, full, state, percentage = 10.0, 10.0, 'No battery', 10

if path.isfile(PATH) and access(PATH, R_OK):
    rem   = float(commands.getoutput("grep ^POWER_SUPPLY_ENERGY_NOW= "  + PATH + " | tr '=' ' ' | awk '{ print $2 }'"))
    full  = float(commands.getoutput("grep ^POWER_SUPPLY_ENERGY_FULL= " + PATH + " | tr '=' ' ' | awk '{ print $2 }'"))
    state = commands.getoutput("cat /sys/class/power_supply/BAT0/status")
else:
    sys.stdout.write('')
    sys.exit()

percentage = int((rem/full) * 10)

# Output

total_slots, slots = 10, []
# filled = int(math.ceil(percentage * (total_slots / 10.0))) * u'▶'
filled = int(math.ceil(percentage * (total_slots / 10.0))) * u'●'
# empty  = (total_slots - len(filled)) * u'▷'
empty  = (total_slots - len(filled)) * u'○'
out    = (filled + empty).encode('utf-8')

charging =  (u'↯').encode('utf-8')
charged  =  (u'✓').encode('utf-8')

color_green  = '%{[32m%}'
color_yellow = '%{[1;33m%}'
color_red    = '%{[31m%}'
color_reset  = '%{[00m%}'

color_out = (
    color_green if len(filled) > 4
    else color_yellow if len(filled) > 2
    else color_red
)

charging    = color_yellow + charging + color_reset
charged     = color_green  + charged  + color_reset
discharging = color_out    + out      + color_reset

# Omit battery status if we can't find the required /sys node
if state == "No battery":
    sys.stdout.write('')
elif state == "Full":
    sys.stdout.write(charged)
elif state == "Unknown":
    sys.stdout.write('')
elif state == "Charging":
    sys.stdout.write(charging)
else:
    sys.stdout.write(discharging)
