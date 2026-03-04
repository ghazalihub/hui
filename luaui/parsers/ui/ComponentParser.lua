local ComponentParser = {}
ComponentParser.__index = ComponentParser
ComponentParser._parsers = {}
function ComponentParser.new() return setmetatable({}, ComponentParser) end
function ComponentParser.get(ext) return nil end
return ComponentParser
