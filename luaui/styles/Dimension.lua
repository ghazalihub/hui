local Dimension = {}
function Dimension.PERCENT(v) return { type = "percent", value = v } end
function Dimension.PX(v) return { type = "px", value = v } end
function Dimension.VW(v) return { type = "vw", value = v } end
function Dimension.VH(v) return { type = "vh", value = v } end
return Dimension
