require("full-border"):setup()
require("starship"):setup()

function Status:name()
   local h = cx.active.current.hovered
   if not h then
      return ui.Span("")
   end

   local linked = ""
   if h.link_to ~= nil then
      linked = " -> " .. tostring(h.link_to)
   end
   return ui.Span(" " .. h.name .. linked)
end

function Status:owner()
   local h = cx.active.current.hovered
   if h == nil or ya.target_family() ~= "unix" then
      return ui.Line {}
   end

   return ui.Line {
      ui.Span(ya.user_name(h.cha.uid) or tostring(h.cha.uid)):fg("magenta"),
      ui.Span(":"),
      ui.Span(ya.group_name(h.cha.gid) or tostring(h.cha.gid)):fg("magenta"),
      ui.Span(" "),
   }
end

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
