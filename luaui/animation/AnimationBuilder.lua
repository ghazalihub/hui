local AnimationBuilder = {}
AnimationBuilder.__index = AnimationBuilder

function AnimationBuilder.new(target, duration, easing)
    local self = setmetatable({}, AnimationBuilder)
    self._keyFrames = {}
    self.target = target
    self.onComplete = nil
    self.duration = duration or 0.2
    self.easing = easing or "linear"
    return self
end

function AnimationBuilder:play()
    if #self._keyFrames == 0 then
        if self.onComplete ~= nil then self.onComplete() end
        return
    end
    -- Backend logic would go here
    if self.onComplete ~= nil then self.onComplete() end
end

return AnimationBuilder
