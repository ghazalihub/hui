local ColorUtil = {}
function ColorUtil.parseColor(s)
    if s:find("#") == 1 then s = s:sub(2) end
    if s:find("0x") == 1 then s = s:sub(3) end
    return tonumber(s, 16)
end
return ColorUtil
