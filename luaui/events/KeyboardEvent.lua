local UIEvent = require("luaui.events.UIEvent")

local KeyboardEvent = setmetatable({}, { __index = UIEvent })
KeyboardEvent.__index = KeyboardEvent

function KeyboardEvent.new(type)
    local self = UIEvent.new(type)
    setmetatable(self, KeyboardEvent)
    self.keyCode = 0
    return self
end

function KeyboardEvent:clone()
    local c = KeyboardEvent.new(self.type)
    c.keyCode = self.keyCode
    c.target = self.target
    c.canceled = self.canceled
    return c
end

return KeyboardEvent
