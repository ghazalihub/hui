local TimerImpl = { timers = {} }
TimerImpl.__index = TimerImpl
function TimerImpl.new(delay, callback)
    local self = setmetatable({ _delay = delay/1000, _callback = callback, _stopped = false, _elapsed = 0 }, TimerImpl)
    table.insert(TimerImpl.timers, self)
    return self
end
function TimerImpl:stop()
    self._stopped = true
    for i, t in ipairs(TimerImpl.timers) do if t == self then table.remove(TimerImpl.timers, i); break end end
end
function TimerImpl.update(dt)
    for i = #TimerImpl.timers, 1, -1 do
        local t = TimerImpl.timers[i]
        if not t._stopped then
            t._elapsed = t._elapsed + dt
            if t._elapsed >= t._delay then t._elapsed = t._elapsed - t._delay; t._callback() end
        end
    end
end
return TimerImpl
