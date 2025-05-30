#               __          __
# .-----.--.--.|  |_.-----.|  |--.----.-----.--.--.--.-----.-----.----.
# |  _  |  |  ||   _|  -__||  _  |   _|  _  |  |  |  |__ --|  -__|   _|
# |__   |_____||____|_____||_____|__| |_____|________|_____|_____|__|
#    |__|

from colors import mini
import os
import subprocess

#################
# MAIN SETTINGS #
#################

# load your autoconfig, use this, if the rest of your config is empty!
config.load_autoconfig()

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
# c.url.default_page = '/home/dilip/.config/qutebrowser/fluidity/index.html'
# c.url.start_pages = '/home/dilip/.config/qutebrowser/fluidity/index.html'
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
c.tabs.padding = {"bottom":4, "left":5, "right":5, "top":4}
c.tabs.favicons.show = 'never'    # valuse: always, never

# --- Scrolling ---
c.scrolling.smooth = False

# --- Scrollbar ---
c.completion.scrollbar.width = 12
c.completion.scrollbar.padding = 4

# --- Statusbar ---
c.statusbar.padding = {"bottom":4, "left":5, "right":5, "top":4}

###########################
# UI COLROS CONFIGURATION #
###########################
# --- Custom CSS ---
# config.set("content.user_stylesheets","~/.config/qutebrowser/stylesheets/wal-duckduckgo.com.css")

# --- Webpages ---
c.colors.webpage.bg = mini["bg"]

c.colors.webpage.darkmode.enabled = True

# --- Context menu ---
c.colors.contextmenu.menu.bg     = mini["bg_edge"]
c.colors.contextmenu.menu.fg     = mini["fg"]
c.colors.contextmenu.selected.bg = mini["bg_mid"]
c.colors.contextmenu.selected.fg = mini["fg"]

# --- Completions ---
c.colors.completion.fg                          = mini["fg"]
c.colors.completion.odd.bg                      = mini["bg_edge"]
c.colors.completion.even.bg                     = mini["bg_edge"]
c.colors.completion.category.fg                 = mini["fg"]
c.colors.completion.category.bg                 = mini["bg_mid2"]
c.colors.completion.category.border.top         = mini["bg_mid2"]
c.colors.completion.category.border.bottom      = mini["bg"]
c.colors.completion.item.selected.fg            = mini["fg"]
c.colors.completion.item.selected.bg            = mini["bg_mid"]
c.colors.completion.item.selected.border.top    = mini["bg_mid"]
c.colors.completion.item.selected.border.bottom = mini["bg_mid"]
c.colors.completion.item.selected.match.fg      = mini["fg_edge"]
c.colors.completion.match.fg                    = mini["green"]
c.colors.completion.scrollbar.fg                = mini["bg_mid2"]
c.colors.completion.scrollbar.bg                = mini["bg"]

# --- Downloads ---
c.colors.downloads.bar.bg = mini["bg"]
c.colors.downloads.error.bg = mini["red"]

# --- Hints ---
c.colors.hints.bg       = mini["yellow"]
c.colors.hints.fg       = mini["bg"]
c.colors.hints.match.fg = mini["red"]

# --- Messages ---
c.colors.messages.info.bg    = mini["bg"]
c.colors.messages.info.fg    = mini["fg"]
c.colors.messages.error.bg   = mini["red"]
c.colors.messages.error.fg   = mini["fg"]
c.colors.messages.warning.bg = mini["orange"]
c.colors.messages.warning.fg = mini["fg"]

# --- Prompts ---
c.colors.prompts.bg          = mini["bg"]
c.colors.prompts.selected.bg = mini["bg_mid"]
c.colors.prompts.fg          = mini["fg"]

# --- Statusbar ---
c.colors.statusbar.normal.bg          = mini["bg"]
c.colors.statusbar.normal.fg          = mini["fg"]
c.colors.statusbar.insert.fg          = mini["bg"]
c.colors.statusbar.insert.bg          = mini["green"]
c.colors.statusbar.passthrough.bg     = mini["bg"]
c.colors.statusbar.command.bg         = mini["bg"]
c.colors.statusbar.command.fg         = mini["fg"]
c.colors.statusbar.command.private.bg = mini["bg"]
c.colors.statusbar.command.private.fg = mini["fg"]
c.colors.statusbar.private.bg         = mini["yellow"]
c.colors.statusbar.private.fg         = mini["bg"]
c.colors.statusbar.url.warn.fg        = mini["orange"]

# --- Tabs ---
c.colors.tabs.bar.bg                  = mini["bg"]
c.colors.tabs.odd.bg                  = mini["bg"]
c.colors.tabs.even.bg                 = mini["bg"]
c.colors.tabs.selected.odd.bg         = mini["bg_mid2"]
c.colors.tabs.selected.odd.fg         = mini["fg"]
c.colors.tabs.selected.even.bg        = mini["bg_mid2"]
c.colors.tabs.selected.even.fg        = mini["fg"]
c.colors.tabs.pinned.odd.bg           = mini["bg"]
c.colors.tabs.pinned.even.bg          = mini["bg"]
c.colors.tabs.pinned.selected.odd.bg  = mini["bg_mid2"]
c.colors.tabs.pinned.selected.even.bg = mini["bg_mid2"]

################
# FONT SETTING #
################
font = '18px "Iosevka Nerd Font"'
c.fonts.default_family   = font
c.fonts.default_size     = '20px'
c.fonts.contextmenu         = font
c.fonts.completion.category = font
c.fonts.completion.entry    = font
c.fonts.debug_console       = font
c.fonts.prompts             = font
c.fonts.statusbar           = font
c.fonts.downloads           = font
c.fonts.hints               = font
c.fonts.keyhint             = font
c.fonts.messages.error      = font
c.fonts.messages.info       = font
c.fonts.messages.warning    = font
c.fonts.tabs.selected        = font
c.fonts.tabs.unselected      = font


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
