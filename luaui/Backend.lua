--[[
    Backend.
    Faithful port of haxe_ui.Backend.
--]]

local BackendImpl = require("luaui.backend.BackendImpl")

local Backend = setmetatable({}, { __index = BackendImpl })

function Backend.get_id()
    return BackendImpl.id
end

return Backend
