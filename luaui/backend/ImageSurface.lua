local ImageSurface = {}
ImageSurface.__index = ImageSurface
function ImageSurface.new() return setmetatable({}, ImageSurface) end
return ImageSurface
