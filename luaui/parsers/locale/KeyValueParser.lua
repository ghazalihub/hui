--[[
    KeyValueParser.
    Faithful port of haxe_ui.parsers.locale.KeyValueParser.
--]]

local LocaleParser = require("luaui.parsers.locale.LocaleParser")

local KeyValueParser = setmetatable({}, { __index = LocaleParser })
KeyValueParser.__index = KeyValueParser

function KeyValueParser.new()
    return setmetatable(LocaleParser.new(), KeyValueParser)
end

function KeyValueParser:parse(data)
    local map = {}
    for line in data:gmatch("([^\r\n]+)") do
        local n = line:find("=")
        if n then
            local k = line:sub(1, n-1):gsub("^%s*(.-)%s*$", "%1")
            local v = line:sub(n+1):gsub("^%s*(.-)%s*$", "%1")
            map[k] = v
        end
    end
    return map
end

return KeyValueParser
