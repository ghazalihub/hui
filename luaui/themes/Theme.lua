local Theme = {}
Theme.__index = Theme
function Theme.new()
    return setmetatable({ styles = {}, vars = {}, images = {} }, Theme)
end
return Theme
