--[[
    NativeTypeTransformer.
    Faithful port of haxe_ui.data.transformation.NativeTypeTransformer.
--]]

local NativeTypeTransformer = {}
NativeTypeTransformer.__index = NativeTypeTransformer

function NativeTypeTransformer.new()
    return setmetatable({}, NativeTypeTransformer)
end

function NativeTypeTransformer:transformFrom(i)
    if type(i) == "string" then
        return { text = i, value = i }
    elseif type(i) == "number" or type(i) == "boolean" then
        return { value = i }
    end
    return i
end

return NativeTypeTransformer
