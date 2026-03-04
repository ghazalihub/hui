local ThemeEntry = {}
ThemeEntry.__index = ThemeEntry
function ThemeEntry.new() return setmetatable({}, ThemeEntry) end
return ThemeEntry
