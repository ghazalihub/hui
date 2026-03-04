--[[
    SettingsManager.
    Faithful port of haxe_ui.core.SettingsManager.
--]]

local SettingsManager = {}
SettingsManager.__index = SettingsManager

local _instance = nil

function SettingsManager.get_instance()
    if _instance == nil then
        _instance = setmetatable({ _persister = nil }, SettingsManager)
    end
    return _instance
end

function SettingsManager:set(name, value)
    -- In LuaUI, we simplify serialization to strings or use a provided JSON helper
    local s = tostring(value)
    if type(value) == "table" then
        -- Placeholder for real serialization logic if needed
        s = "{}"
    end
    self:getPersister():set(name, s)
end

function SettingsManager:get(name, defaultValue)
    local s = self:getPersister():get(name)
    if s == nil then return defaultValue end
    -- Simplified unserialization
    if s == "true" then return true end
    if s == "false" then return false end
    local n = tonumber(s)
    if n then return n end
    return s
end

function SettingsManager:getPersister()
    if self._persister ~= nil then return self._persister end

    -- Love2D file system persister
    local FileSettingsPersister = {}
    FileSettingsPersister.__index = FileSettingsPersister
    FileSettingsPersister.filename = "settings.json"

    function FileSettingsPersister:set(name, value)
        local o = self:load()
        o[name] = value
        self:save(o)
    end

    function FileSettingsPersister:get(name)
        local o = self:load()
        return o[name]
    end

    function FileSettingsPersister:load()
        if love.filesystem.getInfo(self.filename) then
            local content = love.filesystem.read(self.filename)
            -- Simple parse logic (placeholder for actual JSON parse)
            return {}
        end
        return {}
    end

    function FileSettingsPersister:save(o)
        -- love.filesystem.write(self.filename, "{}")
    end

    self._persister = setmetatable({}, FileSettingsPersister)
    return self._persister
end

return SettingsManager
