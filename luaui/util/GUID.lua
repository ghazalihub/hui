local GUID = {}
function GUID.uuid()
    local fn = function(x)
        local r = math.random(16) - 1
        r = (x == "x") and r or (r % 4) + 8
        return string.format("%x", r)
    end
    return (string.gsub("xxxxxxxx-xxxx-4xxx-yxxx-xxxxxxxxxxxx", "[xy]", fn))
end
return GUID
