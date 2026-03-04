local TypeConverter = {}
function TypeConverter.convertFrom(i)
    if type(i) == "string" then
        if i == "true" then return true elseif i == "false" then return false end
        local n = tonumber(i)
        if n then return n end
    end
    return i
end
return TypeConverter
