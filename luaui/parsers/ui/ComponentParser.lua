--[[
    ComponentParser.
    Faithful port of haxe_ui.parsers.ui.ComponentParser.
--]]

local ComponentParser = {}
ComponentParser.__index = ComponentParser

ComponentParser._parsers = {}

function ComponentParser.new()
    return setmetatable({}, ComponentParser)
end

function ComponentParser:parse(data, resourceResolver)
    error("Component parser not implemented!")
end

function ComponentParser.get(extension)
    ComponentParser.defaultParsers()
    local cls = ComponentParser._parsers[extension]
    if cls == nil then return nil end
    return cls.new()
end

function ComponentParser.defaultParsers()
    -- register defaults
end

function ComponentParser.register(extension, cls)
    ComponentParser._parsers[extension] = cls
end

return ComponentParser
