local Listener = require("luaui.util.Listener")

local FunctionArray = {}
FunctionArray.__index = FunctionArray

function FunctionArray.new()
    local self = setmetatable({}, FunctionArray)
    self._array = {}
    return self
end

function FunctionArray:get_length() return #self._array end

function FunctionArray:push(x, priority)
    priority = priority or 0
    local l = Listener.new(x, priority)
    for i, existing in ipairs(self._array) do
        if existing.priority < priority then
            table.insert(self._array, i, l)
            return i
        end
    end
    table.insert(self._array, l)
    return #self._array
end

function FunctionArray:contains(x)
    for _, l in ipairs(self._array) do
        if l.callback == x then return true end
    end
    return false
end

function FunctionArray:remove(x)
    for i, l in ipairs(self._array) do
        if l.callback == x then
            table.remove(self._array, i)
            return true
        end
    end
    return false
end

function FunctionArray:iterator() return ipairs(self._array) end

function FunctionArray:copy()
    local fa = FunctionArray.new()
    for _, v in ipairs(self._array) do table.insert(fa._array, v) end
    return fa
end

return FunctionArray
