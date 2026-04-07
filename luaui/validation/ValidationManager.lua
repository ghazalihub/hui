local ValidationManager = {}
ValidationManager.__index = ValidationManager

local _instance = nil

function ValidationManager.get_instance()
    if _instance == nil then
        _instance = setmetatable({
            isValidating = false,
            isPending = false,
            _queue = {},
            _displayQueue = {}
        }, ValidationManager)
    end
    return _instance
end

function ValidationManager:add(object)
    for _, v in ipairs(self._queue) do
        if v == object then return end
    end

    if self.isValidating then
        local depth = object:get_depth()
        local min = 1
        local max = #self._queue
        local i = 1
        local otherDepth = 0
        while max >= min do
            i = math.floor((min + max) / 2)
            otherDepth = self._queue[i]:get_depth()
            if otherDepth == depth then break
            elseif otherDepth < depth then max = i - 1
            else min = i + 1 end
        end
        if otherDepth >= depth then i = i + 1 end
        table.insert(self._queue, i, object)
    else
        table.insert(self._queue, object)
        if not self.isPending then
            self.isPending = true
            require("luaui.backend.CallLaterImpl").new(function() self:process() end)
        end
    end
end

function ValidationManager:process()
    if self.isValidating or not self.isPending then return end
    if #self._queue == 0 then self.isPending = false; return end

    self.isValidating = true
    table.sort(self._queue, function(a, b) return a:get_depth() > b:get_depth() end)

    while #self._queue > 0 do
        local item = table.remove(self._queue, 1)
        if item:get_depth() >= 0 then item:validateComponent() end
    end

    for _, item in ipairs(self._displayQueue) do item:updateComponentDisplay() end
    self._displayQueue = {}

    self.isValidating = false
    if #self._queue > 0 then
        self.isPending = true
        require("luaui.backend.CallLaterImpl").new(function() self:process() end)
    else self.isPending = false end
end

return ValidationManager
