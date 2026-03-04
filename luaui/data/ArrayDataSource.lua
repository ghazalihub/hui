local DataSource = require("luaui.data.DataSource")
local ArrayDataSource = setmetatable({}, { __index = DataSource })
ArrayDataSource.__index = ArrayDataSource
function ArrayDataSource.new(tr)
    local self = setmetatable(DataSource.new(tr), ArrayDataSource)
    self._array = {}
    return self
end
function ArrayDataSource:handleGetSize() return #self._array end
function ArrayDataSource:handleGetItem(i) return self._array[i + 1] end
function ArrayDataSource:handleAddItem(item) table.insert(self._array, item); return #self._array - 1 end
return ArrayDataSource
