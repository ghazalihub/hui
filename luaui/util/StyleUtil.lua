local StyleUtil = {}
function StyleUtil.styleProperty2ComponentProperty(p)
    return p:gsub("%-(%w)", function(s) return s:upper() end)
end
return StyleUtil
