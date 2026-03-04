local AnimationKeyFrame = {}
AnimationKeyFrame.__index = AnimationKeyFrame
function AnimationKeyFrame.new() return setmetatable({ directives = {} }, AnimationKeyFrame) end
return AnimationKeyFrame
