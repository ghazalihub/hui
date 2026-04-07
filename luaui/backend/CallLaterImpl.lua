local CallLaterImpl = { queue = {} }
function CallLaterImpl.new(fn) table.insert(CallLaterImpl.queue, fn) end
function CallLaterImpl.process()
    local q = CallLaterImpl.queue
    CallLaterImpl.queue = {}
    for _, fn in ipairs(q) do fn() end
end
return CallLaterImpl
