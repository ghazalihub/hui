--[[
    Value enum equivalent.
    Faithful port of haxe_ui.styles.Value.
--]]

local Value = {
    VString = function(v) return { type = "string", value = v } end,
    VNumber = function(v) return { type = "number", value = v } end,
    VBool = function(v) return { type = "bool", value = v } end,
    VDimension = function(v) return { type = "dimension", value = v } end,
    VColor = function(v) return { type = "color", value = v } end,
    VCall = function(f, vl) return { type = "call", func = f, args = vl } end,
    VConstant = function(v) return { type = "constant", value = v } end,
    VComposite = function(vl) return { type = "composite", values = vl } end,
    VTime = function(v, u) return { type = "time", value = v, unit = u } end,
    VNone = function() return { type = "none" } end
}

return Value
