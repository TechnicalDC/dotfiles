local colors = require("mini")

return {
   foreground = colors.fg,
   background = colors.bg,
   cursor_bg = colors.fg,
   cursor_fg = colors.bg,
   cursor_border = colors.fg,

   selection_fg = colors.fg,
   selection_bg = colors.fg_edge,

   scrollbar_thumb = '#222222',

   split = colors.bg_mid,

   ansi = {
      colors.bg_mid2,
      colors.red,
      colors.green,
      colors.orange,
      colors.blue,
      colors.purple,
      colors.cyan,
      colors.fg_edge,
   },
   brights = {
      colors.bg_mid2,
      colors.red,
      colors.green,
      colors.orange,
      colors.blue,
      colors.purple,
      colors.cyan,
      colors.fg_edge,
   },

   copy_mode_active_highlight_bg = { Color = colors.green },
   copy_mode_active_highlight_fg = { Color = colors.fg },
   copy_mode_inactive_highlight_bg = { Color = '#52ad70' },
   copy_mode_inactive_highlight_fg = { AnsiColor = 'White' },

   quick_select_label_bg = { Color = colors.red },
   quick_select_label_fg = { Color = colors.fg },
   quick_select_match_bg = { AnsiColor = 'Navy' },
   quick_select_match_fg = { Color = colors.fg },

   tab_bar = {
      background = colors.bg_mid,
      active_tab = {
         bg_color = colors.bg_mid2,
         fg_color = colors.fg,
         intensity = 'Bold',
         underline = 'None',
         italic = false,
         strikethrough = false,
      },

      inactive_tab = {
         bg_color = colors.bg_mid,
         fg_color = colors.fg,
      },

      inactive_tab_hover = {
         bg_color = colors.bg_mid2,
         fg_color = colors.fg,
         italic = false,
      },

      new_tab = {
         bg_color = colors.bg_mid,
         fg_color = colors.fg,
      },

      new_tab_hover = {
         bg_color = colors.bg_mid2,
         fg_color = colors.fg,
         italic = false,
      },
   },
}
