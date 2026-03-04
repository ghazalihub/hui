local Preloader = {}
Preloader.__index = Preloader
function Preloader.new() return setmetatable({}, Preloader) end
return Preloader
