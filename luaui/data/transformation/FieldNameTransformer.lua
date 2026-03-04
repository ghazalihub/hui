local FieldNameTransformer = {}
FieldNameTransformer.__index = FieldNameTransformer
function FieldNameTransformer.new(m) return setmetatable({ mapping = m }, FieldNameTransformer) end
function FieldNameTransformer:transformFrom(i)
    if not self.mapping then return i end
    local o = {}; for k, v in pairs(i) do o[k] = v end
    for f, t in pairs(self.mapping) do if i[f] ~= nil then o[t], o[f] = i[f], nil end end
    return o
end
return FieldNameTransformer
