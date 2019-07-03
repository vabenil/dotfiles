#!/bin/sh


# Programs utilized: {{{ 

# iwgetid
# ethtool
# touchpad_state 
# amixer
# xdpyinfo

# }}}

    # Color variables: {{{ 
    BLUE1="#378486"
    BLUE2="#00FFFF"
    RED1="#863937"
    BLACK="#000000"
    BACKGROUND="#212121"
    WHITE="#E8E8E8"
    LIGHT="#DAD8D8"
    GREY_BLUEISH="#2B3F40"
    GREY1="#5E5E5E"
    # }}}

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

    # Networking: {{{ 
    network_name=$(iwgetid -r)
    [ -z $network_name ] && network_name="Not Connected"
     
    if [ $(iwgetid | sed -ne 's/^\(.\{2\}\).*/\1/p') = "wl" ];
    then
        network_icon=""
    else
        wireless_conection=$(ethtool eno1 | tail -n1 | grep -e "yes" -o)
        if [ $wireless_conection = "yes" ]; then 
            network_icon="  " 
        else
            # check for errors
            echo ${wireless_conection} > /home/vabenil/log.txt
            network_icon=""
        fi
    fi
    # }}}

    # touchpad_state=$( [ $(touchpad_state) -eq 1 ] && echo "Disabled" || echo "Enabled" )

    volume=$(amixer -c 1 -M -D pulse get Master | grep -o -E [[:digit:]]+% | head -n1) 
    volume=${volume%?}

    # amixer_state=`amixer get Master | egrep 'Playback.*?\[o' | egrep -o '\[o.+\]'`

    # Scripts: {{{
    scroll=${HOME}/.config/i3/scripts/scroll.py
    f_mark=${HOME}/.config/i3/scripts/focused_mark.py
    marks=${HOME}/.config/i3/scripts/get_marks.py

    get_layout=${HOME}/.config/i3/scripts/layout.py
    # }}} 

    layout=$($get_layout)

    case $layout in
        "splitv")
            l_icon=""
            l_bg=$RED1
            ;;
        "splith")
            l_icon=""
            l_bg=$BLUE1
            ;;
        "tabbed")
            l_icon=""
            l_bg="#375936"
            ;;
        "stacked")
            l_icon=""
            l_bg=$BLACK
            ;;
        *)
            l_icon=" "
            l_bg="#FFFFFF"
            ;;
    esac
    
    title=`$scroll 64 $count`

    # xscreen_size=$(xdpyinfo | sed -n 's/dimensions:\s\+\(\<[0-9]\+\)x.*/\1/p')
    # font_width=7
    # status_width=$(($xscreen_size - $font_width))

    if [ $volume -gt 0 ]; then
        if [ $volume -le 30 ]; then
            volume_icon=""
        else
            volume_icon=""
        fi
    else
        volume_icon=""
    fi

    echo ","
    jq --null-input --slurp --color-output -M \
        --arg title           "$title" \
        --arg mark            "<span font_weight='bold' foreground='yellow'>$($f_mark)</span>" \
        --arg marks           "$($marks)" \
        --arg l_icon          "$l_icon" \
        --arg l_bg            "$l_bg" \
        --arg title_minwidth  "$(for i in $(seq 1 80); do echo -n A; done)" \
        --arg touchpad_state  " : $touchpad_state " \
        --arg network         " $network_icon $network_name " \
        --arg volume          " $volume_icon $volume% " \
        --arg date            "  $(date '+%a, %d.%m.%Y') " \
        --arg time            "  $(date '+%r') " \
        --arg BLUE1           "$BLUE1" \
        --arg BLUE2           "$BLUE2" \
        --arg RED1            "$RED1" \
        --arg BLACK           "$BLACK" \
        --arg BACKGROUND      "$BACKGROUND" \
        --arg WHITE           "$WHITE" \
        --arg LIGHT           "$LIGHT" \
        --arg GREY_BLUEISH    "$GREY_BLUEISH" \
        --arg GREY1           "$GREY1" \
        '
            [
            {
                "name":"Title",
                "full_text":$title,
                "min_width":$title_minwidth,
                "align":"center",
                "background":$BACKGROUND,
                "color":$WHITE,
                "separator": false,
                "separator_block_width": 0
            },
            {
                "name":"Mark",
                "full_text":$mark,
                "min_width":"  [M]  ",
                "align":"center",
                "markup":"pango",
                "background":$BACKGROUND,
                "color":$WHITE,
                "separator": false,
                "separator_block_width": 0
            },
            {
                "name":"Marks",
                "full_text":$marks,
                "min_width":" [M] ",
                "align":"center",
                "background":$BACKGROUND,
                "color":$WHITE,
                "separator": false,
                "separator_block_width": 0
            },
            {
                "name":"layout",
                "full_text":$l_icon,
                "min_width":" M ",
                "align":"center",
                "markup":"pango",
                "color":$WHITE,
                "background":$l_bg,
                "separator": false,
                "separator_block_width": 0
            },
    {
        "name":"Network",
        "full_text":$network,
        "background":$GREY_BLUEISH,
        "color":$LIGHT,
        "separator": false,
        "separator_block_width": 0
    },
{
    "name":"Volume",
    "full_text":$volume,
    "min_width":"   100% ",
    "align":"center",
    "background":$BLUE1,
    "color":$WHITE,
    "separator": false,
    "separator_block_width": 0
},
{
    "name":"date",
    "full_text":$date,
    "background":$GREY_BLUEISH,
    "color":$LIGHT,
    "separator": false,
    "separator_block_width": 0
},
{
    "name":"time",
    "full_text":$time,
    "background":$BLUE1,
    "color":$WHITE,
    "separator": false,
    "separator_block_width": 0
}
]
'
    count=$(( $count + 1 ))
    sleep 0.2
done

