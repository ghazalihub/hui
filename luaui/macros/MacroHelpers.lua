local MacroHelpers = {}
function MacroHelpers.extension(path) if path:find("%.") == nil then return nil end return path:match("%.([^.]+)$") end
return MacroHelpers
