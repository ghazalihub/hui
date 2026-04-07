local PlatformImpl = require("luaui.backend.PlatformImpl")
local Platform = setmetatable({}, { __index = PlatformImpl })
local _instance = nil
function Platform.get_instance()
    if not _instance then _instance = setmetatable(PlatformImpl.new(), Platform) end
    return _instance
end
return Platform
