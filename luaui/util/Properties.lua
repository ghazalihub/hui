local Properties = {}
Properties.__index = Properties
function Properties.new() return setmetatable({ _map = {} }, Properties) end
return Properties
