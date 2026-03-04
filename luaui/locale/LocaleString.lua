local LocaleString = {}
LocaleString.__index = LocaleString

function LocaleString.new()
    local self = setmetatable({ parts = {}, _isSimple = true, _cachedValue = nil }, LocaleString)
    return self
end

function LocaleString:parse(s)
    self.parts = {}
    local n = s:find("=")
    if not n then return end
    self.id = s:sub(1, n-1):gsub("^%s*(.-)%s*$", "%1")
    local val = s:sub(n+1):gsub("^%s*(.-)%s*$", "%1")

    local last = 1
    for start, finish, block in val:gmatch("(){(.-)}()") do
        if start > last then table.insert(self.parts, { type = "literal", value = val:sub(last, start-1) }) end
        local exp = require("luaui.locale.LocaleStringExpressionBlock").new()
        exp:parse(block)
        table.insert(self.parts, { type = "expression", value = exp })
        self._isSimple = false
        last = finish
    end
    if last <= #val then table.insert(self.parts, { type = "literal", value = val:sub(last) }) end
end

function LocaleString:build(p0, p1, p2, p3)
    if self._isSimple and self._cachedValue then return self._cachedValue end
    local res = ""
    for _, p in ipairs(self.parts) do
        if p.type == "literal" then res = res .. p.value
        elseif p.type == "expression" then res = res .. (p.value:evaluate(p0, p1, p2, p3) or "") end
    end
    if p0 then res = res:gsub("%[0%]", tostring(p0)) end
    if p1 then res = res:gsub("%[1%]", tostring(p1)) end
    if p2 then res = res:gsub("%[2%]", tostring(p2)) end
    if p3 then res = res:gsub("%[3%]", tostring(p3)) end
    if self._isSimple then self._cachedValue = res end
    return res
end

return LocaleString
