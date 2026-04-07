local MathUtil = {}
function MathUtil.round(v, p)
    local m = 10^(p or 0)
    return math.floor(v * m + 0.5) / m
end
function MathUtil.min(arr)
    local m = arr[1]
    for i=2,#arr do if arr[i] < m then m = arr[i] end end
    return m
end
function MathUtil.max(arr)
    local m = arr[1]
    for i=2,#arr do if arr[i] > m then m = arr[i] end end
    return m
end
return MathUtil
