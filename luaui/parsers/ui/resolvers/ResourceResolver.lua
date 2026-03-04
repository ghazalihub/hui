local ResourceResolver = {}
ResourceResolver.__index = ResourceResolver

function ResourceResolver.new(params)
    local self = setmetatable({ _params = params }, ResourceResolver)
    return self
end

function ResourceResolver:extension(path)
    if path:find("%.") == nil then return nil end
    return path:match("%.([^.]+)$")
end

return ResourceResolver
