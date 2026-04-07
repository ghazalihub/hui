local FunctionArray = require("luaui.util.FunctionArray")

local EventMap = {}
EventMap.__index = EventMap

function EventMap.new()
    local self = setmetatable({}, EventMap)
    self._map = {}
    return self
end

function EventMap:add(type, listener, priority)
    local arr = self._map[type]
    if arr == nil then
        arr = FunctionArray.new()
        arr:push(listener, priority)
        self._map[type] = arr
        return true
    end
    if not arr:contains(listener) then
        arr:push(listener, priority)
    end
    return false
end

function EventMap:remove(type, listener)
    local arr = self._map[type]
    if arr then
        if arr:remove(listener) then
            if arr:get_length() == 0 then
                self._map[type] = nil
                return true
            end
        end
    end
    return false
end

function EventMap:invoke(type, event, target)
    local arr = self._map[type]
    if arr then
        arr = arr:copy()
        for _, l in arr:iterator() do
            if event.canceled then break end
            local c = event:clone()
            if c.target == nil then c.target = target end
            l.callback(c)
            event.canceled = c.canceled
        end
    end
end

return EventMap
