local Filter = require("luaui.filters.Filter")
local BoxShadow = setmetatable({}, { __index = Filter })
BoxShadow.__index = BoxShadow
function BoxShadow.new() return setmetatable(Filter.new(), BoxShadow) end
function BoxShadow:parse(d)
    local c = Filter.applyDefaults(d, {2, 2, 0, .1, 1, 0, false})
    self.offsetX, self.offsetY, self.color, self.alpha, self.blurRadius, self.spreadRadius, self.inset = unpack(c)
end

local Outline = setmetatable({}, { __index = Filter })
Outline.__index = Outline
function Outline.new() return setmetatable(Filter.new(), Outline) end
function Outline:parse(d)
    local c = Filter.applyDefaults(d, {0, 1})
    self.color, self.size = unpack(c)
end

local DropShadow = setmetatable({}, { __index = Filter })
DropShadow.__index = DropShadow
function DropShadow.new() return setmetatable(Filter.new(), DropShadow) end
function DropShadow:parse(d)
    local c = Filter.applyDefaults(d, {4, 45, 0, 1, 4, 4, 1, 1, false})
    self.distance, self.angle, self.color, self.alpha, self.blurX, self.blurY, self.strength, self.quality, self.inner = unpack(c)
end

return { BoxShadow = BoxShadow, Outline = Outline, DropShadow = DropShadow }
