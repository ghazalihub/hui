--[[
    ClassFactory.
    Faithful port of haxe_ui.core.ClassFactory.
--]]

local ClassFactory = {}
ClassFactory.__index = ClassFactory

function ClassFactory.new(generator, properties)
    local self = setmetatable({}, ClassFactory)
    self.generator = generator
    self.properties = properties
    return self
end

function ClassFactory:newInstance()
    local instance = self.generator.new()

    if self.properties ~= nil then
        for property, value in pairs(self.properties) do
            -- In Lua, we use the property name as a key or look for a setter
            local setter = "set_" .. property
            if instance[setter] then
                instance[setter](instance, value)
            else
                instance[property] = value
            end
        end
    end

    return instance
end

return ClassFactory
