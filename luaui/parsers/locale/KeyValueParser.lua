local LocaleParser = require("luaui.parsers.locale.LocaleParser")
local KeyValueParser = setmetatable({}, { __index = LocaleParser })
KeyValueParser.__index = KeyValueParser
function KeyValueParser.new() return setmetatable(LocaleParser.new(), KeyValueParser) end
function KeyValueParser:parse(data)
    local m = {}
    for l in data:gmatch("([^\r\n]+)") do
        local n = l:find("=")
        if n then m[l:sub(1, n-1):gsub("^%s*(.-)%s*$", "%1")] = l:sub(n+1):gsub("^%s*(.-)%s*$", "%1") end
    end
    return m
end
return KeyValueParser
