local TextField = {}
TextField.__index = TextField
function TextField.new() return setmetatable({ _text = "", _width = 200, _height = 100 }, TextField) end
function TextField:render() end
return TextField
