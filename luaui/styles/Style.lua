local Style = {}
Style.__index = Style
function Style.new() return setmetatable({}, Style) end
function Style:apply(s) for k,v in pairs(s) do self[k] = v end end
return Style
