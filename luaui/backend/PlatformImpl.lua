local PlatformBase = require("luaui.backend.PlatformBase")
local PlatformImpl = setmetatable({}, { __index = PlatformBase })
PlatformImpl.__index = PlatformImpl
function PlatformImpl.new() return setmetatable(PlatformBase.new(), PlatformImpl) end
return PlatformImpl
