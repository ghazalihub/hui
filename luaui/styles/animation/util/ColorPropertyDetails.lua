local ColorPropertyDetails = {}
ColorPropertyDetails.__index = ColorPropertyDetails
function ColorPropertyDetails.new(t, name, start, cR, cG, cB, cA)
    return setmetatable({ target = t, propertyName = name, start = start, changeR = cR, changeG = cG, changeB = cB, changeA = cA }, ColorPropertyDetails)
end
return ColorPropertyDetails
