local ResourceResolver = require("luaui.parsers.ui.resolvers.ResourceResolver")
local FileResourceResolver = setmetatable({}, { __index = ResourceResolver })
FileResourceResolver.__index = FileResourceResolver
function FileResourceResolver.new(p) return setmetatable(ResourceResolver.new(p), FileResourceResolver) end
return FileResourceResolver
