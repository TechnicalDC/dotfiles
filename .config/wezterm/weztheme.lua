local colors = require("colors")
-- local hex_re = vim.regex('#\\x\\x\\x\\x\\x\\x')

local HEX_DIGITS = {
    ['0'] = 0,
    ['1'] = 1,
    ['2'] = 2,
    ['3'] = 3,
    ['4'] = 4,
    ['5'] = 5,
    ['6'] = 6,
    ['7'] = 7,
    ['8'] = 8,
    ['9'] = 9,
    ['a'] = 10,
    ['b'] = 11,
    ['c'] = 12,
    ['d'] = 13,
    ['e'] = 14,
    ['f'] = 15,
    ['A'] = 10,
    ['B'] = 11,
    ['C'] = 12,
    ['D'] = 13,
    ['E'] = 14,
    ['F'] = 15,
}

return {
   -- The default text color
   foreground = colors.base05,
   -- The default background color
   background = colors.base00,

   -- Overrides the cell background color when the current cell is occupied by the
   -- cursor and the cursor style is set to Block
   cursor_bg = colors.base0B,
   -- Overrides the text color when the current cell is occupied by the cursor
   cursor_fg = colors.base00,
   -- Specifies the border color of the cursor when the cursor style is set to Block,
   -- or the color of the vertical or horizontal bar when the cursor style is set to
   -- Bar or Underline.
   cursor_border = colors.base0B,

   -- the foreground color of selected text
   selection_fg = colors.base0B,
   -- the background color of selected text
   selection_bg = colors.base02,

   -- The color of the scrollbar "thumb"; the portion that represents the current viewport
   scrollbar_thumb = '#222222',

   -- The color of the split lines between panes
   split = colors.base00,

   ansi = {
      colors.base00,
      colors.base08,
      colors.base0B,
      colors.base0A,
      colors.base0D,
      colors.base0E,
      colors.base0C,
      colors.base07,
   },
   brights = {
      colors.base01,
      colors.base08,
      colors.base0B,
      colors.base0A,
      colors.base0D,
      colors.base0E,
      colors.base0C,
      colors.base07,
   },

   -- Colors for copy_mode and quick_select
   -- available since: 20220807-113146-c2fee766
   -- In copy_mode, the color of the active text is:
   -- 1. copy_mode_active_highlight_* if additional text was selected using the mouse
   -- 2. selection_* otherwise
   copy_mode_active_highlight_bg = { Color = colors.base02 },
   -- use `AnsiColor` to specify one of the ansi color palette values
   -- (index 0-15) using one of the names "Black", "Maroon", "Green",
   --  "Olive", "Navy", "Purple", "Teal", "Silver", "Grey", "Red", "Lime",
   -- "Yellow", "Blue", "Fuchsia", "Aqua" or "White".
   copy_mode_active_highlight_fg = { Color = colors.base0F },
   copy_mode_inactive_highlight_bg = { Color = '#52ad70' },
   copy_mode_inactive_highlight_fg = { AnsiColor = 'White' },

   quick_select_label_bg = { Color = 'red' },
   quick_select_label_fg = { Color = '#ffffff' },
   quick_select_match_bg = { AnsiColor = 'Navy' },
   quick_select_match_fg = { Color = '#ffffff' },

   tab_bar = {
      background = colors.base00,

      -- The active tab is the one that has focus in the window
      active_tab = {
         -- The color of the background area for the tab
         bg_color = colors.base02,
         -- The color of the text for the tab
         fg_color = colors.base05,

         -- Specify whether you want "Half", "Normal" or "Bold" intensity for the
         -- label shown for this tab.
         -- The default is "Normal"
         intensity = 'Bold',

         -- Specify whether you want "None", "Single" or "Double" underline for
         -- label shown for this tab.
         -- The default is "None"
         underline = 'None',

         -- Specify whether you want the text to be italic (true) or not (false)
         -- for this tab.  The default is false.
         italic = true,

         -- Specify whether you want the text to be rendered with strikethrough (true)
         -- or not for this tab.  The default is false.
         strikethrough = false,
      },

      -- Inactive tabs are the tabs that do not have focus
      inactive_tab = {
         bg_color = colors.base00,
         fg_color = '#808080',

         -- The same options that were listed under the `active_tab` section above
         -- can also be used for `inactive_tab`.
      },

      -- You can configure some alternate styling when the mouse pointer
      -- moves over inactive tabs
      inactive_tab_hover = {
         bg_color = colors.base02,
         fg_color = '#909090',
         italic = false,

         -- The same options that were listed under the `active_tab` section above
         -- can also be used for `inactive_tab_hover`.
      },

      -- The new tab button that let you create new tabs
      new_tab = {
         bg_color = colors.base00,
         fg_color = '#808080',

         -- The same options that were listed under the `active_tab` section above
         -- can also be used for `new_tab`.
      },

      -- You can configure some alternate styling when the mouse pointer
      -- moves over the new tab button
      new_tab_hover = {
         bg_color = colors.base02,
         fg_color = '#909090',
         italic = false,

         -- The same options that were listed under the `active_tab` section above
         -- can also be used for `new_tab_hover`.
      },
   },
}
