local ConfigParser = require("luaui.parsers.config.ConfigParser")
local XMLParser = setmetatable({}, { __index = ConfigParser })
function XMLParser.new() return setmetatable(ConfigParser.new(), XMLParser) end
return XMLParser
