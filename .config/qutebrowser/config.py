#               __          __
# .-----.--.--.|  |_.-----.|  |--.----.-----.--.--.--.-----.-----.----.
# |  _  |  |  ||   _|  -__||  _  |   _|  _  |  |  |  |__ --|  -__|   _|
# |__   |_____||____|_____||_____|__| |_____|________|_____|_____|__|
#    |__|


import os
import subprocess
import catppuccin

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

# Quick hack to theme duckduckgo pages
ddg_theme = 'https://duckduckgo.com/?q={}' # &kj=' + xresources["*.color4"]      # catppuccin_colors["mauve"] color
# ddg_theme = ddg_theme + '&k7=' + xresources["*.catppuccin_colors["base"]"]                  # Hover color
# ddg_theme = ddg_theme + '&k21=' + xresources["*.catppuccin_colors["base"]"]                 # Background color
# ddg_theme = ddg_theme + '&kx=' + xresources["*.color5"]                      # URL color
# ddg_theme = ddg_theme + '&k8=' + xresources["*.color5"]                      # Snippet color
# ddg_theme = ddg_theme + '&k9=' + xresources["*.color2"]                      # Link color
# ddg_theme = ddg_theme + '&kaa=' + xresources["*.color2"]                     # Visited link color
# ddg_theme = ddg_theme + '&ko=s'                                              # catppuccin_colors["mauve"] setting

#################
# MAIN SETTINGS #
#################

# load your autoconfig, use this, if the rest of your config is empty!
config.load_autoconfig()

# set the flavor you'd like to use
# valid options are 'mocha', 'macchiato', 'frappe', and 'latte'
# last argument (optional, default is False): enable the plain look for the menu rows
catppuccin.setup(c, 'macchiato', True)

c.aliases = {'q': 'quit', 'w': 'session-save', 'wq': 'quit --save', 'r': 'restart'}
c.downloads.location.directory = '/home/dilip/Downloads'
c.url.searchengines = {
        'DEFAULT': ddg_theme,
        'wk':'https://en.wikipedia.org/wiki/{}',
        'rd':'https://www.reddit.com/search/?q={}',
        'yt': 'https://www.youtube.com/results?search_query={}',
        'amz':'https://www.amazon.in/s/ref=nb_sb_noss?url=search-alias%3Daps&field-keywords={}'
}
# c.url.default_page = '/home/dilip/.cache/StartTree/index.html'
# c.url.start_pages = '/home/dilip/.cache/StartTree/index.html'
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
c.colors.webpage.bg = catppuccin_colors["base"]

c.colors.webpage.darkmode.enabled = True

# --- Context menu ---
c.colors.contextmenu.menu.bg = catppuccin_colors["base"]
c.colors.contextmenu.menu.fg = catppuccin_colors["text"]
c.colors.contextmenu.selected.bg = catppuccin_colors["surface0"]
c.colors.contextmenu.selected.fg = catppuccin_colors["base"]

# --- Completions ---
c.colors.completion.fg = catppuccin_colors["text"]
c.colors.completion.odd.bg = catppuccin_colors["base"]
c.colors.completion.even.bg = catppuccin_colors["surface0"]
c.colors.completion.category.fg = catppuccin_colors["base"]
c.colors.completion.category.bg = catppuccin_colors["mauve"]
c.colors.completion.category.border.top = catppuccin_colors["mauve"]
c.colors.completion.category.border.bottom = catppuccin_colors["base"]
c.colors.completion.item.selected.fg = catppuccin_colors["base"]
c.colors.completion.item.selected.bg = catppuccin_colors["text"]
c.colors.completion.item.selected.border.top = catppuccin_colors["surface0"]
c.colors.completion.item.selected.border.bottom = catppuccin_colors["surface0"]
c.colors.completion.item.selected.match.fg = catppuccin_colors["base"]
c.colors.completion.match.fg = catppuccin_colors["green"]
c.colors.completion.scrollbar.fg = catppuccin_colors["surface1"]
c.colors.completion.scrollbar.bg = catppuccin_colors["base"]

# --- Downloads ---
c.colors.downloads.bar.bg = catppuccin_colors["surface0"]
c.colors.downloads.error.bg = catppuccin_colors["red"]

# --- Hints ---
c.colors.hints.bg = catppuccin_colors["yellow"]
c.colors.hints.fg = catppuccin_colors["base"]
c.colors.hints.match.fg = catppuccin_colors["red"]

# --- Messages ---
c.colors.messages.info.bg = catppuccin_colors["surface0"]
c.colors.messages.info.fg = catppuccin_colors["base"]
c.colors.messages.error.bg = catppuccin_colors["red"]
c.colors.messages.error.fg = catppuccin_colors["text"]
c.colors.messages.warning.bg = catppuccin_colors["peach"]
c.colors.messages.warning.fg = catppuccin_colors["base"]

# --- Prompts ---
c.colors.prompts.bg = catppuccin_colors["base"]
c.colors.prompts.selected.bg = catppuccin_colors["surface0"]
c.colors.prompts.fg = catppuccin_colors["text"]

# --- Statusbar ---
c.colors.statusbar.normal.bg = catppuccin_colors["base"]
c.colors.statusbar.normal.fg = catppuccin_colors["text"]
c.colors.statusbar.insert.fg = catppuccin_colors["base"]
c.colors.statusbar.insert.bg = catppuccin_colors["green"]
c.colors.statusbar.passthrough.bg = catppuccin_colors["base"]
c.colors.statusbar.command.bg = catppuccin_colors["surface0"]
c.colors.statusbar.command.fg = catppuccin_colors["text"]
c.colors.statusbar.command.private.bg = catppuccin_colors["surface0"]
c.colors.statusbar.command.private.fg = catppuccin_colors["text"]
c.colors.statusbar.private.bg = catppuccin_colors["yellow"]
c.colors.statusbar.private.fg = catppuccin_colors["base"]
c.colors.statusbar.url.warn.fg = catppuccin_colors["peach"]

# --- Tabs ---
c.colors.tabs.bar.bg = catppuccin_colors["base"]
c.colors.tabs.odd.bg = catppuccin_colors["base"]
c.colors.tabs.even.bg = catppuccin_colors["base"]
c.colors.tabs.selected.odd.bg = catppuccin_colors["surface0"]
c.colors.tabs.selected.odd.fg = catppuccin_colors["text"]
c.colors.tabs.selected.even.bg = catppuccin_colors["surface0"]
c.colors.tabs.selected.even.fg = catppuccin_colors["text"]
c.colors.tabs.pinned.odd.bg = catppuccin_colors["base"]
c.colors.tabs.pinned.even.bg = catppuccin_colors["base"]
c.colors.tabs.pinned.selected.odd.bg = catppuccin_colors["surface0"]
c.colors.tabs.pinned.selected.even.bg = catppuccin_colors["surface0"]


################
# FONT SETTING #
################

c.fonts.default_family = '14px "JetBrainsMonoNL Nerd Font"'
c.fonts.default_size = '14px'
c.fonts.contextmenu = '14px "JetBrainsMonoNL Nerd Font"'
c.fonts.completion.entry = '14px "JetBrainsMonoNL Nerd Font"'    # Font used in the completion widget.
c.fonts.debug_console = '14px "JetBrainsMonoNL Nerd Font"'       # Font used for the debugging console.
c.fonts.prompts = 'default_size JetBrainsMonoNL Nerd Font'       # Font used for prompts.
c.fonts.statusbar = '14px "JetBrainsMonoNL Nerd Font"'           # Font used in the statusbar.


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
config.bind(';v', 'set downloads.location.directory ~/Videos ;; hint links download')

config.bind('xb', 'config-cycle statusbar.show always never')
config.bind('xt', 'config-cycle tabs.show multiple never')
config.bind('xx', 'config-cycle statusbar.show always never;; config-cycle tabs.show multiple never')
config.bind('td', 'devtools')
