local Animation = {}
function Animation.createWithKeyFrames(kf, target, options) return { run = function(c) if c then c() end end } end
return Animation
