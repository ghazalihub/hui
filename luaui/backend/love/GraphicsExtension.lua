local GraphicsExtension = {}
function GraphicsExtension.drawArc(cx, cy, radius, sAngle, eAngle, strength, ccw, segments)
    -- Ported from Kha
    strength = strength or 1
    ccw = ccw or false
    sAngle = sAngle % (math.pi * 2)
    eAngle = eAngle % (math.pi * 2)
    if ccw then if eAngle > sAngle then eAngle = eAngle - math.pi * 2 end
    elseif eAngle < sAngle then eAngle = eAngle + math.pi * 2 end
    radius = radius + strength / 2
    if not segments or segments <= 0 then segments = math.floor(10 * math.sqrt(radius)) end
    local theta = (eAngle - sAngle) / segments
    local lx, ly = math.cos(sAngle) * radius + cx, math.sin(sAngle) * radius + cy
    for n = 1, segments do
        local a = sAngle + n * theta
        local x, y = math.cos(a) * radius + cx, math.sin(a) * radius + cy
        love.graphics.setLineWidth(strength)
        love.graphics.line(lx, ly, x, y)
        lx, ly = x, y
    end
end
function GraphicsExtension.drawCircle(cx, cy, radius, strength, segments)
    love.graphics.setLineWidth(strength or 1)
    love.graphics.circle("line", cx, cy, radius, segments or 32)
end
function GraphicsExtension.fillCircle(cx, cy, radius, segments)
    love.graphics.circle("fill", cx, cy, radius, segments or 32)
end
return GraphicsExtension
