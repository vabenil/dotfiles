#!/usr/bin/python3.7

""" Focus tiling container if window is floating and U is attempted """

import i3ipc
import sys
import subprocess


directions = {
    "l": "left",
    "r": "right",
    "d": "down",
    "u": "up"
}

if len(sys.argv) < 2:
    print( "Usage:\nsmart-move <[l]eft, [r]right, [d]own, [u]p>\n" )
    exit()

fullscreen_move_path = "/home/vabenil/.config/i3/scripts/fullscreen_mode.py"

direction = sys.argv[1]

i3 = i3ipc.Connection()
focused = i3.get_tree().find_focused()

win_id = focused.window

isFTerm = True if focused.window_instance == "floating_term" else False
isFloating = True if (focused.floating == "auto_on" or focused.floating == "user_on") else False
isFullscreen = focused.fullscreen_mode


if isFTerm:
    if direction == 'r':
        subprocess.run(['xdotool', 'key', '-window', str(win_id), 'alt+n']) 
    elif direction == 'l':
        subprocess.run(['xdotool', 'key', '-window', str(win_id), 'alt+p']) 
    else:
        if isFullscreen:
            i3.command('fullscreen toggle')
        elif isFloating:
            i3.command('focus mode_toggle')
        else:
            i3.command('focus %s' % directions[direction])

elif isFullscreen:
    if direction == 'l':
        subprocess.run([fullscreen_move_path, '1'])
    elif direction == 'r':
        subprocess.run([fullscreen_move_path, '0'])
    else:
        i3.command('fullscreen toggle')
elif isFloating:
    if direction == 'd' or direction == 'u':
        i3.command('focus mode_toggle')
    else:
        i3.command('focus %s' % directions[direction])
else:
    i3.command('focus %s' % directions[direction])


