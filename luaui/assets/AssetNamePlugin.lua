--[[
    AssetNamePlugin.
    Faithful port of haxe_ui.assets.AssetNamePlugin.
--]]

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
    else
        AssetPlugin.setProperty(self, name, value)
    end
end

function AssetNamePlugin:invoke(asset)
    if type(asset) == "string" then
        local stringAsset = asset
        local match = true
        local compare = nil

        if self.startsWith ~= nil then
            match = stringAsset:find(self.startsWith, 1, true) == 1
            compare = self.startsWith
        end

        if self.endsWith ~= nil then
            match = stringAsset:sub(-#self.endsWith) == self.endsWith
            compare = self.endsWith
        end

        if match then
            if self.prefix ~= nil then
                asset = self.prefix .. stringAsset
            end
            if self.replaceWith ~= nil then
                if compare then
                    asset = asset:gsub(compare, self.replaceWith)
                end
                if self.findChars ~= nil then
                    for n = 1, #self.findChars do
                        local ch = self.findChars:sub(n, n)
                        asset = asset:gsub(ch, self.replaceWith)
                    end
                end
            end

            stringAsset = asset
            if self.removeExtension then
                local n = stringAsset:find("%.[^%.]*$")
                if n ~= nil then
                    asset = stringAsset:sub(1, n - 1)
                end
            end
        end
    end
    return asset
end

return AssetNamePlugin
