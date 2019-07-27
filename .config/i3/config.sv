
#  Variables: {{{1
set $mod Mod4
set $tabbed_term tabbed -f -n "floating_term" -r 2 st -w ''

#  Scripts: {{{
set $smart-open ~/.config/i3/scripts/smart-open.py
set $fullscreen-move ~/.config/i3/scripts/fullscreen_mode.py
set $sp_toggle ~/.config/i3/scripts/sp_toggle.py
# }}}

set $backgr #1F1F1F
set $focusd #4F6364
# }}}1

# Font: {{{
font pango:Hermit, Regular 8
# }}}

# Scheme: {{{
#class                    border    backgr    text      indicator   child_border
#
client.focused            #73738C   #454554   #ffffff   #73738C   #ffffff
client.focused_inactive   #4d4d4d   #4d4d4d   #e8e8e8   #4d4d4d   #1c1b1d
client.unfocused          #333333   #212121   #888888   #333333   #000000
client.urgent             #2f343a   #900000   #ffffff   #2f343a   #900000
client.placeholder        #000000   #0c0c0c   #ffffff   #000000   #0c0c0c

client.background         #ffffff
# }}}

# Set properties: {{{ 
title_align center
hide_edge_borders vertical
# Use Mouse+$mod to drag floating windows to their wanted position
floating_modifier $mod
# }}}


# Key Bindings: {{{1

# change container layout (stacked, tabbed, toggle split): {{{
bindsym $mod+s layout stacking
bindsym $mod+t layout tabbed
bindsym $mod+e layout toggle split
# toggle split layout of the current container
bindsym $mod+g exec $sp_toggle
# split in horizontal orientation
bindsym $mod+x split h
# split in vertical orientation
bindsym $mod+y split v
# }}}

# Wokspaces: {{{2

# go to workspace: {{{
bindsym $mod+1 workspace 1 
bindsym $mod+2 workspace 2 
bindsym $mod+3 workspace 3 
bindsym $mod+4 workspace 4 
bindsym $mod+5 workspace 5 
bindsym $mod+6 workspace 6 
bindsym $mod+7 workspace 7
bindsym $mod+8 workspace 8
bindsym $mod+9 workspace 9
bindsym $mod+0 workspace 10

bindsym $mod+w workspace next
bindsym $mod+b workspace prev

bindsym $mod+u workspace back_and_forth
# }}}

# move container to workspace: {{{
bindsym $mod+Shift+1 move container to workspace 1 
bindsym $mod+Shift+2 move container to workspace 2 
bindsym $mod+Shift+3 move container to workspace 3 
bindsym $mod+Shift+4 move container to workspace 4 
bindsym $mod+Shift+5 move container to workspace 5 
bindsym $mod+Shift+6 move container to workspace 6 
bindsym $mod+Shift+7 move container to workspace 7
bindsym $mod+Shift+8 move container to workspace 8
bindsym $mod+Shift+9 move container to workspace 9
bindsym $mod+Shift+0 move container to workspace 10

bindsym $mod+bracketleft move container to workspace next
bindsym $mod+bracketright move container to workspace prev
# }}}

# }}}2

# Window bindings: {{{
# change focus: {{{
bindsym   $mod+h       exec   i3-smart-focus   l
bindsym   $mod+j       exec   i3-smart-focus   d
bindsym   $mod+k       exec   i3-smart-focus   u
bindsym   $mod+l       exec   i3-smart-focus   r

bindsym   $mod+Left    exec   i3-smart-focus   l
bindsym   $mod+Down    exec   i3-smart-focus   d
bindsym   $mod+Up      exec   i3-smart-focus   u
bindsym   $mod+Right   exec   i3-smart-focus   r

# bindsym $mod+g exec $fullscreen-move 1

# change focus between tiling / floating windows
# Done like this to get around problems with tabbed
bindsym $mod+space exec i3-msg "focus mode_toggle"
# focus the parent container
bindsym $mod+a focus parent
# focus the child container
bindsym $mod+i focus child

# }}}

# move focused window: {{{
bindsym $mod+Shift+h move left 30px
bindsym $mod+Shift+j move down 30px
bindsym $mod+Shift+k move up 30px
bindsym $mod+Shift+l move right 30px

bindsym $mod+Shift+Left move left 30px
bindsym $mod+Shift+Down move down 30px
bindsym $mod+Shift+Up move up 30px
bindsym $mod+Shift+Right move right 30px

# move window to scratchpad workspace | hide the window in a invisible workspace 
bindsym $mod+Shift+s move scratchpad 

# }}}

# resize: {{{
bindsym $mod+Control+h resize shrink width 25 px or 5 ppt
bindsym $mod+Control+j resize grow height 25 px or 5 ppt
bindsym $mod+Control+k resize shrink height 25 px or 5 ppt
bindsym $mod+Control+l resize grow width 25 px or 5 ppt
# }}}

# }}}

# Func key controls: {{{

# Pulse Audio controls: {{{
bindsym XF86AudioRaiseVolume exec  pactl set-sink-volume 0 +5% #increase sound volume
bindsym XF86AudioLowerVolume exec  pactl set-sink-volume 0 -5% #decrease sound volume
bindsym XF86AudioMute exec  pactl set-sink-mute 0 toggle # mute sound
# }}}

# Sreen brightness controls {{{
exec --no-startup-id light -S 20
exec light -N 10
bindsym XF86MonBrightnessUp exec light -A 5 # increase screen brightness
bindsym XF86MonBrightnessDown exec light -U 5 # decrease screen brightness
# }}}

# ScreenShots: {{{
bindsym $mod+Menu exec scrot -e 'mv $f ~/Pictures/ScreenShots/$f && notify-send "ScreenShot saved in ~/Pictures/ScreenShots/$f"'
bindsym $mod+Shift+Menu exec scrot -u -e 'mv $f ~/Pictures/ScreenShots/$f && notify-send "ScreenShot saved in ~/Pictures/ScreenShots/$f"'

bindsym $mod+Control+s exec scrot -e 'mv $f ~/Pictures/ScreenShots/$f && notify-send "ScreenShot saved in ~/Pictures/ScreenShots/$f"'
bindsym $mod+Control+w exec scrot -u -e 'mv $f ~/Pictures/ScreenShots/$f && notify-send "ScreenShot saved in ~/Pictures/ScreenShots/$f"'
# }}}

# Touchpad controls: {{{
bindsym XF86TouchpadToggle exec touchpad_toggle # toggle touchpad
bindsym $mod+Control+t exec touchpad_toggle # toggle touchpad
# }}}

# }}}

# Other Key Bindings: {{{
# open menu to kill specific window 
# requires script from https://github.com/acrisci/i3ipc-python/tree/master/examples
bindsym $mod+q exec i3-container-commander --group-by "none" --command "kill"

bindsym $mod+Return exec $smart-open

bindsym $mod+Shift+q kill
bindsym $mod+f exec ~/.src/i3-easyfocus/i3-easyfocus
bindsym $mod+Shift+f fullscreen toggle

# bindsym $mod+slash exec ~/.src/i3-easyfocus/i3-easyfocus

# Copy selected text
bindsym Mod1+c exec cp-to-reg

bindsym $mod+Shift+space floating toggle

bindsym $mod+period scratchpad show

bindsym $mod+semicolon [instance="floating_term"] scratchpad show

bindsym $mod+Control+b bar mode toggle

bindsym $mod+comma mode "$prog_launcher"
# go to marked window
bindsym $mod+apostrophe mode "$go_to_mark"

bindsym $mod+m mode "Mark"

# start dmenu (a program launcher)
bindsym $mod+d exec dmenu_run -b -fn Hermit -nb "#212121" -sb "#378486"
bindsym $mod+Shift+d exec j4-dmenu-desktop --dmenu=dmenu\ -b\ -fn\ Hermit 

bindsym $mod+Shift+y exec yank-from-reg
bindsym $mod+Shift+Return exec setxkbmap us
bindsym $mod+Escape exec setxkbmap us
bindsym $mod+Shift+m mode "$layout_mode"
bindsym $mod+Control+1 mode "$layout_mode"

# }}}

# }}}1

# Defaults: {{{
# Floating windows: {{{
for_window [class="vlc"] floating enable 
for_window [class="Pavucontrol"] floating enable
for_window [class="Rhythmbox"] floating enable
#for_window [class="mpv"] floating enable resize set 500 400
for_window [class="Xfce4-taskmanager"] floating enable, resize set 500 400
for_window [class="MEGAsync"] floating enable
for_window [class="Gufw.py"] floating enable
for_window [class="Wicd-client.py"] floating enable
for_window [class="Gpick"] floating enable
for_window [title="htop"] floating enable
for_window [instance="floating_term"] floating enable, resize set 600 400
for_window [instance="mus_term"] floating enable
for_window [instance="update_term"] floating enable
for_window [instance="float"] floating enable
for_window [instance="calculator_term"] floating enable
for_window [class="XClipboard"] floating enable
for_window [instance="st_buffer"] fullscreen toggle

# Scratchpad windows
for_window [instance="mus_term"] move scratchpad, mark --add m
for_window [instance="floating_term"] move scratchpad 
for_window [class="XClipboard"] move scratchpad 

# }}}

# Workspaces for windows: {{{
assign [class="package"] 9
assign [class="Thunderbird"] 7
assign [class="Lutris"] 5
assign [class="Steam"] 5
assign [instance="ws-3"] 3
# }}}
# }}}

# gaps: {{{
# Set default gap
# gaps inner 10
# gaps outer 10

# smart_gaps inverse_outer
# bindsym $mod+plus gaps inner current plus 5
# bindsym $mod+minus gaps inner current minus 5
# bindsym $mod+Shift+plus gaps inner current set 0, gaps outer current set 0

# }}}

# System operations: {{{
# reload the configuration file
bindsym $mod+Shift+c reload
# restart i3 inplace (preserves your layout/session, can be used to upgrade i3)
bindsym $mod+Shift+r restart
# exit i3 (logs you out of your X session)
bindsym $mod+Shift+e exec prompt "Log out?" "i3-msg exit"
# shutdown the computer
bindsym $mod+Shift+x exec "st -n 'float' -t 'Shutdown' -g 90x1 -e sudo shutdown now"
# reboot the computer needs privilages
bindsym $mod+Shift+z exec  "st -n 'float' -t 'Reboot' -g 90x1 -e sudo reboot"
# }}}

# Modes: {{{ 

# Program Launcher: {{{
mode "$prog_launcher"  {

    # Program Bindings: {{{
    bindsym a exec "gnome-screenshot -a", mode "default"
    bindsym b exec "tabbed -c vimb -e", mode "default"
    bindsym c exec "st -n 'calculator_term' -e bc -l", mode "default"
    bindsym e exec "st -e vifm", mode "default"
    bindsym f exec "firefox", mode "default"
    bindsym g exec "gpick", mode "default"
    bindsym h exec "st -e htop", mode "default"
    bindsym l exec "lutris", mode "default"
    bindsym m exec "cmus", mode "default"
    bindsym n exec "st -e nvim", mode "default"
    bindsym s exec "steam", mode "default"
    bindsym t exec "st -e tmux", mode "default"
    bindsym u exec "st -n 'update_term' -e bash -c 'sudo apt update -y && sudo apt upgrade -y'", mode "default"
    bindsym w exec "wicd-client", mode "default"
    bindsym v exec "st -e vim", mode "default"
    bindsym z exec "zathura", mode "default"

    bindsym Shift+c exec "chromium-browser", mode "default"
    bindsym Shift+t exec "xfce4-taskmanager", mode "default"
    bindsym Shift+b exec "vimb", mode "default"

    bindsym semicolon [instance="floating_term"] scratchpad show, mode "default" 
    bindsym Return exec st, mode "default"
    # }}} 

    # Escape Mode Keys: {{{
    bindsym q mode "default"
    bindsym space mode "default"

    bindsym Control+bracketleft mode "default"
    bindsym Escape mode "default"
    bindsym Return mode "default"
    # }}}
}
# }}} 

# Mark: {{{
mode "Mark" {
    # Mark bindings: {{{
    bindsym a mark --toggle a; mode "default"
    bindsym b mark --toggle b; mode "default"
    bindsym c mark --toggle c; mode "default"
    bindsym d mark --toggle d; mode "default"
    bindsym e mark --toggle e; mode "default"
    bindsym f mark --toggle f; mode "default"
    bindsym g mark --toggle g; mode "default"
    bindsym h mark --toggle h; mode "default"
    bindsym i mark --toggle i; mode "default"
    bindsym j mark --toggle j; mode "default"
    bindsym k mark --toggle k; mode "default"
    bindsym l mark --toggle l; mode "default"
    bindsym m mark --toggle m; mode "default"
    bindsym n mark --toggle n; mode "default"
    bindsym o mark --toggle o; mode "default"
    bindsym p mark --toggle p; mode "default"
    bindsym q mark --toggle q; mode "default"
    bindsym r mark --toggle r; mode "default"
    bindsym s mark --toggle s; mode "default"
    bindsym t mark --toggle t; mode "default"
    bindsym u mark --toggle u; mode "default"
    bindsym v mark --toggle v; mode "default"
    bindsym w mark --toggle w; mode "default"
    bindsym y mark --toggle y; mode "default"
    bindsym z mark --toggle z; mode "default"

    bindsym Shift+a mark --toggle A; mode "default"
    bindsym Shift+b mark --toggle B; mode "default"
    bindsym Shift+c mark --toggle C; mode "default"
    bindsym Shift+d mark --toggle D; mode "default"
    bindsym Shift+e mark --toggle E; mode "default"
    bindsym Shift+f mark --toggle F; mode "default"
    bindsym Shift+g mark --toggle G; mode "default"
    bindsym Shift+h mark --toggle H; mode "default"
    bindsym Shift+i mark --toggle I; mode "default"
    bindsym Shift+j mark --toggle J; mode "default"
    bindsym Shift+k mark --toggle K; mode "default"
    bindsym Shift+l mark --toggle L; mode "default"
    bindsym Shift+m mark --toggle M; mode "default"
    bindsym Shift+n mark --toggle N; mode "default"
    bindsym Shift+o mark --toggle O; mode "default"
    bindsym Shift+p mark --toggle P; mode "default"
    bindsym Shift+q mark --toggle Q; mode "default"
    bindsym Shift+r mark --toggle R; mode "default"
    bindsym Shift+s mark --toggle S; mode "default"
    bindsym Shift+t mark --toggle T; mode "default"
    bindsym Shift+u mark --toggle U; mode "default"
    bindsym Shift+v mark --toggle V; mode "default"
    bindsym Shift+w mark --toggle W; mode "default"
    bindsym Shift+y mark --toggle Y; mode "default"
    bindsym Shift+z mark --toggle Z; mode "default"

    bindsym Control+a mode "default"
    bindsym Control+b mode "default"
    bindsym Control+c mode "default"
    bindsym Control+d mode "default"
    bindsym Control+e mode "default"
    bindsym Control+f mode "default"
    bindsym Control+g mode "default"
    bindsym Control+h mode "default"
    bindsym Control+i mode "default"
    bindsym Control+j mode "default"
    bindsym Control+k mode "default"
    bindsym Control+l mode "default"
    bindsym Control+m mode "default"
    bindsym Control+n mode "default"
    bindsym Control+o mode "default"
    bindsym Control+p mode "default"
    bindsym Control+q mode "default"
    bindsym Control+r mode "default"
    bindsym Control+s mode "default"
    bindsym Control+t mode "default"
    bindsym Control+u mode "default"
    bindsym Control+v mode "default"
    bindsym Control+w mode "default"
    bindsym Control+y mode "default"
    bindsym Control+z mode "default"

    bindsym $mod+a mode "default"
    bindsym $mod+b mode "default"
    bindsym $mod+c mode "default"
    bindsym $mod+d mode "default"
    bindsym $mod+e mode "default"
    bindsym $mod+f mode "default"
    bindsym $mod+g mode "default"
    bindsym $mod+h mode "default"
    bindsym $mod+i mode "default"
    bindsym $mod+j mode "default"
    bindsym $mod+k mode "default"
    bindsym $mod+l mode "default"
    bindsym $mod+m mode "default"
    bindsym $mod+n mode "default"
    bindsym $mod+o mode "default"
    bindsym $mod+p mode "default"
    bindsym $mod+q mode "default"
    bindsym $mod+r mode "default"
    bindsym $mod+s mode "default"
    bindsym $mod+t mode "default"
    bindsym $mod+u mode "default"
    bindsym $mod+v mode "default"
    bindsym $mod+w mode "default"
    bindsym $mod+y mode "default"
    bindsym $mod+z mode "default"
 
    bindsym 0 mark --toggle 0; mode "default"
    bindsym 1 mark --toggle 1; mode "default"
    bindsym 2 mark --toggle 2; mode "default"
    bindsym 3 mark --toggle 3; mode "default"
    bindsym 4 mark --toggle 4; mode "default"
    bindsym 5 mark --toggle 5; mode "default"
    bindsym 6 mark --toggle 6; mode "default"
    bindsym 7 mark --toggle 7; mode "default"
    bindsym 8 mark --toggle 8; mode "default"
    bindsym 9 mark --toggle 9; mode "default"
 
    bindsym Shift+0 mark --toggle ); mode "default"
    bindsym Shift+1 mark --toggle !; mode "default"
    bindsym Shift+2 mark --toggle @; mode "default"
    bindsym Shift+3 mark --toggle 3; mode "default"
    bindsym Shift+4 mark --toggle $; mode "default"
    bindsym Shift+5 mark --toggle %; mode "default"
    bindsym Shift+6 mark --toggle ^; mode "default"
    bindsym Shift+7 mark --toggle &; mode "default"
    bindsym Shift+8 mark --toggle *; mode "default"
    bindsym Shift+9 mark --toggle (; mode "default"
 
    bindsym $mod+0 mark --toggle ); mode "default"
    bindsym $mod+1 mark --toggle !; mode "default"
    bindsym $mod+2 mark --toggle @; mode "default"
    bindsym $mod+3 mark --toggle 3; mode "default"
    bindsym $mod+4 mark --toggle $; mode "default"
    bindsym $mod+5 mark --toggle %; mode "default"
    bindsym $mod+6 mark --toggle ^; mode "default"
    bindsym $mod+7 mark --toggle &; mode "default"
    bindsym $mod+8 mark --toggle *; mode "default"
    bindsym $mod+9 mark --toggle (; mode "default"
    # }}}
 
    # Escape keys: {{{
    bindsym q mode "default"
    bindsym space mode "default"
    bindsym Menu mode "default"

    bindsym Control+bracketleft mode "default"
    bindsym Escape mode "default"
    bindsym Return mode "default"
    # }}}
}
# }}}

# Go To Mark: {{{
mode "$go_to_mark" {
    # Select Mark bindings: {{{
    bindsym a [con_mark="a"] focus; mode "default"
    bindsym b [con_mark="b"] focus; mode "default"
    bindsym c [con_mark="c"] focus; mode "default"
    bindsym d [con_mark="d"] focus; mode "default"
    bindsym e [con_mark="e"] focus; mode "default"
    bindsym f [con_mark="f"] focus; mode "default"
    bindsym g [con_mark="g"] focus; mode "default"
    bindsym h [con_mark="h"] focus; mode "default"
    bindsym i [con_mark="i"] focus; mode "default"
    bindsym j [con_mark="j"] focus; mode "default"
    bindsym k [con_mark="k"] focus; mode "default"
    bindsym l [con_mark="l"] focus; mode "default"
    bindsym m [con_mark="m"] focus; mode "default"
    bindsym n [con_mark="n"] focus; mode "default"
    bindsym o [con_mark="o"] focus; mode "default"
    bindsym p [con_mark="p"] focus; mode "default"
    bindsym q [con_mark="q"] focus; mode "default"
    bindsym r [con_mark="r"] focus; mode "default"
    bindsym s [con_mark="s"] focus; mode "default"
    bindsym t [con_mark="t"] focus; mode "default"
    bindsym u [con_mark="u"] focus; mode "default"
    bindsym v [con_mark="v"] focus; mode "default"
    bindsym w [con_mark="w"] focus; mode "default"
    bindsym y [con_mark="y"] focus; mode "default"
    bindsym z [con_mark="z"] focus; mode "default"

    bindsym Shift+a [con_mark="A"] focus; mode "default"
    bindsym Shift+b [con_mark="B"] focus; mode "default"
    bindsym Shift+c [con_mark="C"] focus; mode "default"
    bindsym Shift+d [con_mark="D"] focus; mode "default"
    bindsym Shift+e [con_mark="E"] focus; mode "default"
    bindsym Shift+f [con_mark="F"] focus; mode "default"
    bindsym Shift+g [con_mark="G"] focus; mode "default"
    bindsym Shift+h [con_mark="H"] focus; mode "default"
    bindsym Shift+i [con_mark="I"] focus; mode "default"
    bindsym Shift+j [con_mark="J"] focus; mode "default"
    bindsym Shift+k [con_mark="K"] focus; mode "default"
    bindsym Shift+l [con_mark="L"] focus; mode "default"
    bindsym Shift+m [con_mark="M"] focus; mode "default"
    bindsym Shift+n [con_mark="N"] focus; mode "default"
    bindsym Shift+o [con_mark="O"] focus; mode "default"
    bindsym Shift+p [con_mark="P"] focus; mode "default"
    bindsym Shift+q [con_mark="Q"] focus; mode "default"
    bindsym Shift+r [con_mark="R"] focus; mode "default"
    bindsym Shift+s [con_mark="S"] focus; mode "default"
    bindsym Shift+t [con_mark="T"] focus; mode "default"
    bindsym Shift+u [con_mark="U"] focus; mode "default"
    bindsym Shift+v [con_mark="V"] focus; mode "default"
    bindsym Shift+w [con_mark="W"] focus; mode "default"
    bindsym Shift+y [con_mark="Y"] focus; mode "default"
    bindsym Shift+z [con_mark="Z"] focus; mode "default"

    bindsym 0 [con_mark="0"] focus; mode "default"
    bindsym 1 [con_mark="1"] focus; mode "default"
    bindsym 2 [con_mark="2"] focus; mode "default"
    bindsym 3 [con_mark="3"] focus; mode "default"
    bindsym 4 [con_mark="4"] focus; mode "default"
    bindsym 5 [con_mark="5"] focus; mode "default"
    bindsym 6 [con_mark="6"] focus; mode "default"
    bindsym 7 [con_mark="7"] focus; mode "default"
    bindsym 8 [con_mark="8"] focus; mode "default"
    bindsym 9 [con_mark="9"] focus; mode "default"
 
    bindsym Shift+0 [con_mark=")"] focus; mode "default"
    bindsym Shift+1 [con_mark="!"] focus; mode "default"
    bindsym Shift+2 [con_mark="@"] focus; mode "default"
    bindsym Shift+3 [con_mark="3"] focus; mode "default"
    bindsym Shift+4 [con_mark="$"] focus; mode "default"
    bindsym Shift+5 [con_mark="%"] focus; mode "default"
    bindsym Shift+6 [con_mark="^"] focus; mode "default"
    bindsym Shift+7 [con_mark="&"] focus; mode "default"
    bindsym Shift+8 [con_mark="*"] focus; mode "default"
    bindsym Shift+9 [con_mark="("] focus; mode "default"
    # }}}

    # Escape keys: {{{
    bindsym q mode "default"
    bindsym space mode "default"
    bindsym Menu mode "default"

    bindsym Control+bracketleft mode "default"
    bindsym Escape mode "default"
    bindsym Return mode "default"
    # }}}
}
# }}}

#  Layout Mode: {{{
mode --pango_markup "$layout_mode"  {

    # Layout Bindings: {{{
    bindsym e exec "setxkbmap us "; mode "default"
    bindsym r exec "setxkbmap ru phonetic"; mode "default"
    bindsym s exec "setxkbmap es "; mode "default"

    bindsym Shift+e exec "setxkbmap us"; mode "default"
    bindsym Shift+r exec "setxkbmap ru phonetic"; mode "default"
    bindsym Shift+s exec "setxkbmap es"; mode "default"
    # }}} 

    # Escape keys: {{{
    bindsym q mode "default"
    bindsym space mode "default"

    bindsym Control+bracketleft mode "default"
    bindsym Escape mode "default"
    bindsym Return mode "default"
    # }}}
}
# }}}

# }}}

# }}}

# Default Borders: {{{
default_border pixel 1
default_floating_border pixel 1
# }}}

# Run programs on startup: {{{
exec --no-startup-id st -n 'mus_term' -e 'cmus' 
exec --no-startup-id exec $tabbed_term 
exec --no-startup-id light -S 10
exec --no-startup-id pactl --set-sink-volume 0 20%
exec --no-startup-id synclient TouchpadOff=1
exec --no-startup-id xclipboard
exec --no-startup-id dunst
exec --no-startup-id st -n ws-3

# Redshift 
exec --no-startup-id redshift -l 46.69:11.48 -t 5600:5000 -g 0.8 -m randr -v

# compton for transparent windows 
exec compton

# set background
exec_always feh --bg-scale /home/vabenil/wallpapers/2_the_long_dark.jpg
# exec_always feh --bg-scale /home/vabenil/wallpapers/wallpaperPRo.jpg
# exec_always feh --bg-scale /home/vabenil/wallpapers/scrapping_metal.jpg


exec_always sleep 3 && ~/.config/polybar/launch.sh

# }}}

# Status bar: {{{
# bar {
#     position top
#     strip_workspace_numbers yes
#     font pango:Hermit, FontAwesome, Regular 12px
#     colors {
#         background $background
#         statusline #ffffff
#         separator #212121

#         #                  border  background text
#         focused_workspace  $focusd $focusd #E6E6E6 
#         active_workspace   $focusd $focusd #DEDEDE 
#         inactive_workspace $backgr $backgr #888888
#         urgent_workspace   #620000 #620000 #ffffff
#         binding_mode       $backgr $backgr #ADE4E6
#     }

#     # status_command ~/.config/i3/scripts/statustest.sh
   
#     tray_output NONE
# }

# vim: ft=cfg
