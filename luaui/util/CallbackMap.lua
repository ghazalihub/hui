local CallbackMap = {}
CallbackMap.__index = CallbackMap
function CallbackMap.new() return setmetatable({ _map = {} }, CallbackMap) end
return CallbackMap
