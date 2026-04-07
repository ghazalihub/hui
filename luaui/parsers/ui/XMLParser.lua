local ComponentParser = require("luaui.parsers.ui.ComponentParser")
local XMLParser = setmetatable({}, { __index = ComponentParser })
function XMLParser.new() return setmetatable(ComponentParser.new(), XMLParser) end
return XMLParser
