local FileSaver = {}
FileSaver.__index = FileSaver
function FileSaver.new() return setmetatable({}, FileSaver) end
return FileSaver
