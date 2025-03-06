
import os
import subprocess
import colors

from libqtile import bar, layout, qtile, widget, hook, extension
from libqtile.config import Click, Drag, Group, Key, Match, Screen, KeyChord
from libqtile.lazy import lazy
from libqtile.utils import guess_terminal


from qtile_extras import widget
from qtile_extras.widget.decorations import BorderDecoration

mod = "mod4"

################################################################################
################################## keybinds ####################################
################################################################################


keys = [

# A list of available commands that can be bound to keys can be found
    # at https://docs.qtile.org/en/latest/manual/config/lazy.html
 

          # launch apps 
    Key([mod], "Return", lazy.spawn("kitty"), desc="Launch Kitty terminal"),
    Key([mod], "e", lazy.spawn("nautilus"), desc="Launch nautilus"),
    Key([mod], "b", lazy.spawn("brave")),
    Key([mod], "s", lazy.spawn("/home/ayoub/.config/qtile/scripts/spotify-brave.sh"), desc="spotify"),
#    Key([mod], "r", lazy.spawn("rofi -show drun"), desc="Launch Rofi"),
    Key([mod], "r", lazy.spawn("/home/ayoub/.config/rofi/launchers/type-6/launcher.sh"), desc="Launch Rofi"),

          # control windows
    Key([mod], "v", lazy.window.toggle_floating(), desc="floating focus window"),
    Key([mod], "c", lazy.window.kill(), desc="Close the focused window"),
    Key([mod], "Space", lazy.next_layout(), desc="maximize and minimize"),

         # Switch focus
    Key([mod], "Left", lazy.layout.left(), desc="Move focus to left"),
    Key([mod], "right", lazy.layout.right(), desc="Move focus to right"),
    Key([mod], "down", lazy.layout.down(), desc="Move focus down"),
    Key([mod], "up", lazy.layout.up(), desc="Move focus up"),

         # move windows places
    Key([mod, "control"], "left", lazy.layout.shuffle_left(), desc="Move window to the left"),
    Key([mod, "control"], "right", lazy.layout.shuffle_right(), desc="Move window to the right"),
    Key([mod, "control"], "down", lazy.layout.shuffle_down(), desc="Move window down"),
    Key([mod, "control"], "up", lazy.layout.shuffle_up(), desc="Move window up"),

         # resize windows 
    Key([mod, "shift"], "left", lazy.layout.shrink_main(), desc="Grow window to the left"),
    Key([mod, "shift"], "right", lazy.layout.grow_main(), desc="Grow window to the right"),
    Key([mod, "shift"], "down", lazy.layout.shrink(), desc="Grow window down"),
    Key([mod, "shift"], "up", lazy.layout.grow(), desc="Grow window up"),
    Key([mod], "n", lazy.layout.normalize(), desc="Reset all window sizes"),


    Key([mod], "l", lazy.spawn("/home/ayoub/.config/rofi/custom/power/powermenu.sh"), desc="power menu"),



    # Volume keys

Key([], "XF86AudioRaiseVolume", lazy.spawn("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+")),
Key([], "XF86AudioLowerVolume", lazy.spawn("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-")),
Key([], "XF86AudioMute", lazy.spawn("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle")),
Key([], "XF86AudioMicMute", lazy.spawn("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle")),


    # media 
Key([], "XF86AudioNext", lazy.spawn("playerctl next"), desc="Next media track"),
Key([], "XF86AudioPause", lazy.spawn("playerctl play-pause"), desc="Play/Pause media"),
Key([], "XF86AudioPlay", lazy.spawn("playerctl play-pause"), desc="Play/Pause media"),
Key([], "XF86AudioPrev", lazy.spawn("playerctl previous"), desc="Previous media track"),

    



    Key([mod], "Tab", lazy.next_layout(), desc="Toggle between layouts"),
    Key([mod],"f",lazy.window.toggle_fullscreen(),desc="Toggle fullscreen on the focused window",),
   
    Key([mod, "control"], "r", lazy.reload_config(), desc="Reload the config"),
 #   Key([mod, "control"], "q", lazy.shutdown(), desc="Shutdown Qtile"),
    Key([mod], "t", lazy.spawncmd(), desc="Spawn a command using a prompt widget"),
]

######################### bottom of keybinds ###########################


# Add key bindings to switch VTs in Wayland.
# We can't check qtile.core.name in default config as it is loaded before qtile is started
# We therefore defer the check until the key binding is run by using .when(func=...)
for vt in range(1, 8):
    keys.append(
        Key(
            ["control", "mod1"],
            f"f{vt}",
            lazy.core.change_vt(vt).when(func=lambda: qtile.core.name == "wayland"),
            desc=f"Switch to VT{vt}",
        )
    )


groups = [Group(i) for i in "123456789"]

for i in groups:
    keys.extend(
        [
            # mod + group number = switch to group
            Key(
                [mod],
                i.name,
                lazy.group[i.name].toscreen(),
                desc=f"Switch to group {i.name}",
            ),
            # mod + shift + group number = switch to & move focused window to group
            Key(
                [mod, "shift"],
                i.name,
                lazy.window.togroup(i.name, switch_group=True),
                desc=f"Switch to & move focused window to group {i.name}",
            ),
            # Or, use below if you prefer not to switch to that group.
            # # mod + shift + group number = move focused window to group
            # Key([mod, "shift"], i.name, lazy.window.togroup(i.name),
            #     desc="move focused window to group {}".format(i.name)),
        ]
    )

layouts = [

   layout.MonadTall(
        margin=8,          # Outer gaps (space between windows and screen edges)
        border_width=2,     # Border width for windows
        border_focus="#46d9ff",  # Border color for focused window
        border_normal="#1e2030", # Border color for unfocused windows
    ),

   layout.Max(),
   #  layout.Columns(border_focus_stack=["#d75f5f", "#8f3d3d"], border_width=4),
    # Try more layouts by unleashing below layouts.
   #  layout.Stack(num_stacks=2),
   #  layout.Bsp(),
   #  layout.Matrix(),
   # layout.MonadTall(),
   # layout.MonadWide(),
   #  layout.RatioTile(),
   #  layout.Tile(),
   # layout.TreeTab(),
   #  layout.VerticalTile(),
   #  layout.Zoomy(),

]


widget_defaults = dict(
    font="sans",
    fontsize=12,
    padding=3,
)
extension_defaults = widget_defaults.copy()



# Drag floating layouts.
mouse = [
    Drag([mod], "Button1", lazy.window.set_position_floating(), start=lazy.window.get_position()),
    Drag([mod], "Button3", lazy.window.set_size_floating(), start=lazy.window.get_size()),
    Click([mod], "Button2", lazy.window.bring_to_front()),
]

dgroups_key_binder = None
dgroups_app_rules = []  # type: list
follow_mouse_focus = True
bring_front_click = False
floats_kept_above = True
cursor_warp = False
floating_layout = layout.Floating(
    float_rules=[
        # Run the utility of `xprop` to see the wm class and name of an X client.
        *layout.Floating.default_float_rules,
        Match(wm_class="confirmreset"),  # gitk
        Match(wm_class="makebranch"),  # gitk
        Match(wm_class="maketag"),  # gitk
        Match(wm_class="ssh-askpass"),  # ssh-askpass
        Match(title="branchdialog"),  # gitk
        Match(title="pinentry"),  # GPG key password entry
    ]
)
auto_fullscreen = True
focus_on_window_activation = "smart"
reconfigure_screens = True

# If things like steam games want to auto-minimize themselves when losing
# focus, should we respect this or not?
auto_minimize = True

# When using the Wayland backend, this can be used to configure input devices.
wl_input_rules = None

# xcursor theme (string or None) and size (integer) for Wayland backend
wl_xcursor_theme = None
wl_xcursor_size = 24

# XXX: Gasp! We're lying here. In fact, nobody really uses or cares about this
# string besides java UI toolkits; you can see several discussions on the
# mailing lists, GitHub issues, and other WM documentation that suggest setting
# this string if your java app doesn't work correctly. We may as well just lie
# and say that we're a working one by default.
#
# We choose LG3D to maximize irony: it is a 3D non-reparenting WM written in
# java that happens to be on java's whitelist.
wmname = "LG3D"






####################### starup ############################

@hook.subscribe.startup_once
def autostart():
    script = os.path.expanduser("~/.config/qtile/autostart.sh")
    subprocess.run([script])

###############################################################


######################### qtile bar #########################


#  screens = [
#    Screen(
#  top=bar.Gap(21),  # Adjust the size to match Polybar's height
#    ),   
#   ]

########################### rice bar #############################





colors = colors.DoomOne


layout_theme = {"border_width": 2,
                "margin": 8,
                "border_focus": colors[8],
                "border_normal": colors[0]
                }


screens = [
    Screen(
        top=bar.Bar(
            [
                widget.Image(
                 filename = "~/.config/qtile/icons/logo.png",
                 scale = "False",
                  mouse_callbacks={    "Button1": lazy.spawn("/home/ayoub/.config/rofi/custom/power/powermenu.sh")},
 

            #     mouse_callbacks = {'Button1': lambda: qtile.cmd_spawn(kitty)},
                 ),
        widget.Prompt(
                 font = "Ubuntu Mono",
                 fontsize=14,
                 foreground = colors[1]
        ),
        widget.GroupBox(
                 fontsize = 11,
                 margin_y = 5,
                 margin_x = 5,
                 padding_y = 0,
                 padding_x = 1,
                 borderwidth = 3,
                 active = colors[8],
                 inactive = colors[1],
                 rounded = False,
                 highlight_color = colors[2],
                 highlight_method = "line",
                 this_current_screen_border = colors[7],
                 this_screen_border = colors [4],
                 other_current_screen_border = colors[7],
                 other_screen_border = colors[4],
                 ),
        widget.TextBox(
                 text = '|',
                 font = "Ubuntu Mono",
                 foreground = colors[1],
                 padding = 2,
                 fontsize = 14
                 ),
        widget.CurrentLayoutIcon(
                 # custom_icon_paths = [os.path.expanduser("~/.config/qtile/icons")],
                 foreground = colors[1],
                 padding = 4,
                 scale = 0.6
                 ),
        widget.CurrentLayout(
                 foreground = colors[1],
                 padding = 5
                 ),
        widget.TextBox(
                 text = '|',
                 font = "Ubuntu Mono",
                 foreground = colors[1],
                 padding = 2,
                 fontsize = 14
                 ),
        widget.WindowName(
                 foreground = colors[6],
                 max_chars = 120     #40 #default
                 ),




############################## network speed
widget.Net(
    interface="wlan0", 
 format="     {up: .2f} KB/s     {down: .2f} KB/s ",
# format="📡 ↑ {up} ↓ {down}",    
    use_bits=False,  #Set True for bits(Kbps/Mbps),False for bytes(KB/s, MB/s)
    update_interval=1,
     prefix='k',
    foreground = colors[3],


decorations=[
                     BorderDecoration(
                         colour = colors[3],
                         border_width = [0, 0, 2, 0],
                     )
                 ],
                 ),
        widget.Spacer(length = 8),
############################### cpu
        widget.CPU(
                 format = ' 💻  Cpu: {load_percent}% ',
                 foreground = colors[4],
                 decorations=[
                     BorderDecoration(
                         colour = colors[4],
                         border_width = [0, 0, 2, 0],
                     )
                 ],
                 ),
        widget.Spacer(length = 8),
############################### memory ram
        widget.Memory(
                 foreground = "#499dd7",
                # format = '{MemUsed: .0f}{mm}',
                # fmt = ' 💾  Mem: {} used ',
 
                format="Mem: {MemUsed:.1f} GB used",
    measure_mem="G", 

                 decorations=[
                     BorderDecoration(
                         colour = "#499dd7",
                         border_width = [0, 0, 2, 0],
                     )
                 ],
                 ),
        widget.Spacer(length = 8),
############################### battery
widget.Battery(
    format='     {percent:2.0%} {char}' ,
    charge_char='  ',
    discharge_char='↓',
    empty_char='!',
    full_char='✓',
    show_short_text=False,
    update_interval=60,
    notify_below=20,  

       foreground = colors[5], 
            decorations=[
                     BorderDecoration(
                         colour = colors[5],
                         border_width = [0, 0, 2, 0],
                     )
                 ],
                 ),
        widget.Spacer(length = 8),
############################### volume
widget.GenPollText(
     foreground = colors[7],   
    fmt="  🕫 Volume: {}% ",
    update_interval=0.1,
    func=lambda: str(int(float(subprocess.check_output(
        "wpctl get-volume @DEFAULT_AUDIO_SINK@", shell=True
    ).decode("utf-8").strip().split()[1]) * 100)),


                 decorations=[
                     BorderDecoration(
                         colour = colors[7],
                         border_width = [0, 0, 2, 0],
                     )
                 ],
                 ),

        widget.Spacer(length = 8),
############################ power menu
     widget.GenPollText( 
        foreground = colors[4],
            fmt="☀️ Brightness  {0}% ",
        update_interval=0.1,
        func=lambda: subprocess.check_output(
        "brightnessctl g", shell=True
        ).decode("utf-8").strip(),
        
          mouse_callbacks={
        "Button1": lambda: subprocess.call(["brightnessctl", "set", "+10%"]),  # Left click
        "Button3": lambda: subprocess.call(["brightnessctl", "set", "10%-"]),  # Right click
    },
                    
                    decorations=[
                     BorderDecoration(
                         colour = colors[4],
                         border_width = [0, 0, 2, 0],
                     )
                 ],
                 ),
        widget.Spacer(length = 8),
############################ clock
        widget.Clock(
                 foreground = "#499dd7",
                 format = "    %a, %d %b - %H:%M  ",
                 decorations=[
                     BorderDecoration(
                         colour = "#499dd7",
                         border_width = [0, 0, 2, 0],
                     )
                 ],
                 ),
        widget.Spacer(length = 8),
######################## systray
        widget.Systray(padding = 3),
        
        widget.Spacer(length = 8),
#########################




    ],
            size=25,  # 22
            background="#1e2030",  # Background color
 #           fontsize = 12,
  #          font="Ubuntu Bold",
   #         fontweight="bold",    # Make the font bolder
    #        opacity=1,  # Transparency

      font="Ubuntu Bold",
      fontsize = 16,
      padding = 0,
   #   background=colors[0]   

        ),

    ),
]





widget_defaults = dict(
    font="Ubuntu Bold",
    fontsize = 12,
    padding = 0,
    background=colors[0]
)



#######################################################3333

#            size=22,
#          background="#1e2030",  # Background color
#       fontsize = 12,
#            font="Ubuntu Bold",
 #           fontweight="bold",    # Make the font bolder
  #          opacity=1,  # Transparency


#####################################################3



