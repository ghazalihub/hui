--[[
    Timer.
    Faithful port of haxe_ui.util.Timer.
--]]

local TimerImpl = require("luaui.backend.TimerImpl")

local Timer = setmetatable({}, { __index = TimerImpl })
Timer.__index = Timer

function Timer.delay(f, timeMs)
    local t = nil
    t = Timer.new(timeMs, function()
        t:stop()
        f()
    end)
    return t
end

function Timer.new(delay, callback)
    local self = setmetatable(TimerImpl.new(delay, callback), Timer)
    return self
end

return Timer
