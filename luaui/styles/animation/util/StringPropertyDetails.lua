local StringPropertyDetails = {}
StringPropertyDetails.__index = StringPropertyDetails
function StringPropertyDetails.new(target, name, start, ["end"])
    return setmetatable({ target = target, propertyName = name, start = start, ["end"] = ["end"] }, StringPropertyDetails)
end
return StringPropertyDetails
