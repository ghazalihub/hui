local ValidatorManager = {}
ValidatorManager.__index = ValidatorManager
local _instance = nil
function ValidatorManager.get_instance()
    if not _instance then _instance = setmetatable({ _registeredValidators = {} }, ValidatorManager) end
    return _instance
end
return ValidatorManager
