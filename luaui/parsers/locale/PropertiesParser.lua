--[[
    PropertiesParser.
    Faithful port of haxe_ui.parsers.locale.PropertiesParser.
--]]

local LocaleParser = require("luaui.parsers.locale.LocaleParser")

local PropertiesParser = setmetatable({}, { __index = LocaleParser })
PropertiesParser.__index = PropertiesParser

function PropertiesParser.new()
    return setmetatable(LocaleParser.new(), PropertiesParser)
end

function PropertiesParser:parse(data)
    -- Properties parser is typically just KeyValue parsing
    local map = {}
    for line in data:gmatch("([^\r\n]+)") do
        if not line:find("^%s*#") then
            local n = line:find("=")
            if n then
                local k = line:sub(1, n-1):gsub("^%s*(.-)%s*$", "%1")
                local v = line:sub(n+1):gsub("^%s*(.-)%s*$", "%1")
                map[k] = v
            end
        end
    end
    return map
end

return PropertiesParser
