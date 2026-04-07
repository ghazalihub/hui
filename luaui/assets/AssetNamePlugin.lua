local AssetPlugin = require("luaui.assets.AssetPlugin")
local AssetNamePlugin = setmetatable({}, { __index = AssetPlugin })
AssetNamePlugin.__index = AssetNamePlugin

function AssetNamePlugin.new()
    local self = setmetatable(AssetPlugin.new(), AssetNamePlugin)
    self.startsWith = nil
    self.prefix = nil
    self.replaceWith = nil
    self.removeExtension = false
    self.findChars = nil
    self.endsWith = nil
    return self
end

function AssetNamePlugin:setProperty(name, value)
    if name == "startsWith" then self.startsWith = value
    elseif name == "prefix" then self.prefix = value
    elseif name == "replaceWith" then self.replaceWith = value
    elseif name == "removeExtension" then self.removeExtension = (value == "true")
    elseif name == "findChars" then self.findChars = value
    elseif name == "endsWith" then self.endsWith = value
    else AssetPlugin.setProperty(self, name, value) end
end

function AssetNamePlugin:invoke(asset)
    if type(asset) == "string" then
        local match = true
        if self.startsWith then match = asset:find(self.startsWith, 1, true) == 1 end
        if self.endsWith then match = match and (asset:sub(-#self.endsWith) == self.endsWith) end
        if match then
            if self.prefix then asset = self.prefix .. asset end
            if self.replaceWith then
                if self.findChars then
                    for n = 1, #self.findChars do
                        local ch = self.findChars:sub(n, n)
                        asset = asset:gsub("[%-" .. ch .. "]", self.replaceWith)
                    end
                end
            end
            if self.removeExtension then asset = asset:gsub("%.[^%.]*$", "") end
        end
    end
    return asset
end

return AssetNamePlugin
