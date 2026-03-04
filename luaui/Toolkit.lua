local Toolkit = { _initialized = false }
function Toolkit.init(options) Toolkit._initialized = true end
function Toolkit.callLater(fn) require("luaui.backend.CallLaterImpl").new(fn) end
return Toolkit
