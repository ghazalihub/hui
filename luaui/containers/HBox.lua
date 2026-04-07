local Box = require("luaui.containers.Box")

local HBox = setmetatable({}, { __index = Box })
HBox.__index = HBox

function HBox.new()
    local self = setmetatable(Box.new(), HBox)
    return self
end

return HBox
