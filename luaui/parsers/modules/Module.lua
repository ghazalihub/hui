--[[
    Module parser and container logic.
    Faithful port of haxe_ui.parsers.modules.Module.
--]]

local Module = {}
Module.__index = Module

function Module.new()
    local self = setmetatable({
        resourceEntries = {},
        componentEntries = {},
        layoutEntries = {},
        themeEntries = {},
        properties = {},
        preload = {},
        locales = {},
        validators = {},
        namespaces = {}
    }, Module)
    return self
end

function Module:validate()
    if next(self.namespaces) == nil then
        self.namespaces["core"] = "urn::haxeui::org"
    end
end

return Module
