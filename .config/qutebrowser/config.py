#               __          __
# .-----.--.--.|  |_.-----.|  |--.----.-----.--.--.--.-----.-----.----.
# |  _  |  |  ||   _|  -__||  _  |   _|  _  |  |  |  |__ --|  -__|   _|
# |__   |_____||____|_____||_____|__| |_____|________|_____|_____|__|
#    |__|


import os
import subprocess
import catppuccin

gruvbox_dark = {
    "red"       : "#ea6962",
    "orange"    : "#e78a4e",
    "yellow"    : "#d8a657",
    "green"     : "#a9b665",
    "aqua"      : "#89b482",
    "blue"      : "#7daea3",
    "purple"    : "#d3869b",
    "bg_yellow" : "#d8a657",
    "bg_red"    : "#ea6962",
    "bg_green"  : "#a9b665",
    "grey0"     : "#7c6f64",
    "grey1"     : "#928374",
    "grey2"     : "#a89984",
    "fg0"       : "#d4be98",
    "fg1"       : "#ddc7a1",
    "bg0"       : "#282828",
    "bg1"       : "#32302f",
    "bg2"       : "#32302f",
    "bg3"       : "#45403d",
    "bg4"       : "#45403d",
    "bg5"       : "#5a524c",
  }

catppuccin_colors = {
   "rosewater" : "#f4dbd6",
   "flamingo"  : "#f0c6c6",
   "pink"      : "#f5bde6",
   "mauve"     : "#c6a0f6",
   "red"       : "#ed8796",
   "maroon"    : "#ee99a0",
   "peach"     : "#f5a97f",
   "yellow"    : "#eed49f",
   "green"     : "#a6da95",
   "teal"      : "#8bd5ca",
   "sky"       : "#91d7e3",
   "sapphire"  : "#7dc4e4",
   "blue"      : "#8aadf4",
   "lavender"  : "#b7bdf8",
   "text"      : "#cad3f5",
   "subtext1"  : "#b8c0e0",
   "subtext0"  : "#a5adcb",
   "overlay2"  : "#939ab7",
   "overlay1"  : "#8087a2",
   "overlay0"  : "#6e738d",
   "surface2"  : "#5b6078",
   "surface1"  : "#494d64",
   "surface0"  : "#363a4f",
   "base"      : "#24273a",
   "mantle"    : "#1e2030",
   "crust"     : "#181926"
}

#################
# MAIN SETTINGS #
#################

# load your autoconfig, use this, if the rest of your config is empty!
config.load_autoconfig()

# set the flavor you'd like to use
# valid options are 'mocha', 'macchiato', 'frappe', and 'latte'
# last argument (optional, default is False): enable the plain look for the menu rows
catppuccin.setup(c, 'macchiato', False)

c.aliases = {
    'q': 'close',
    'w': 'session-save',
    'wq': 'quit --save',
    'r': 'restart',
}
c.downloads.location.directory = '/home/dilip/Downloads'
c.url.searchengines = {
        'DEFAULT': 'https://duckduckgo.com/?q={}',
        'wk':'https://en.wikipedia.org/wiki/{}',
        'rd':'https://www.reddit.com/search/?q={}',
        'yt': 'https://www.youtube.com/results?search_query={}',
        'amz':'https://www.amazon.in/s/ref=nb_sb_noss?url=search-alias%3Daps&field-keywords={}'
}
c.url.default_page = '/home/dilip/.config/qutebrowser/fluidity/index.html'
c.url.start_pages = '/home/dilip/.config/qutebrowser/fluidity/index.html'
c.content.images = True
c.content.javascript.enabled = True
c.content.autoplay = False
c.content.notifications.presenter = "auto"
# c.content.private_browsing = True
c.completion.web_history.max_items = 15

# Valid values:
#   - all: Accept all cookies.
#   - no-3rdparty: Accept cookies from the same origin only. This is known to
#   break some sites, such as GMail.
#   - no-unknown-3rdparty: Accept cookies from the same origin only, unless a
#   cookie is already set for the domain. On QtWebEngine, this is the same as
#   no-3rdparty.
#   - never: Don't accept cookies at all.
c.content.cookies.accept = 'all'
c.content.headers.user_agent = 'Mozilla/5.0 ({os_info}) AppleWebKit/{webkit_version} (KHTML, like Gecko) {upstream_browser_key}/{upstream_browser_version} Safari/{webkit_version}'


#################
# OTHER SETINGS #
#################

# --- Completion ---
c.completion.shrink = True

# --- File Select ---
# config.set("fileselect.handler", "external")
# config.set("fileselect.single_file.command" , ["st", "-n", "filechooser", "-e", "ranger", "--choosefile", "{}"])
# config.set("fileselect.multiple_files.command", ["st", "-n", "filechooser", "-e", "ranger", "--choosefiles", "{}"])

c.content.pdfjs = True

# --- Insert Mode ---
c.input.insert_mode.auto_enter = True
c.input.insert_mode.leave_on_load = True

# --- Tabs ---
c.tabs.show = 'multiple'        # Values: always, never, multiple
c.tabs.padding = {"bottom":1, "left":5, "right":5, "top":1}
c.tabs.favicons.show = 'never'    # valuse: always, never

# --- Scrolling ---
c.scrolling.smooth = False

# --- Scrollbar ---
c.completion.scrollbar.width = 12
c.completion.scrollbar.padding = 4

# --- Statusbar ---
c.statusbar.padding = {"bottom":1, "left":1, "right":1, "top":1}

###########################
# UI COLROS CONFIGURATION #
###########################
# --- Custom CSS ---
# config.set("content.user_stylesheets","~/.config/qutebrowser/stylesheets/wal-duckduckgo.com.css")

# --- Webpages ---
c.colors.webpage.bg = gruvbox_dark["bg0"]

c.colors.webpage.darkmode.enabled = True

# --- Context menu ---
c.colors.contextmenu.menu.bg     = gruvbox_dark["bg0"]
c.colors.contextmenu.menu.fg     = gruvbox_dark["fg0"]
c.colors.contextmenu.selected.bg = gruvbox_dark["bg2"]
c.colors.contextmenu.selected.fg = gruvbox_dark["fg0"]

# --- Completions ---
c.colors.completion.fg                          = gruvbox_dark["fg0"]
c.colors.completion.odd.bg                      = gruvbox_dark["bg0"]
c.colors.completion.even.bg                     = gruvbox_dark["bg2"]
c.colors.completion.category.fg                 = gruvbox_dark["bg0"]
c.colors.completion.category.bg                 = gruvbox_dark["purple"]
c.colors.completion.category.border.top         = gruvbox_dark["purple"]
c.colors.completion.category.border.bottom      = gruvbox_dark["bg0"]
c.colors.completion.item.selected.fg            = gruvbox_dark["bg0"]
c.colors.completion.item.selected.bg            = gruvbox_dark["fg0"]
c.colors.completion.item.selected.border.top    = gruvbox_dark["bg2"]
c.colors.completion.item.selected.border.bottom = gruvbox_dark["bg2"]
c.colors.completion.item.selected.match.fg      = gruvbox_dark["bg0"]
c.colors.completion.match.fg                    = gruvbox_dark["green"]
c.colors.completion.scrollbar.fg                = gruvbox_dark["bg3"]
c.colors.completion.scrollbar.bg                = gruvbox_dark["bg0"]

# --- Downloads ---
c.colors.downloads.bar.bg = gruvbox_dark["bg2"]
c.colors.downloads.error.bg = gruvbox_dark["red"]

# --- Hints ---
c.colors.hints.bg       = gruvbox_dark["yellow"]
c.colors.hints.fg       = gruvbox_dark["bg0"]
c.colors.hints.match.fg = gruvbox_dark["red"]

# --- Messages ---
c.colors.messages.info.bg    = gruvbox_dark["bg3"]
c.colors.messages.info.fg    = gruvbox_dark["fg0"]
c.colors.messages.error.bg   = gruvbox_dark["red"]
c.colors.messages.error.fg   = gruvbox_dark["bg0"]
c.colors.messages.warning.bg = gruvbox_dark["orange"]
c.colors.messages.warning.fg = gruvbox_dark["bg0"]

# --- Prompts ---
c.colors.prompts.bg          = gruvbox_dark["bg0"]
c.colors.prompts.selected.bg = gruvbox_dark["bg2"]
c.colors.prompts.fg          = gruvbox_dark["fg0"]

# --- Statusbar ---
c.colors.statusbar.normal.bg          = gruvbox_dark["bg0"]
c.colors.statusbar.normal.fg          = gruvbox_dark["fg0"]
c.colors.statusbar.insert.fg          = gruvbox_dark["bg0"]
c.colors.statusbar.insert.bg          = gruvbox_dark["green"]
c.colors.statusbar.passthrough.bg     = gruvbox_dark["bg0"]
c.colors.statusbar.command.bg         = gruvbox_dark["bg2"]
c.colors.statusbar.command.fg         = gruvbox_dark["fg0"]
c.colors.statusbar.command.private.bg = gruvbox_dark["bg2"]
c.colors.statusbar.command.private.fg = gruvbox_dark["fg0"]
c.colors.statusbar.private.bg         = gruvbox_dark["yellow"]
c.colors.statusbar.private.fg         = gruvbox_dark["bg0"]
c.colors.statusbar.url.warn.fg        = gruvbox_dark["orange"]

# --- Tabs ---
c.colors.tabs.bar.bg                  = gruvbox_dark["bg0"]
c.colors.tabs.odd.bg                  = gruvbox_dark["bg0"]
c.colors.tabs.even.bg                 = gruvbox_dark["bg0"]
c.colors.tabs.selected.odd.bg         = gruvbox_dark["bg2"]
c.colors.tabs.selected.odd.fg         = gruvbox_dark["fg0"]
c.colors.tabs.selected.even.bg        = gruvbox_dark["bg2"]
c.colors.tabs.selected.even.fg        = gruvbox_dark["fg0"]
c.colors.tabs.pinned.odd.bg           = gruvbox_dark["bg0"]
c.colors.tabs.pinned.even.bg          = gruvbox_dark["bg0"]
c.colors.tabs.pinned.selected.odd.bg  = gruvbox_dark["bg2"]
c.colors.tabs.pinned.selected.even.bg = gruvbox_dark["bg2"]

################
# FONT SETTING #
################
c.fonts.default_family   = '16px "JetBrainsMonoNL Nerd Font"'
c.fonts.default_size     = '16px'
c.fonts.contextmenu      = '16px "JetBrainsMonoNL Nerd Font"'
c.fonts.completion.entry = '16px "JetBrainsMonoNL Nerd Font"'    # Font used in the completion widget.
c.fonts.debug_console    = '16px "JetBrainsMonoNL Nerd Font"'       # Font used for the debugging console.
c.fonts.prompts          = 'default_size JetBrainsMonoNL Nerd Font'       # Font used for prompts.
c.fonts.statusbar        = '16px "JetBrainsMonoNL Nerd Font"'           # Font used in the statusbar.


################################
# KEY BINDINGS FOR NORMAL MODE #
################################

config.bind('gh', 'home')
config.bind('ch', 'history-clear')
config.bind('J', 'tab-prev')
config.bind('K', 'tab-next')
config.bind('D', 'tab-only')
config.bind('ww', 'open -w')
config.bind('r', 'reload')
config.bind('R', 'config-source')

config.bind(';i', 'set downloads.location.directory ~/Pictures ;; hint links download')
config.bind(';I', 'set downloads.location.directory ~/Pictures ;; hint images download')
config.bind(';D', 'set downloads.location.directory ~/Documents ;; hint links download')
config.bind(';d', 'set downloads.location.directory ~/Downloads ;; hint links download')
config.bind(';x', 'set downloads.location.directory ~/Downloads/.cache ;; hint links download')
config.bind(';X', 'set downloads.location.directory ~/Downloads/.cache ;; hint images download')
config.bind(';v', 'set downloads.location.directory ~/Videos ;; hint links download')

config.bind('xb', 'config-cycle statusbar.show always never')
config.bind('xt', 'config-cycle tabs.show multiple never')
config.bind('xx', 'config-cycle statusbar.show always never;; config-cycle tabs.show multiple never')
config.bind('td', 'devtools')
