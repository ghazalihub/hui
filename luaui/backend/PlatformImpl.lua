--[[
    PlatformImpl.
    Faithful port of haxe_ui.backend.PlatformImpl.
--]]

local PlatformBase = require("luaui.backend.PlatformBase")

local PlatformImpl = setmetatable({}, { __index = PlatformBase })
PlatformImpl.__index = PlatformImpl

function PlatformImpl.new()
    local self = setmetatable(PlatformBase.new(), PlatformImpl)
    return self
end

return PlatformImpl
