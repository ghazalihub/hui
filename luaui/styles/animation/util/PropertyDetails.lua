local PropertyDetails = {}
PropertyDetails.__index = PropertyDetails
function PropertyDetails.new(target, name, start, change)
    return setmetatable({ target = target, propertyName = name, start = start, change = change }, PropertyDetails)
end
return PropertyDetails
