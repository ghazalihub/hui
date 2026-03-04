local DataSource = {}
DataSource.__index = DataSource
function DataSource.new(tr)
    local self = setmetatable({ transformer = tr, _allowCallbacks = true, _changed = false }, DataSource)
    return self
end
function DataSource:get(i)
    local r = self:handleGetItem(i)
    if self.transformer then r = self.transformer:transformFrom(r) end
    return r
end
function DataSource:add(item)
    local idx = self:handleAddItem(item)
    self:handleChanged()
    if self._allowCallbacks and self.onAdd then self.onAdd(item) end
    return idx
end
function DataSource:handleChanged()
    self._changed = true
    if self._allowCallbacks then self._changed = false; if self.onChange then self.onChange() end end
end
return DataSource
