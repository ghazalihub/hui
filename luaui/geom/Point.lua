local Point = {}
Point.__index = Point

function Point.new(x, y)
    local self = setmetatable({}, Point)
    self.x = x or 0
    self.y = y or 0
    return self
end

function Point:add(p) self.x = self.x + p.x; self.y = self.y + p.y end
function Point:subtract(p) self.x = self.x - p.x; self.y = self.y - p.y end
function Point:length() return math.sqrt(self.x * self.x + self.y * self.y) end
function Point:copy() return Point.new(self.x, self.y) end

return Point
