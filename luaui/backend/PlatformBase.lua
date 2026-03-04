local PlatformBase = {}
PlatformBase.__index = PlatformBase
function PlatformBase.new() return setmetatable({ _isMobile = nil }, PlatformBase) end
function PlatformBase:get_isWindows() return love.system.getOS() == "Windows" end
function PlatformBase:get_isLinux() return love.system.getOS() == "Linux" end
function PlatformBase:get_isMac() return love.system.getOS() == "OS X" end
function PlatformBase:get_isMobile()
    if self._isMobile == nil then
        local os = love.system.getOS()
        self._isMobile = (os == "Android" or os == "iOS")
    end
    return self._isMobile
end
function PlatformBase:perf() return love.timer.getTime() * 1000 end
function PlatformBase:getKeyCode(keyId) return string.byte(keyId, 1) end
return PlatformBase
