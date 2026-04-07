local UIEvent = require("luaui.events.UIEvent")

local MouseEvent = setmetatable({}, { __index = UIEvent })
MouseEvent.__index = MouseEvent

MouseEvent.CLICK = "click"
MouseEvent.MOUSE_DOWN = "mousedown"
MouseEvent.MOUSE_UP = "mouseup"
MouseEvent.MOUSE_MOVE = "mousemove"

function MouseEvent.new(type)
    local self = UIEvent.new(type)
    setmetatable(self, MouseEvent)
    self.screenX = 0
    self.screenY = 0
    return self
end

function MouseEvent:clone()
    local c = MouseEvent.new(self.type)
    c.screenX = self.screenX
    c.screenY = self.screenY
    c.target = self.target
    c.canceled = self.canceled
    return c
end

return MouseEvent
