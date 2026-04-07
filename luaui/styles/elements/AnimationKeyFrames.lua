local AnimationKeyFrames = {}
AnimationKeyFrames.__index = AnimationKeyFrames
function AnimationKeyFrames.new(id, keyframes)
    return setmetatable({ id = id, _keyframes = keyframes }, AnimationKeyFrames)
end
function AnimationKeyFrames:get_keyFrames() return self._keyframes end
return AnimationKeyFrames
