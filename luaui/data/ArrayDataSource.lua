--[[
    ArrayDataSource.
    Faithful port of haxe_ui.data.ArrayDataSource.
--]]

local DataSource = require("luaui.data.DataSource")

local ArrayDataSource = setmetatable({}, { __index = DataSource })
ArrayDataSource.__index = ArrayDataSource

function ArrayDataSource.new(transformer)
    local self = setmetatable(DataSource.new(transformer), ArrayDataSource)
    self._array = {}
    return self
end

function ArrayDataSource:handleGetSize() return #self._array end
function ArrayDataSource:handleGetItem(index) return self._array[index + 1] end
function ArrayDataSource:handleAddItem(item)
    table.insert(self._array, item)
    return #self._array - 1
end

function ArrayDataSource.fromArray(source, transformer)
    local ds = ArrayDataSource.new(transformer)
    ds._array = source
    return ds
end

return ArrayDataSource
