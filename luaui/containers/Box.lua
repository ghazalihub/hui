local Component = require("luaui.core.Component")

local Box = setmetatable({}, { __index = Component })
Box.__index = Box

function Box.new()
    local self = setmetatable(Component.new(), Box)
    return self
end

return Box
