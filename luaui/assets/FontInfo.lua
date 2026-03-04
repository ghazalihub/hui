--[[
    FontInfo.
    Faithful port of haxe_ui.assets.FontInfo.
--]]

local FontInfo = {}

function FontInfo.new(name, data)
    return {
        name = name,
        data = data
    }
end

return FontInfo
