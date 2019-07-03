#!/bin/sh

# send header to use JSON
echo ' { "version": 1 }'



# begin the endless array
echo '['

# We send a empy first arry of blocks to make the loop simpler:
echo '[]'

# Now send blocks wit information forever:
count=0
while :;
do 
    echo ","

    xscreen_size=$(xdpyinfo | sed -n 's/dimensions:\s\+\(\<[0-9]\+\)x.*/\1/p')
    # This only works with hermit regular 11px
    font_width=7
    status_width=$(($xscreen_size / $font_width))

    clipboard=$(xclip -o -selection clipboard)
    clipboard=" clip: $(echo $clipboard | sed 's/\(^.\{32\}\).*/\1/') "
    marks=" $(~/.config/i3/scripts/get_marks.py) "

    spacing=$(( $status_width - (${#clipboard} + ${#marks} - 2) )) 

    jq --null-input --slurp --color-output -M \
        --arg clip     "$clipboard" \
        --arg marks    "$marks" \
        --arg spacing  "$( for i in $(seq 1 $spacing); do echo -n ' '; done)" \
        --arg bg1      "#2B3F40" \
        --arg bg2      "#6E4745" \
        --arg blue     " " \
        --arg red      " " \
        '
        [
            {
                "name":"Marks",
                "full_text":$marks,
                "markup":"pango",
                "background":$bg1,
                "separator": false,
                "separator_block_width": 0
            },
            {
                "name":"Clipboard",
                "full_text":$clip,
                "markup":"pango",
                "background":$bg2,
                "separator": false,
                "separator_block_width": 0
            },
            {
                "name":"Separator",
                "full_text":$spacing,
                "separator": false,
                "separator_block_width": 0
            }

        ]
'
    count=$(( $count + 1 ))
    sleep 0.3
done


