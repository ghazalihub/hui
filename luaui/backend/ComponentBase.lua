local ComponentSurface = require("luaui.backend.ComponentSurface")
local EventMap = require("luaui.util.EventMap")

local ComponentBase = setmetatable({}, { __index = ComponentSurface })
ComponentBase.__index = ComponentBase

function ComponentBase.new()
    local self = setmetatable(ComponentSurface.new(), ComponentBase)
    self._children = {}
    self._id = nil
    self._depth = -1
    self._parentComponent = nil
    self.__events = nil
    return self
end

function ComponentBase:addComponent(child)
    table.insert(self._children, child)
    child.parentComponent = self
    self:invalidateComponent("layout")
    return child
end

function ComponentBase:removeComponent(child, dispose)
    for i, v in ipairs(self._children) do
        if v == child then
            table.remove(self._children, i)
            child.parentComponent = nil
            if dispose then child:handleDestroy() end
            self:invalidateComponent("layout")
            return child
        end
    end
end

function ComponentBase:registerEvent(type, listener, priority)
    if self.__events == nil then self.__events = EventMap.new() end
    if self.__events:add(type, listener, priority) then
        self:mapEvent(type)
    end
end

function ComponentBase:dispatch(event)
    if self.__events then self.__events:invoke(event.type, event, self) end
    if event.bubble and not event.canceled and self.parentComponent then
        self.parentComponent:dispatch(event)
    end
end

function ComponentBase:get_id() return self._id end
function ComponentBase:set_id(v) self._id = v end
function ComponentBase:get_depth() return self._depth end
function ComponentBase:set_depth(v) self._depth = v end
function ComponentBase:get_numComponents() return #self._children end

function ComponentBase:invalidateComponent(flag) end
function ComponentBase:validateComponent() end
function ComponentBase:handleDestroy() end
function ComponentBase:mapEvent(type) end

return ComponentBase
