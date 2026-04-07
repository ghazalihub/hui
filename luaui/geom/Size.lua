local Size = {}
Size.__index = Size

function Size.new(width, height)
    local self = setmetatable({}, Size)
    self.width = width or 0
    self.height = height or 0
    return self
end

return Size
