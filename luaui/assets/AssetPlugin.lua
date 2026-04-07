local AssetPlugin = {}
AssetPlugin.__index = AssetPlugin
function AssetPlugin.new()
    local self = setmetatable({}, AssetPlugin)
    self._props = {}
    return self
end
function AssetPlugin:invoke(asset) return asset end
function AssetPlugin:setProperty(name, value) self._props[name] = value end
function AssetPlugin:getProperty(name, defaultValue) return self._props[name] or defaultValue end
return AssetPlugin
