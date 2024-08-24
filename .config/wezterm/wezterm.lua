---@diagnostic disable: unused-local
-- DEFINITIONS {{{
local wezterm = require 'wezterm'
local action = wezterm.action
local mux = wezterm.mux
local resize_step = 5
local theme = require("weztheme")
local colors = require("colors")

local direction_keys = {
   Left = 'h',
   Down = 'j',
   Up = 'k',
   Right = 'l',
   -- reverse lookup
   h = 'Left',
   j = 'Down',
   k = 'Up',
   l = 'Right',
}

local home = wezterm.home_dir
local workspaces = {
   { id = home, label = 'Home ' },
   { id = home .. '\\Desktop\\WORK', label = 'Work ' },
   { id = home .. '\\AppData\\Local\\nvim', label = 'Neovim ' },
}
local launch_items = {
   {
      label = "Edit host file",
      args = { "nvim", "C:\\Windows\\System32\\drivers\\etc\\hosts" }
   },
}
-- }}}

-- HELPER FUNCTIONS {{{
-- if you are *NOT* lazy-loading smart-splits.nvim (recommended)
local function is_vim(pane)
   -- this is set by the plugin, and unset on ExitPre in Neovim
   return pane:get_user_vars().IS_NVIM == 'true'
end

local function split_nav(resize_or_move, key)
   return {
      key = key,
      mods = resize_or_move == 'resize' and 'META' or 'CTRL',
      action = wezterm.action_callback(function(win, pane)
         if is_vim(pane) then
            -- pass the keys through to vim/nvim
            win:perform_action({
               SendKey = { key = key, mods = resize_or_move == 'resize' and 'META' or 'CTRL' },
            }, pane)
         else
            if resize_or_move == 'resize' then
               win:perform_action({ AdjustPaneSize = { direction_keys[key], 3 } }, pane)
            else
               win:perform_action({ ActivatePaneDirection = direction_keys[key] }, pane)
            end
         end
      end),
   }
end

wezterm.on('gui-startup', function()
   local tab, pane, window = mux.spawn_window({})
   window:gui_window():maximize()
end)

-- This function returns the suggested title for a tab.
-- It prefers the title that was set via `tab:set_title()`
-- or `wezterm cli set-tab-title`, but falls back to the
-- title of the active pane in that tab.
local function tab_title(tab_info)
   local title = tab_info.tab_title
   -- if the tab title is explicitly set, take that
   if title and #title > 0 then
      title = title:gsub( "\\", " ")
      return title
   end
   -- Otherwise, use the title from the active pane
   -- in that tab
   title = tab_info.active_pane.title
   title = title:gsub( "\\", " ")
   title = title:gsub( ".exe", "")
   return title
end

wezterm.on( 'format-tab-title', function(tab, tabs, panes, config, hover, max_width)
   local title_icon = {
      cmd = ' ',
      wezterm = ' ',
      powershell = '󰨊 ',
      starship = ' ',
      nvim = ' ',
      zoxide = ' 󰘶 ',
      ssh = '󰒋 ',
      Debug = ' ',
      Launcher = ' ',
      Default = ' ',
   }
   local title_name = tab_title(tab)

   if string.len(title_name) >= 20  then
      title_name = string.sub(title_name, 1, 20) .. '...'
   end
   return '  ' .. title_name .. ' '
end)
-- }}}

-- TAB BAR THEME {{{
wezterm.on('update-right-status', function(window, pane)
   local time = wezterm.strftime("%H:%M:%S")
   local stat = window:active_workspace()
   local hostname = wezterm.hostname()
   local battery = ''

   for _, b in ipairs(wezterm.battery_info()) do
      if b.state_of_charge * 100 <= 100 and b.state_of_charge * 100 > 75 then
         battery = '  ' .. string.format('%.0f%%', b.state_of_charge * 100)
      end
      if b.state_of_charge * 100 <= 75 and b.state_of_charge * 100 > 60 then
         battery = '  ' .. string.format('%.0f%%', b.state_of_charge * 100)
      end
      if b.state_of_charge * 100 <= 60 and b.state_of_charge * 100 > 40 then
         battery = '  ' .. string.format('%.0f%%', b.state_of_charge * 100)
      end
      if b.state_of_charge * 100 <= 40 and b.state_of_charge * 100 > 15 then
         battery = '  ' .. string.format('%.0f%%', b.state_of_charge * 100)
      end
      if b.state_of_charge * 100 <= 15 then
         battery = '  ' .. string.format('%.0f%%', b.state_of_charge * 100)
      end

      if b.state == "Charging" then
         battery = battery .. ' '
      end
   end

   -- Left status (left of the tab line)
   window:set_left_status(wezterm.format({
      { Background = { Color = colors.base0D } },
      { Foreground = { Color = colors.base00 } },
      { Text = " " },
      { Text = " " .. stat },
      { Text = " " },
      "ResetAttributes",
   }))
   -- Make it italic and underlined
   window:set_right_status(wezterm.format {
      { Background = { Color = colors.base0D } },
      { Foreground = { Color = colors.base00 } },
      { Attribute = { Italic = false } },
      { Text = " " },
      { Text = battery },
      { Text = " " },
      { Text = '  ' .. time .. ' ' },
      "ResetAttributes",
   })
end)
-- }}}

-- CONFIG {{{
local config = {}

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
   config = wezterm.config_builder()
end

config.enable_wayland                              = false
config.default_prog                                = { 'fish' }
config.default_cwd                                 = '/home/dilip/'
config.default_domain                              = "local"
config.default_workspace                           = "default"
config.term                                        = "xterm"
-- config.font                                        = wezterm.font "FantasqueSansMono Nerd Font"
config.font                                        = wezterm.font "JetBrainsMonoNL Nerd Font"
-- config.font                                     = wezterm.font 'Iosevka NF'
config.font_size                                   = 12
config.default_cursor_style                        = 'SteadyBlock'
config.line_height                                 = 1.4
-- config.colors                                      = theme
config.color_scheme          = 'Catppuccin Macchiato'
config.scrollback_lines      = 10000
config.detect_password_input = true
config.scroll_to_bottom_on_input                   = true
config.show_update_window                          = true
config.quote_dropped_files                         = "WindowsAlwaysQuoted"
config.enable_tab_bar                              = true
config.use_fancy_tab_bar                           = false
config.hide_tab_bar_if_only_one_tab                = true
config.prefer_to_spawn_tabs                        = true
config.tab_bar_at_bottom                           = false
config.tab_max_width                               = 30
config.disable_default_key_bindings                = true
config.disable_default_mouse_bindings              = false
config.adjust_window_size_when_changing_font_size  = false
config.force_reverse_video_cursor                  = false
config.hide_mouse_cursor_when_typing               = true
config.window_close_confirmation                   = 'NeverPrompt'
config.window_decorations                          = "RESIZE"
config.show_tab_index_in_tab_bar                   = false
config.switch_to_last_active_tab_when_closing_tab  = true
config.hyperlink_rules                             = wezterm.default_hyperlink_rules()
config.pane_focus_follows_mouse                    = false
config.default_mux_server_domain                = "local"
config.skip_close_confirmation_for_processes_named = {
   'bash',
   'sh',
   'zsh',
   'fish',
   'starship',
   'zoxide',
   'nu',
   'cmd.exe',
   'pwsh.exe',
   'powershell.exe',
}
-- config.window_background_opacity = 1.0
-- config.window_background_image = "C:\\Users\\Dilip Chauhan\\Pictures\\onedark-wallpapers\\misc\\od_current_blurred.png"
config.win32_system_backdrop     = 'Acrylic'
config.command_palette_font_size = config.font_size
config.char_select_font_size     = config.font_size
config.inactive_pane_hsb         = {
   saturation = 1.0,
   brightness = 1.0,
}

config.window_padding = {
   left   = 20,
   right  = 20,
   top    = 20,
   bottom = 20,
}
config.launch_menu = launch_items
-- config.ssh_backend = "Ssh2"
config.ssh_backend = "LibSsh"
-- config.ssh_domains = wezterm.enumerate_ssh_hosts()
-- }}}

-- KEYBINDINGS {{{
config.keys = {
   { action = action.CopyTo    'Clipboard' 								, mods = 'CTRL|SHIFT', key =     'C' },
   { action = action.DecreaseFontSize      								, mods =       'CTRL', key =     '-' },
   { action = action.IncreaseFontSize      								, mods =       'CTRL', key =     '=' },
   { action = action.Nop                   								, mods =        'ALT', key = 'Enter' },
   { action = action.PasteFrom 'Clipboard' 								, mods = 'CTRL|SHIFT', key =     'V' },
   { action = action.ResetFontSize         								, mods =       'CTRL', key =     '0' },
   { action = action.ActivateCopyMode         							, mods = 'CTRL|SHIFT', key =     'X' },
   { action = action.TogglePaneZoomState        						, mods = 'CTRL|SHIFT', key =     'Z' },
   { action = action.ToggleFullScreen      								                     , key =   'F11' },
   { action = action.SpawnTab "CurrentPaneDomain"						, mods = 'CTRL|SHIFT', key =	   'T' },
   { action = action.CloseCurrentPane{confirm=true}					, mods = 'CTRL|SHIFT', key =	   'Q' },
   { action = action.ShowLauncherArgs {flags="FUZZY|DOMAINS", title = " Domains "}     , mods =	'CTRL|SHIFT', key =		'A' },
   { action = action.ShowLauncherArgs {flags="FUZZY|WORKSPACES", title = " Workspace "}     , mods =	'CTRL|SHIFT', key =		'W' },
   { action = action.ShowLauncherArgs {flags="FUZZY|LAUNCH_MENU_ITEMS", title = " Launcher "}     , mods =	'CTRL|SHIFT', key =		'?' },
   { action = action.ShowLauncherArgs {flags="FUZZY|COMMANDS", title = " Commands "}   , mods =	'CTRL|SHIFT', key =		':' },
   { action = action.SplitHorizontal {domain="CurrentPaneDomain"} , mods = 'CTRL|SHIFT', key =	   '|' },
   { action = action.SplitVertical {domain="CurrentPaneDomain"}	, mods = 'CTRL|SHIFT', key =		'_' },
   { action = action.ActivateTabRelative(1)								, mods =			'CTRL', key =	 'Tab' },
   { action = action.ActivateTabRelative(-1)								, mods =	'CTRL|SHIFT', key =   'Tab' },
   { action = action.QuickSelect												, mods =	'CTRL|SHIFT', key = 'Space' },
   { action = action.PaneSelect { mode = "Activate"}					, mods = 'CTRL|SHIFT', key =     's' },
   -- Unfortunatelly Yes, using F2 cause the same key used for renaming in Windows
   { action = action.PromptInputLine {
      description = 'Enter new name for current tab',
      action = wezterm.action_callback(function(window, pane, line)
         if line then
            window:active_tab():set_title(" 󰑕  " .. line .. " ")
         end
      end),
   }, mods = "CTRL", key = 'F2'},
   { action = action.PromptInputLine {
      description = 'Enter new name for current workspace',
      action = wezterm.action_callback(function(window, pane, line)
         if line then
            mux.rename_workspace(wezterm.mux.get_active_workspace() , " " ..line .. " ")
            print(line)
         end
      end),
   }, mods = "CTRL|SHIFT", key = 'F2'},
   -- move between split panes
   -- split_nav('move', 'h'),
   -- split_nav('move', 'j'),
   -- split_nav('move', 'k'),
   -- split_nav('move', 'l'),
   -- resize panes
   -- split_nav('resize', 'h'),
   -- split_nav('resize', 'j'),
   -- split_nav('resize', 'k'),
   -- split_nav('resize', 'l'),
}

for i = 1, 9 do
   table.insert(config.keys, {
      key = tostring(i),
      mods = "CTRL",
      action = action.ActivateTab(i - 1)
   })
end
-- }}}

-- and finally, return the configuration to wezterm
return config
