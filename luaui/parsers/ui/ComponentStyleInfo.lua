local ComponentStyleInfo = {}
ComponentStyleInfo.__index = ComponentStyleInfo
function ComponentStyleInfo.new(style, scope)
    return setmetatable({ style = style, scope = scope or "global" }, ComponentStyleInfo)
end
return ComponentStyleInfo
