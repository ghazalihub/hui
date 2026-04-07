--[[
    ModuleParser base.
    Faithful port of haxe_ui.parsers.modules.ModuleParser.
--]]

local ModuleParser = {}
ModuleParser.__index = ModuleParser

ModuleParser._parsers = {}

function ModuleParser.new()
    local self = setmetatable({}, ModuleParser)
    return self
end

function ModuleParser:parse(data, defines, context)
    error("Module parser not implemented!")
end

function ModuleParser.get(extension)
    ModuleParser.defaultParsers()
    local cls = ModuleParser._parsers[extension]
    if cls == nil then return nil end
    return cls.new()
end

function ModuleParser.defaultParsers()
    -- register defaults here
end

function ModuleParser.register(extension, cls)
    ModuleParser._parsers[extension] = cls
end

return ModuleParser
