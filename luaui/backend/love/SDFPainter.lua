local SDFPainter = {}
SDFPainter.__index = SDFPainter
function SDFPainter.new() return setmetatable({}, SDFPainter) end
function SDFPainter:sdfRect(x, y, w, h, corner, border, borderColor)
    love.graphics.setColor(borderColor.r or 1, borderColor.g or 1, borderColor.b or 1, borderColor.a or 1)
    love.graphics.rectangle("fill", x, y, w, h, corner.tr or 0)
end
return SDFPainter
