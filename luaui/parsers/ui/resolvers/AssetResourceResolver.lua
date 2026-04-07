local ResourceResolver = require("luaui.parsers.ui.resolvers.ResourceResolver")
local AssetResourceResolver = setmetatable({}, { __index = ResourceResolver })
AssetResourceResolver.__index = AssetResourceResolver
function AssetResourceResolver.new(p) return setmetatable(ResourceResolver.new(p), AssetResourceResolver) end
return AssetResourceResolver
