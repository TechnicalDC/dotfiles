require("full-border"):setup {
	-- Available values: ui.Border.PLAIN, ui.Border.ROUNDED
	type = ui.Border.ROUNDED,
}
require("git"):setup()
require("session"):setup {
	sync_yanked = true,
}

Status:children_add(function(self)
	local h = self._current.hovered
	if h and h.link_to then
		return " -> " .. tostring(h.link_to)
	else
		return ""
	end
end, 3300, Status.LEFT)

Status:children_add(function()
	local h = cx.active.current.hovered
	if h == nil or ya.target_family() ~= "unix" then
		return ""
	end

	return ui.Line {
		ui.Span(ya.user_name(h.cha.uid) or tostring(h.cha.uid)):fg("magenta"),
		":",
		ui.Span(ya.group_name(h.cha.gid) or tostring(h.cha.gid)):fg("magenta"),
		" ",
	}
end, 500, Status.RIGHT)

function Status:render(area)
   self.area = area

   local left = ui.Line { self:mode(), self:size(), self:name() }
   local right = ui.Line { self:owner(), self:permissions(), self:percentage(), self:position() }
   return {
      ui.Paragraph(area, { left }),
      ui.Paragraph(area, { right }):align(ui.Paragraph.RIGHT),
      table.unpack(Progress:render(area, right:width())),
   }
end

function Header:tabs()
   local tabs = #cx.tabs
   -- Removing following code to show tabs even if it is only 1.
   -- if tabs == 1 then
   --    return ui.Line {}
   -- end

   local spans = {}
   for i = 1, tabs do
      local text = i
      if THEME.manager.tab_width > 2 then
         text = ya.truncate(text .. " " .. cx.tabs[i]:name(), { max = THEME.manager.tab_width })
      end
      if i == cx.tabs.idx then
         spans[#spans + 1] = ui.Span(" " .. text .. " "):style(THEME.manager.tab_active)
      else
         spans[#spans + 1] = ui.Span(" " .. text .. " "):style(THEME.manager.tab_inactive)
      end
   end
   return ui.Line(spans)
end
