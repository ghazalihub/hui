local Filter = require("luaui.filters.Filter")
local Contrast = setmetatable({}, { __index = Filter })
Contrast.__index = Contrast
function Contrast.new() return setmetatable(Filter.new(), Contrast) end
function Contrast:parse(d) local c = Filter.applyDefaults(d, {1}); self.multiplier = math.max(0, c[1]) end

local HueRotate = setmetatable({}, { __index = Filter })
HueRotate.__index = HueRotate
function HueRotate.new() return setmetatable(Filter.new(), HueRotate) end
function HueRotate:parse(d) local c = Filter.applyDefaults(d, {1}); self.angleDegree = c[1] end

local Invert = setmetatable({}, { __index = Filter })
Invert.__index = Invert
function Invert.new() return setmetatable(Filter.new(), Invert) end
function Invert:parse(d) local c = Filter.applyDefaults(d, {1}); self.multiplier = math.max(0, c[1]) end

local Tint = setmetatable({}, { __index = Filter })
Tint.__index = Tint
function Tint.new() return setmetatable(Filter.new(), Tint) end
function Tint:parse(d) local c = Filter.applyDefaults(d, {0, 1}); self.color, self.amount = c[1], math.max(0, math.min(1, c[2])) end

local Saturate = setmetatable({}, { __index = Filter })
Saturate.__index = Saturate
function Saturate.new() return setmetatable(Filter.new(), Saturate) end
function Saturate:parse(d) local c = Filter.applyDefaults(d, {1}); self.multiplier = math.max(0, c[1]) end

local Grayscale = setmetatable({}, { __index = Filter })
Grayscale.__index = Grayscale
function Grayscale.new() return setmetatable(Filter.new(), Grayscale) end
function Grayscale:parse(d) local c = Filter.applyDefaults(d, {100}); self.amount = c[1] end

local Brightness = setmetatable({}, { __index = Filter })
Brightness.__index = Brightness
function Brightness.new() return setmetatable(Filter.new(), Brightness) end
function Brightness:parse(d) local c = Filter.applyDefaults(d, {1}); self.multiplier = math.max(0, c[1]) end

local Blur = setmetatable({}, { __index = Filter })
Blur.__index = Blur
function Blur.new() return setmetatable(Filter.new(), Blur) end
function Blur:parse(d) local c = Filter.applyDefaults(d, {1}); self.amount = c[1] end

return { Contrast = Contrast, HueRotate = HueRotate, Invert = Invert, Tint = Tint, Saturate = Saturate, Grayscale = Grayscale, Brightness = Brightness, Blur = Blur }
