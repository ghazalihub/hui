local LocaleParser = require("luaui.parsers.locale.LocaleParser")
local PropertiesParser = setmetatable({}, { __index = LocaleParser })
PropertiesParser.__index = PropertiesParser
function PropertiesParser.new() return setmetatable(LocaleParser.new(), PropertiesParser) end
function PropertiesParser:parse(data)
    local m = {}
    for l in data:gmatch("([^\r\n]+)") do
        if not l:find("^%s*#") then
            local n = l:find("=")
            if n then m[l:sub(1, n-1):gsub("^%s*(.-)%s*$", "%1")] = l:sub(n+1):gsub("^%s*(.-)%s*$", "%1") end
        end
    end
    return m
end
return PropertiesParser
