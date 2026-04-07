local DataSource = require("luaui.data.DataSource")
local ListDataSource = setmetatable({}, { __index = DataSource })
ListDataSource.__index = ListDataSource
function ListDataSource.new(tr)
    local self = setmetatable(DataSource.new(tr), ListDataSource)
    self._list = {}
    return self
end
function ListDataSource:handleGetSize() return #self._list end
function ListDataSource:handleGetItem(i) return self._list[i + 1] end
function ListDataSource:handleAddItem(item) table.insert(self._list, item); return #self._list - 1 end
return ListDataSource
