local colors = require("colors")

return {
   -- The default text color
   foreground = colors.fg,
   -- The default background color
   background = colors.bg,

   -- Overrides the cell background color when the current cell is occupied by the
   -- cursor and the cursor style is set to Block
   cursor_bg = colors.cyan,
   -- Overrides the text color when the current cell is occupied by the cursor
   cursor_fg = colors.black,
   -- Specifies the border color of the cursor when the cursor style is set to Block,
   -- or the color of the vertical or horizontal bar when the cursor style is set to
   -- Bar or Underline.
   cursor_border = colors.green,

   -- the foreground color of selected text
   selection_fg = colors.fg,
   -- the background color of selected text
   selection_bg = colors.grey,

   -- The color of the scrollbar "thumb"; the portion that represents the current viewport
   scrollbar_thumb = '#222222',

   -- The color of the split lines between panes
   split = colors.bg,

   ansi = {
      colors.black ,
      colors.red,
      colors.green ,
      colors.yellow ,
      colors.blue  ,
      colors.purple ,
      colors.cyan  ,
      colors.white ,
   },
   brights = {
      colors.grey ,
      colors.light_red,
      colors.light_green ,
      colors.light_yellow ,
      colors.light_blue  ,
      colors.light_purple ,
      colors.light_cyan  ,
      colors.light_white ,
   },

   -- Colors for copy_mode and quick_select
   -- available since: 20220807-113146-c2fee766
   -- In copy_mode, the color of the active text is:
   -- 1. copy_mode_active_highlight_* if additional text was selected using the mouse
   -- 2. selection_* otherwise
   copy_mode_active_highlight_bg = { Color = colors.green },
   -- use `AnsiColor` to specify one of the ansi color palette values
   -- (index 0-15) using one of the names "Black", "Maroon", "Green",
   --  "Olive", "Navy", "Purple", "Teal", "Silver", "Grey", "Red", "Lime",
   -- "Yellow", "Blue", "Fuchsia", "Aqua" or "White".
   copy_mode_active_highlight_fg = { Color = colors.light_white },
   copy_mode_inactive_highlight_bg = { Color = '#52ad70' },
   copy_mode_inactive_highlight_fg = { AnsiColor = 'White' },

   quick_select_label_bg = { Color = colors.red },
   quick_select_label_fg = { Color = colors.fg },
   quick_select_match_bg = { AnsiColor = 'Navy' },
   quick_select_match_fg = { Color = colors.fg },

   tab_bar = {
      background = colors.bg1,

      -- The active tab is the one that has focus in the window
      active_tab = {
         -- The color of the background area for the tab
         bg_color = colors.bg1,
         -- The color of the text for the tab
         fg_color = colors.yellow,

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
         bg_color = colors.bg1,
         fg_color = colors.fg,

         -- The same options that were listed under the `active_tab` section above
         -- can also be used for `inactive_tab`.
      },

      -- You can configure some alternate styling when the mouse pointer
      -- moves over inactive tabs
      inactive_tab_hover = {
         bg_color = colors.grey,
         fg_color = colors.fg,
         italic = false,

         -- The same options that were listed under the `active_tab` section above
         -- can also be used for `inactive_tab_hover`.
      },

      -- The new tab button that let you create new tabs
      new_tab = {
         bg_color = colors.bg1,
         fg_color = '#808080',

         -- The same options that were listed under the `active_tab` section above
         -- can also be used for `new_tab`.
      },

      -- You can configure some alternate styling when the mouse pointer
      -- moves over the new tab button
      new_tab_hover = {
         bg_color = colors.grey,
         fg_color = '#909090',
         italic = false,

         -- The same options that were listed under the `active_tab` section above
         -- can also be used for `new_tab_hover`.
      },
   },
}
