#!/usr/bin/python3.7
import i3ipc


i3 = i3ipc.Connection()
tree = i3.get_tree()


print( tree.find_focused().parent.layout )
