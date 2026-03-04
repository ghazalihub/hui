local ComponentSurface = {}
ComponentSurface.__index = ComponentSurface
function ComponentSurface.new() return setmetatable({}, ComponentSurface) end
return ComponentSurface
