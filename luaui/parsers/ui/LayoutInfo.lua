local LayoutInfo = {}
LayoutInfo.__index = LayoutInfo
function LayoutInfo.new() return setmetatable({ properties = {} }, LayoutInfo) end
return LayoutInfo
