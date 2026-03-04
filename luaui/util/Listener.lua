local Listener = {}
Listener.__index = Listener

function Listener.new(callback, priority)
    local self = setmetatable({}, Listener)
    self.callback = callback
    self.priority = priority or 0
    return self
end

return Listener
