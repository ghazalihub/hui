--[[
    Filter sub-classes.
    Faithful port of haxe_ui.filters.*
--]]

local Filter = require("luaui.filters.Filter")

local BoxShadow = setmetatable({}, { __index = Filter })
BoxShadow.__index = BoxShadow
function BoxShadow.new() return setmetatable(Filter.new(), BoxShadow) end
function BoxShadow:parse(details)
    local copy = Filter.applyDefaults(details, {2, 2, 0, .1, 1, 0, false})
    self.offsetX, self.offsetY, self.color, self.alpha, self.blurRadius, self.spreadRadius, self.inset = unpack(copy)
end

local Outline = setmetatable({}, { __index = Filter })
Outline.__index = Outline
function Outline.new() return setmetatable(Filter.new(), Outline) end
function Outline:parse(details)
    local copy = Filter.applyDefaults(details, {0, 1})
    self.color, self.size = unpack(copy)
end

local DropShadow = setmetatable({}, { __index = Filter })
DropShadow.__index = DropShadow
function DropShadow.new() return setmetatable(Filter.new(), DropShadow) end
function DropShadow:parse(details)
    local copy = Filter.applyDefaults(details, {4, 45, 0, 1, 4, 4, 1, 1, false})
    self.distance, self.angle, self.color, self.alpha, self.blurX, self.blurY, self.strength, self.quality, self.inner = unpack(copy)
end

return { BoxShadow = BoxShadow, Outline = Outline, DropShadow = DropShadow }
