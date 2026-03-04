--[[
    LocaleParser.
    Faithful port of haxe_ui.parsers.locale.LocaleParser.
--]]

local LocaleParser = {}
LocaleParser.__index = LocaleParser

LocaleParser._parsers = {}

function LocaleParser.new()
    local self = setmetatable({}, LocaleParser)
    return self
end

function LocaleParser:parse(data)
    error("Locale parser not implemented!")
end

function LocaleParser.get(extension)
    LocaleParser.defaultParsers()
    local cls = LocaleParser._parsers[extension]
    if cls == nil then return nil end
    return cls.new()
end

function LocaleParser.defaultParsers()
    -- register defaults here
end

function LocaleParser.register(extension, cls)
    LocaleParser._parsers[extension] = cls
end

return LocaleParser
