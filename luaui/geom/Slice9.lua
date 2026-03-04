local Rectangle = require("luaui.geom.Rectangle")
local Slice9 = {}

function Slice9.buildRects(w, h, bitmapWidth, bitmapHeight, slice)
    local srcRects = Slice9.buildSrcRects(bitmapWidth, bitmapHeight, slice)
    local dstRects = Slice9.buildDstRects(w, h, srcRects)
    return { src = srcRects, dst = dstRects }
end

function Slice9.buildSrcRects(bw, bh, slice)
    local x1, y1 = slice.left, slice.top
    local x2, y2 = slice:get_right(), slice:get_bottom()
    local r = {}
    table.insert(r, Rectangle.new(0, 0, x1, y1))
    table.insert(r, Rectangle.new(x1, 0, x2 - x1, y1))
    table.insert(r, Rectangle.new(x2, 0, bw - x2, y1))
    table.insert(r, Rectangle.new(0, y1, x1, y2 - y1))
    table.insert(r, Rectangle.new(x1, y1, x2 - x1, y2 - y1))
    table.insert(r, Rectangle.new(x2, y1, bw - x2, y2 - y1))
    table.insert(r, Rectangle.new(0, y2, x1, bh - y2))
    table.insert(r, Rectangle.new(x1, y2, x2 - x1, bh - y2))
    table.insert(r, Rectangle.new(x2, y2, bw - x2, bh - y2))
    return r
end

function Slice9.buildDstRects(w, h, src)
    local r = {}
    table.insert(r, Rectangle.new(0, 0, src[1].width, src[1].height))
    table.insert(r, Rectangle.new(src[1].width, 0, w - src[1].width - src[3].width, src[2].height))
    table.insert(r, Rectangle.new(w - src[3].width, 0, src[3].width, src[3].height))
    table.insert(r, Rectangle.new(0, src[1].height, src[4].width, h - src[1].height - src[7].height))
    table.insert(r, Rectangle.new(src[4].width, src[1].height, w - src[4].width - src[6].width, h - src[1].height - src[7].height))
    table.insert(r, Rectangle.new(w - src[6].width, src[1].height, src[6].width, h - src[1].height - src[7].height))
    table.insert(r, Rectangle.new(0, h - src[7].height, src[7].width, src[7].height))
    table.insert(r, Rectangle.new(src[7].width, h - src[8].height, w - src[7].width - src[9].width, src[8].height))
    table.insert(r, Rectangle.new(w - src[9].width, h - src[9].height, src[9].width, src[9].height))
    return r
end

return Slice9
