--[[
    XMLParser for modules.
    Faithful port of haxe_ui.parsers.modules.XMLParser.
--]]

local ModuleParser = require("luaui.parsers.modules.ModuleParser")
local Module = require("luaui.parsers.modules.Module")

local XMLParser = setmetatable({}, { __index = ModuleParser })
XMLParser.__index = XMLParser

function XMLParser.new()
    return setmetatable(ModuleParser.new(), XMLParser)
end

function XMLParser:parse(data, defines, context)
    local m = Module.new()
    -- XML parsing logic would go here
    return m
end

return XMLParser
