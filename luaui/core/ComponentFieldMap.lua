--[[
    ComponentFieldMap.
    Faithful port of haxe_ui.core.ComponentFieldMap.
--]]

local ComponentFieldMap = {}
ComponentFieldMap.MAP = {
    group = "componentGroup",
    contentLayout = "contentLayoutName"
}

function ComponentFieldMap.mapField(name)
    return ComponentFieldMap.MAP[name] or name
end

return ComponentFieldMap
