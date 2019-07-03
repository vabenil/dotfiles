#!/usr/bin/python3.7
import i3ipc


layout = i3ipc.Connection().get_tree().find_focused().parent.layout 

if layout == "splitv":
        print( "" )
elif layout == "splith":
        print( "" )
elif layout == "tabbed":
        print( "" )
elif layout == "stacked":
        print( "" )
else:
        print( "#" )
