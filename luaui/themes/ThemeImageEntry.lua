local ThemeImageEntry = {}
ThemeImageEntry.__index = ThemeImageEntry
function ThemeImageEntry.new() return setmetatable({ priority = 0 }, ThemeImageEntry) end
return ThemeImageEntry
