--[[
    AssetResourceResolver.
    Faithful port of haxe_ui.parsers.ui.resolvers.AssetResourceResolver.
--]]

local ResourceResolver = require("luaui.parsers.ui.resolvers.ResourceResolver")

local AssetResourceResolver = setmetatable({}, { __index = ResourceResolver })
AssetResourceResolver.__index = AssetResourceResolver

function AssetResourceResolver.new(params)
    return setmetatable(ResourceResolver.new(params), AssetResourceResolver)
end

function AssetResourceResolver:getResourceData(r)
    -- Logic to get resource from ToolkitAssets/ResourceManager
    return nil
end

return AssetResourceResolver
