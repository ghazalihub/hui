local AnimationBuilder = {}
AnimationBuilder.__index = AnimationBuilder
function AnimationBuilder.new(t, d, e) return setmetatable({ target = t, duration = d or 0.2, easing = e or "linear" }, AnimationBuilder) end
function AnimationBuilder:play() if self.onComplete then self.onComplete() end end
return AnimationBuilder
