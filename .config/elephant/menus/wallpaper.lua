function GetEntries()
    local entries = {}
    local wallpaper_dir = "/home/dilip/Pictures/wallpapers/"

    local handle = io.popen("find '" ..
        wallpaper_dir ..
        "' -maxdepth 1 -type f -name '*.jpg' -o -name '*.jpeg' -o -name '*.png' -o -name '*.gif' -o -name '*.bmp' -o -name '*.webp' 2>/dev/null")
    if handle then
        for line in handle:lines() do
           print(line)
            local filename = line:match("([^/]+)$")
            if filename then
                table.insert(entries, {
                    Text = filename,
                    Subtext = "wallpaper",
                    Value = line,
                    Actions = {
                        up = "notify-send up",
                        down = "notify-send down",
                    },
                    -- Preview = line,
                    Icon = line
                })
            end
        end
        handle:close()
    end

    return entries
end
