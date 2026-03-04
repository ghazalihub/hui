--[[
    DataSource.
    Faithful port of haxe_ui.data.DataSource.
--]]

local DataSource = {}
DataSource.__index = DataSource

function DataSource.new(transformer)
    local self = setmetatable({}, DataSource)
    self.transformer = transformer
    self._allowCallbacks = true
    self._changed = false
    self.onAdd = nil
    self.onChange = nil
    return self
end

function DataSource:get_size() return self:handleGetSize() end

function DataSource:get(index)
    local r = self:handleGetItem(index)
    if self.transformer ~= nil then
        r = self.transformer:transformFrom(r)
    end
    return r
end

function DataSource:add(item)
    local index = self:handleAddItem(item)
    self:handleChanged()
    if self._allowCallbacks and self.onAdd then self.onAdd(item) end
    return index
end

function DataSource:handleChanged()
    self._changed = true
    if self._allowCallbacks then
        self._changed = false
        if self.onChange then self.onChange() end
    end
end

-- Stubs for overrides
function DataSource:handleGetSize() return 0 end
function DataSource:handleGetItem(index) return nil end
function DataSource:handleAddItem(item) return -1 end

return DataSource
