#!/usr/bin/python3.7


import i3ipc
import os
import subprocess


i3 = i3ipc.Connection()
focused = i3.get_tree().find_focused()
win_id = focused.window
term = os.environ['TERMINAL']

if focused.window_instance == 'floating_term':
    subprocess.run(["xdotool", "key", "-window", str(win_id), "alt+Return"])
else:
    subprocess.run([term])
