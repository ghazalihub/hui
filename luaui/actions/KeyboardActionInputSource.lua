local KeyboardActionInputSource = {}
KeyboardActionInputSource.__index = KeyboardActionInputSource
function KeyboardActionInputSource.new() return setmetatable({}, KeyboardActionInputSource) end
return KeyboardActionInputSource
