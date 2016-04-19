#!/usr/bin/env python
# -*- coding: utf-8 -*-
import commands
import math
import subprocess
import sys

from os import path

# Update of script at https://github.com/seipherdj/zsh_linux_battery_status
# for Debian GNU/Linux on Lenovo Thinkpad X60s/X200s/X201s using acpi

PATH='/sys/class/power_supply/BAT0/uevent'
state, percentage = 'No battery', 10

if not path.isfile(PATH):
    sys.stdout.write('')
    sys.exit()

# Status
state = commands.getoutput("acpi -b | grep -E --only-matching 'Battery [0-9]: [[:alpha:]]+' | sed 's/^Battery [0-9]: //'")
percentage = float(commands.getoutput("acpi -b | grep -E --only-matching '[0-9]{1,3}%' | sed 's/%//'"))

# Output
slots  = 10
filled = int(math.ceil(percentage / 10.0)) * u'●'
empty  = (slots - len(filled)) * u'○'
out    = (filled + empty).encode('utf-8')

charging =  (u'↯').encode('utf-8')
charged  =  (u'✓').encode('utf-8')

color_green  = '%{[32m%}'
color_yellow = '%{[1;33m%}'
color_red    = '%{[31m%}'
color_reset  = '%{[00m%}'

color_out = (
    color_green if len(filled) > 4
    else color_yellow if len(filled) > 1
    else color_red
)

charging    = color_yellow + charging + color_reset
charged     = color_green  + charged  + color_reset
discharging = color_out    + out      + color_reset

# Omit battery status if we don't understand current status
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
