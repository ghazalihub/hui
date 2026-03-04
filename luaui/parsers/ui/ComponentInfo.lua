local ComponentInfo = {}
ComponentInfo.__index = ComponentInfo
function ComponentInfo.new() return setmetatable({ properties = {}, children = {} }, ComponentInfo) end
return ComponentInfo
