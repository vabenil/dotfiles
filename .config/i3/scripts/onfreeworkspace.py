#!/usr/bin/python3.7

import i3ipc


i3 = i3ipc.Connection()

def on_workspace_focus(self, e):
    # The first parameter is the connection to the ipc and the second is an object
    # with the data of the event sent from i3.
    if e.current:
        if len(e.current.leaves()) == 0:
            i3.command('mode "Program launcher"')


i3.on('workspace::focus', on_workspace_focus)

i3.main()
