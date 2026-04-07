local UIEvent = {}
UIEvent.__index = UIEvent

UIEvent.CLICK = "click"
UIEvent.MOUSE_DOWN = "mousedown"
UIEvent.MOUSE_UP = "mouseup"
UIEvent.MOUSE_MOVE = "mousemove"

function UIEvent.new(type, bubble, data)
    local self = setmetatable({}, UIEvent)
    self.type = type
    self.bubble = bubble or false
    self.data = data
    self.canceled = false
    self.target = nil
    return self
end

function UIEvent:cancel() self.canceled = true end
function UIEvent:clone()
    local c = UIEvent.new(self.type, self.bubble, self.data)
    c.target = self.target
    c.canceled = self.canceled
    return c
end

return UIEvent
