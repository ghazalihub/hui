local CallLaterImpl = require("luaui.backend.CallLaterImpl")
return { new = function(fn) return CallLaterImpl.new(fn) end }
