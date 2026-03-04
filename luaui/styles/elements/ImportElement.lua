local ImportElement = {}
ImportElement.__index = ImportElement
function ImportElement.new(url) return setmetatable({ url = url }, ImportElement) end
return ImportElement
