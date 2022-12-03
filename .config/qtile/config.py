#         __   __ __
# .-----.|  |_|__|  |.-----.
# |  _  ||   _|  |  ||  -__|
# |__   ||____|__|__||_____|
#    |__|

# IMPORTS {{{

from typing import List  # noqa: F401
from libqtile import bar, layout, widget, hook
from libqtile.config import Click, Drag, Group, Key, Match, Screen
from libqtile.lazy import lazy
# from libqtile.utils import guess_terminal

# qtile extras
# from qtile_extras import widget
# from qtile_extras.widget.decorations import RectDecoration
import os
import subprocess

# }}}

# KEYBINDINGS {{{

mod = "mod4"
terminal = "st"

keys = [
    # Launch applications:
    Key([mod], "d",
        lazy.spawn("rofi -show drun"),
        desc="Launch rofi"),
    Key([mod], "r",
        lazy.spawn("rofi -show run -no-show-icons"),
        desc="launch rofi run"),
    Key([mod], "w",
        lazy.spwan("rofi -show window"),
        desc="Show opened windows"),
    Key([mod], "Return",
        lazy.spawn(terminal),
        desc="Launch terminal"),
    Key([mod], "e",
        lazy.spawn("./.scripts/rofi-configmenu.sh"),
        desc="Launch config menu"),
    Key(["shift"], "Print",
        lazy.spawn("./.scripts/rofi-scrotmenu.sh"),
        desc="Launch scrot menu"),

    Key([mod, "mod1"], "q",
        lazy.spawn("./.scripts/rofi-quickmarks.sh"),
        desc="Launch web browser"),
    Key([mod, "mod1"], "r",
        lazy.spawn(terminal + " -e ranger"),
        desc="Launch file browser"),
    Key([mod, "mod1"], "n",
        lazy.spawn(terminal + " -e nvim"),
        desc="Launch text editor"),
    Key([mod, "mod1"], "s",
        lazy.spawn("sxiv -t ~/Wallpapers/*"),
        desc="Launch sxiv"),


    # Switch between windows
    Key([mod], "h",
        lazy.layout.left(),
        desc="Move focus to left"),
    Key([mod], "l",
        lazy.layout.right(),
        desc="Move focus to right"),
    Key([mod], "j",
        lazy.layout.down(),
        desc="Move focus down"),
    Key([mod], "k",
        lazy.layout.up(),
        desc="Move focus up"),
    Key([mod], "space",
        lazy.layout.next(),
        desc="Move window focus to other window"),

    # Move windows between left/right columns or move up/down in current stack.
    # Moving out of range in Columns layout will create new column.
    Key([mod, "shift"], "h",
        lazy.layout.shuffle_left(),
        desc="Move window to the left"),
    Key([mod, "shift"], "l",
        lazy.layout.shuffle_right(),
        desc="Move window to the right"),
    Key([mod, "shift"], "j",
        lazy.layout.shuffle_down(),
        desc="Move window down"),
    Key([mod, "shift"], "k",
        lazy.layout.shuffle_up(),
        desc="Move window up"),

    # Grow windows. If current window is on the edge of screen and direction
    # will be to screen edge - window would shrink.
    Key([mod, "mod1"], "l",
        lazy.layout.grow_right(),
        lazy.layout.grow(),
        lazy.layout.increase_ratio(),
        lazy.layout.delete(),
        ),
    Key([mod, "mod1"], "h",
        lazy.layout.grow_left(),
        lazy.layout.shrink(),
        lazy.layout.decrease_ratio(),
        lazy.layout.add(),
        ),
    Key([mod, "mod1"], "k",
        lazy.layout.grow_up(),
        lazy.layout.grow(),
        lazy.layout.decrease_nmaster(),
        ),
    Key([mod, "mod1"], "j",
        lazy.layout.grow_down(),
        lazy.layout.shrink(),
        lazy.layout.increase_nmaster(),
        ),

    # Toggle between different layouts as defined below
    Key([mod], "Tab",
        lazy.next_layout(),
        desc="Toggle between layouts"),
    Key([mod], "q",
        lazy.window.kill(),
        desc="Kill focused window"),

    Key([mod, "shift"], "r",
        lazy.restart(),
        desc="Restart Qtile"),
    Key([mod, "shift"], "q",
        lazy.shutdown(),
        desc="Exit qtile")
    ]

# }}}

# WORKSPACES {{{

groups = [Group(i) for i in "123456789"]

for i in groups:
    keys.extend([
        # mod1 + letter of group = switch to group
        Key([mod], i.name, lazy.group[i.name].toscreen(),
            desc="Switch to group {}".format(i.name)),

        # mod1 + shift + letter of group = switch to & move focused window to group
        Key([mod, "shift"], i.name, lazy.window.togroup(i.name, switch_group=True),
            desc="Switch to & move focused window to group {}".format(i.name)),
        # Or, use below if you prefer not to switch to that group.
        # # mod1 + shift + letter of group = move focused window to group
        # Key([mod, "shift"], i.name, lazy.window.togroup(i.name),
        #     desc="move focused window to group {}".format(i.name)),
    ])


# }}}

# COLORS {{{

# taken from https://qutebrowser.org/doc/help/configuring.html
def read_xresources(prefix):
    """
    read settings from xresources
    """
    props = {}
    x = subprocess.run(["xrdb", "-query"], stdout=subprocess.PIPE)
    lines = x.stdout.decode().split("\n")
    for line in filter(lambda l: l.startswith(prefix), lines):
        prop, _, value = line.partition(":\t")
        props[prop] = value
    return props

colors = read_xresources("*")

# }}}

# LAYOUTS {{{

layout_default={
    "margin":10,
    "border_normal":colors["*.background"],
    "border_focus":colors["*.color4"],
    "border_width":2
        }
layouts = [
    layout.MonadTall(
        name="monad-tall",
        **layout_default),
    layout.MonadWide(
        name="monad-wide",
        **layout_default),
    layout.RatioTile(
        name="ratio",
        **layout_default),
    layout.Max( name = "max" ),
   ]

# }}}

# BAR {{{

widget_defaults = dict(
    font='Open Sans Condensed Bold',
    fontsize=11,
    padding=3,
)

extension_defaults = widget_defaults.copy()

screens = [
    Screen(
        bottom=bar.Bar(
            [
               widget.GroupBox(
                    active = colors["*.foreground"],
                    inactive="#A5ABB6",
                    highlight_color = colors["*.color4"],
                    highlight_method = "NONE",
                    rounded = True,
                    background = colors["*.background"],
                    **widget_defaults),
               widget.Spacer(background = colors["*.background"]),
               widget.CurrentLayout(
                   background = colors["*.background"],
                    **widget_defaults),
               widget.Clock(
                    background = colors["*.background"],
                    format='%H:%M',
                    **widget_defaults),
               widget.Systray(
                    background = colors["*.background"]),
               widget.Sep(
                    background = colors["*.background"],
                    linewidth=0,
                    padding=10,
                    ),
               widget.QuickExit(
                    font='Sauce Code Pro Nerd Font',
                    background = colors["*.background"],
                    default_text="  ",
                    countdown_format = ' {}s ',
                    fontsize=11,
                    padding=3,
                    ),
               widget.Sep(
                    background = colors["*.background"],
                    linewidth=0,
                    padding=10,
                    ),
            ],
            25,
            margin = [0, 400, 5, 400],
            opacity=0.9,
            background=colors["*.background"],
        ),
    ),
]

# }}}

# FLOATING {{{

# Drag floating layouts.
mouse = [
    Drag([mod], "Button1", lazy.window.set_position_floating(),
         start=lazy.window.get_position()),
    Drag([mod], "Button3", lazy.window.set_size_floating(),
         start=lazy.window.get_size()),
    Click([mod], "Button2", lazy.window.bring_to_front())
]

dgroups_key_binder = None
dgroups_app_rules = []  # type: List
main = None  # WARNING: this is deprecated and will be removed soon
follow_mouse_focus = True
bring_front_click = False
cursor_warp = False
floating_layout = layout.Floating(float_rules=[
    # Run the utility of `xprop` to see the wm class and name of an X client.
    Match(wm_type='utility'),
    Match(wm_type='notification'),
    Match(wm_type='toolbar'),
    Match(wm_type='splash'),
    Match(wm_type='dialog'),
    Match(wm_class='file_progress'),
    Match(wm_class='confirm'),
    Match(wm_class='dialog'),
    Match(wm_class='download'),
    Match(wm_class='error'),
    Match(wm_class='notification'),
    Match(wm_class='splash'),
    Match(wm_class='toolbar'),
    Match(wm_class='confirmreset'),  # gitk
    Match(wm_class='makebranch'),  # gitk
    Match(wm_class='maketag'),  # gitk
    Match(wm_class='ssh-askpass'),  # ssh-askpass
    Match(title='branchdialog'),  # gitk
    Match(title='pinentry'),  # GPG key password entry
],**layout_default)
auto_fullscreen = True
focus_on_window_activation = "smart"

# }}}

# AUTOSTART {{{

@hook.subscribe.startup_once
def autostart():
    home = os.path.expanduser('~/.scripts/autostart')
    subprocess.call([home])

# }}}

# OTHER {{{

# XXX: Gasp! We're lying here. In fact, nobody really uses or cares about this
# string besides java UI toolkits; you can see several discussions on the
# mailing lists, GitHub issues, and other WM documentation that suggest setting
# this string if your java app doesn't work correctly. We may as well just lie
# and say that we're a working one by default.
#
# We choose LG3D to maximize irony: it is a 3D non-reparenting WM written in
# java that happens to be on java's whitelist.
wmname = "qtile"

# }}}
