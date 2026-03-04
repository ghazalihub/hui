--[[
    CallLater.
    Faithful port of haxe_ui.CallLater.
--]]

local CallLaterImpl = require("luaui.backend.CallLaterImpl")

local CallLater = setmetatable({}, { __index = CallLaterImpl })
CallLater.__index = CallLater

function CallLater.new(fn)
    local self = setmetatable(CallLaterImpl.new(fn), CallLater)
    return self
end

return CallLater
