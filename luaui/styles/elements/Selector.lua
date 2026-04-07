local Selector = {}
Selector.__index = Selector
function Selector.new(s)
    local self = setmetatable({ parts = {} }, Selector)
    for part in s:gmatch("([^%s>]+)") do
        -- logic to parse part into SelectorPart
    end
    return self
end
return Selector
