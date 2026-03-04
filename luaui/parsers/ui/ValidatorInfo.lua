local ValidatorInfo = {}
ValidatorInfo.__index = ValidatorInfo
function ValidatorInfo.new() return setmetatable({ properties = {} }, ValidatorInfo) end
return ValidatorInfo
