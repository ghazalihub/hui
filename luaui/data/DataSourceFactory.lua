--[[
    DataSourceFactory.
    Faithful port of haxe_ui.data.DataSourceFactory.
--]]

local DataSourceFactory = {}
DataSourceFactory.__index = DataSourceFactory

function DataSourceFactory.new()
    local self = setmetatable({}, DataSourceFactory)
    return self
end

function DataSourceFactory:create(typeClass)
    return typeClass.new()
end

function DataSourceFactory:fromString(data, typeClass)
    local ds = self:create(typeClass)
    -- Logic to convert XML/JSON string to objects and add to data source
    return ds
end

function DataSourceFactory:fromStringToArray(data)
    -- Logic to convert XML/JSON string to array of objects
    return {}
end

return DataSourceFactory
