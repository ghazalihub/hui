local Rectangle = {}
Rectangle.__index = Rectangle

function Rectangle.new(left, top, width, height)
    local self = setmetatable({}, Rectangle)
    self.left = left or 0
    self.top = top or 0
    self.width = width or 0
    self.height = height or 0
    return self
end

function Rectangle:set(left, top, width, height)
    self.left, self.top, self.width, self.height = left or 0, top or 0, width or 0, height or 0
end

function Rectangle:get_right() return self.left + self.width end
function Rectangle:get_bottom() return self.top + self.height end

function Rectangle:intersection(rect, noAlloc)
    if noAlloc == nil then noAlloc = true end
    if noAlloc and self._intersectionCache == nil then self._intersectionCache = Rectangle.new() end

    local x0 = math.max(self.left, rect.left)
    local x1 = math.min(self:get_right(), rect:get_right())
    if x1 <= x0 then
        local r = noAlloc and self._intersectionCache or Rectangle.new()
        r:set(0, 0, 0, 0)
        return r
    end

    local y0 = math.max(self.top, rect.top)
    local y1 = math.min(self:get_bottom(), rect:get_bottom())
    if y1 <= y0 then
        local r = noAlloc and self._intersectionCache or Rectangle.new()
        r:set(0, 0, 0, 0)
        return r
    end

    local r = noAlloc and self._intersectionCache or Rectangle.new()
    r:set(x0, y0, x1 - x0, y1 - y0)
    return r
end

return Rectangle
