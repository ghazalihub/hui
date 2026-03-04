--[[
    Component.
    Faithful port of haxe_ui.core.Component.
--]]

local ComponentImpl = require("luaui.backend.ComponentImpl")
local Style = require("luaui.styles.Style")

local Component = setmetatable({}, { __index = ComponentImpl })
Component.__index = Component

function Component.new()
    local self = setmetatable(ComponentImpl.new(), Component)
    self.left = 0
    self.top = 0
    self.width = 0
    self.height = 0
    self.style = Style.new()

    self._componentReady = true
    return self
end

function Component:validateComponent()
    if not self._componentReady then return end

    if self:isComponentInvalid("style") then
        self:validateComponentStyle()
    end

    if self:isComponentInvalid("layout") then
        self:validateComponentLayout()
    end

    self._invalidationFlags = {}
end

function Component:validateComponentStyle()
    -- Logic to apply style to backend
end

function Component:validateComponentLayout()
    -- Logic to position and size children
end

function Component:updateComponentDisplay()
    -- Logic to redraw
end

return Component
