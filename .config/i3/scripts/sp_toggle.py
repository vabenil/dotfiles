#!/usr/bin/python3.7
import i3ipc

i3 = i3ipc.Connection()
focused = i3.get_tree().find_focused()

layout = focused.parent.layout

if layout == "splith":
    i3.command("split v")
    print("Vertical")
elif layout == "splitv":
    i3.command("split h")
    print("Horizontal")
else:
    i3.command("split h")
    print("Else")

