#!/usr/bin/python3.7
import i3ipc


i3 = i3ipc.Connection()
tree = i3.get_tree()

windows = tree.leaves()
marks = i3.get_marks().copy()
f_marks = tree.find_focused().marks


if len(f_marks): 
    # index of the focused window's mark
    f_indx = marks.index(f_marks[0])
    del marks[f_indx]

n_marks = len(marks)
if not n_marks:
    print('')
    exit()

buf = '['
for i in range( n_marks ):
    mark = marks[i]
    if i == n_marks - 1:
        buf += "%s" % mark
    else:
        buf += "%s, " % mark
buf += ']'

print(buf)
