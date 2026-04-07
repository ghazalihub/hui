local ComponentBase = require("luaui.backend.ComponentBase")

local ComponentImpl = setmetatable({}, { __index = ComponentBase })
ComponentImpl.__index = ComponentImpl

function ComponentImpl.new()
    local self = setmetatable(ComponentBase.new(), ComponentImpl)
    return self
end

function ComponentImpl:renderTo(g)
    for _, child in ipairs(self._children) do
        child:renderTo(g)
    end
end

return ComponentImpl
