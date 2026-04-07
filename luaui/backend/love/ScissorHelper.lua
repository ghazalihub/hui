local ScissorHelper = { _stack = {}, _pos = 0 }
function ScissorHelper.pushScissor(x, y, w, h)
    ScissorHelper._pos = ScissorHelper._pos + 1
    love.graphics.setScissor(x, y, w, h)
end
function ScissorHelper.popScissor()
    ScissorHelper._pos = ScissorHelper._pos - 1
    if ScissorHelper._pos == 0 then love.graphics.setScissor() end
end
return ScissorHelper
