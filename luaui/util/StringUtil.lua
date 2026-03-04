--[[
    StringUtil.
    Faithful port of haxe_ui.util.StringUtil.
--]]

local StringUtil = {}

function StringUtil.toDashes(s)
    return s:gsub("([a-z])([A-Z])", "%1-%2"):lower()
end

function StringUtil.capitalize(s)
    return s:sub(1,1):upper() .. s:sub(2)
end

function StringUtil.splitHyphens(s)
    local res = {}
    for part in s:gmatch("[^-]+") do table.insert(res, part) end
    return res
end

return StringUtil
