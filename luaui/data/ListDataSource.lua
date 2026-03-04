--[[
    ListDataSource.
    Faithful port of haxe_ui.data.ListDataSource.
--]]

local DataSource = require("luaui.data.DataSource")

local ListDataSource = setmetatable({}, { __index = DataSource })
ListDataSource.__index = ListDataSource

function ListDataSource.new(transformer)
    local self = setmetatable(DataSource.new(transformer), ListDataSource)
    self._list = {} -- Lua doesn't have a linked list by default, using array
    return self
end

function ListDataSource:handleGetSize() return #self._list end
function ListDataSource:handleGetItem(index) return self._list[index + 1] end
function ListDataSource:handleAddItem(item)
    table.insert(self._list, item)
    return #self._list - 1
end

return ListDataSource
