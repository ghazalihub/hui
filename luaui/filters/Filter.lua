--[[
    Filter base class.
    Faithful port of haxe_ui.filters.Filter.
--]]

local Filter = {}
Filter.__index = Filter

function Filter.new()
    local self = setmetatable({}, Filter)
    return self
end

function Filter:parse(filterDetails)
    -- This should be overridden by sub-classes
end

function Filter.applyDefaults(params, defaults)
    local copy = {}
    if defaults ~= nil then
        for _, p in ipairs(defaults) do
            table.insert(copy, p)
        end
    end
    if params ~= nil then
        for i, p in ipairs(params) do
            copy[i] = p
        end
    end
    return copy
end

return Filter
