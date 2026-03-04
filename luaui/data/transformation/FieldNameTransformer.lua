--[[
    FieldNameTransformer.
    Faithful port of haxe_ui.data.transformation.FieldNameTransformer.
--]]

local FieldNameTransformer = {}
FieldNameTransformer.__index = FieldNameTransformer

function FieldNameTransformer.new(mapping)
    return setmetatable({ mapping = mapping }, FieldNameTransformer)
end

function FieldNameTransformer:transformFrom(i)
    if self.mapping == nil then return i end

    local o = {}
    for k, v in pairs(i) do o[k] = v end -- shallow copy

    for fromField, toField in pairs(self.mapping) do
        if i[fromField] ~= nil then
            o[toField] = i[fromField]
            o[fromField] = nil
        end
    end
    return o
end

return FieldNameTransformer
