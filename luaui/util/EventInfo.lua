local EventInfo = {}
EventInfo.__index = EventInfo
function EventInfo.new() return setmetatable({}, EventInfo) end
return EventInfo
