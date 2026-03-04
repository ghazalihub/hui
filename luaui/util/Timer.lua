local TimerImpl = require("luaui.backend.TimerImpl")
local Timer = setmetatable({}, { __index = TimerImpl })
Timer.__index = Timer
function Timer.delay(f, tMs)
    local t; t = Timer.new(tMs, function() t:stop(); f() end)
    return t
end
function Timer.new(d, c) return setmetatable(TimerImpl.new(d, c), Timer) end
return Timer
