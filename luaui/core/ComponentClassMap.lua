local ComponentClassMap = { _map = {} }

local function load()
    -- Mock load from resource
end

function ComponentClassMap.get(alias)
    load()
    alias = alias:gsub("-", ""):lower()
    return ComponentClassMap._map[alias]
end

function ComponentClassMap.register(alias, className)
    load()
    ComponentClassMap._map[alias:lower()] = className
end

function ComponentClassMap.list()
    load()
    local keys = {}
    for k in pairs(ComponentClassMap._map) do table.insert(keys, k) end
    local i = 0
    return function()
        i = i + 1
        return keys[i]
    end
end

function ComponentClassMap.hasClass(className)
    load()
    for _, v in pairs(ComponentClassMap._map) do
        if v == className then return true end
    end
    return false
end

return ComponentClassMap
