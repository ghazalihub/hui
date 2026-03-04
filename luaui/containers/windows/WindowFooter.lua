--[[
    WindowFooter.
    Faithful port of haxe_ui.containers.windows.WindowFooter.
--]]

local HBox = require("luaui.containers.HBox")

local WindowFooter = setmetatable({}, {__index = HBox})
WindowFooter.__index = WindowFooter

function WindowFooter.new()
    local self = HBox.new()
    setmetatable(self, WindowFooter)
    return self
end

return WindowFooter
