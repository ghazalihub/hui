local HBox = require("luaui.containers.HBox")

local WindowFooter = setmetatable({}, { __index = HBox })
WindowFooter.__index = WindowFooter

function WindowFooter.new()
    local self = setmetatable(HBox.new(), WindowFooter)
    return self
end

return WindowFooter
