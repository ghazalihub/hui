local GenericConfig = {}
GenericConfig.__index = GenericConfig
function GenericConfig.new() return setmetatable({ values = {} }, GenericConfig) end
return GenericConfig
