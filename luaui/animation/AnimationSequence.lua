local AnimationSequence = {}
AnimationSequence.__index = AnimationSequence
function AnimationSequence.new()
    local self = setmetatable({}, AnimationSequence)
    self.builders = {}
    self._activeBuilders = {}
    self.onComplete = nil
    return self
end
function AnimationSequence:add(builder)
    if builder then table.insert(self.builders, builder) end
end
function AnimationSequence:play()
    if #self.builders == 0 then
        if self.onComplete then self.onComplete() end
        return
    end
    self._activeBuilders = {}
    for _, b in ipairs(self.builders) do table.insert(self._activeBuilders, b) end
    local completeHandler = function()
        table.remove(self._activeBuilders)
        if #self._activeBuilders == 0 and self.onComplete then self.onComplete() end
    end
    for _, b in ipairs(self.builders) do
        b.onComplete = completeHandler
        b:play()
    end
end
return AnimationSequence
