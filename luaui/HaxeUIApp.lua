local HaxeUIApp = {}
HaxeUIApp.__index = HaxeUIApp
function HaxeUIApp.new() return setmetatable({}, HaxeUIApp) end
function HaxeUIApp:ready(onReady) if onReady then onReady() end end
return HaxeUIApp
