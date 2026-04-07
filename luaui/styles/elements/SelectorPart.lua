local SelectorPart = {}
SelectorPart.__index = SelectorPart
function SelectorPart.new() return setmetatable({ parent = nil, direct = false }, SelectorPart) end
return SelectorPart
