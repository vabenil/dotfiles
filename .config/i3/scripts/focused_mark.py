#!/usr/bin/python3.7
import i3ipc


i3 = i3ipc.Connection()
tree = i3.get_tree()

marks = tree.find_focused().marks

if len(marks):
    print( " [%s] " % marks[0] )
else:
    print( "" )
