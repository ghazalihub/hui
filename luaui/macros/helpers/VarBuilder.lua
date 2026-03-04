--[[
    VarBuilder.
    Mimics Haxe macro VarBuilder for Lua meta-programming.
--]]

local VarBuilder = {}
VarBuilder.__index = VarBuilder

function VarBuilder.new(name, initialValue)
    local self = setmetatable({}, VarBuilder)
    self.name = name
    self.initialValue = initialValue
    return self
end

function VarBuilder:toString()
    local val = self.initialValue
    if type(val) == "string" then val = '"' .. val .. '"' end
    return "local " .. self.name .. " = " .. tostring(val or "nil")
end

return VarBuilder
