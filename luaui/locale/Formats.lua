--[[
    Formats.
    Faithful port of haxe_ui.locale.Formats.
--]]

local Formats = {}

function Formats.get_dateFormatShort()
    return "%d/%m/%Y"
end

function Formats.get_decimalSeparator()
    return "."
end

function Formats.get_thousandsSeparator()
    return ","
end

return Formats
