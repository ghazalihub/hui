local Directive = {}
Directive.__index = Directive
function Directive.new(directive, value) return setmetatable({ directive = directive, value = value }, Directive) end
return Directive
