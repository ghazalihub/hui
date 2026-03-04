local Directive = require("luaui.styles.elements.Directive")
local DirectiveExtension = setmetatable({}, { __index = Directive })
function DirectiveExtension.new(d, v) return setmetatable(Directive.new(d, v), DirectiveExtension) end
return DirectiveExtension
