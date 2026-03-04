--[[
    CodeBuilder.
    Mimics Haxe macro CodeBuilder using Lua meta-programming / string generation.
--]]

local CodeBuilder = {}
CodeBuilder.__index = CodeBuilder

function CodeBuilder.new(initialCode)
    local self = setmetatable({}, CodeBuilder)
    self.lines = {}
    if initialCode then
        table.insert(self.lines, initialCode)
    end
    return self
end

function CodeBuilder:add(code, where)
    where = where or "End"
    if where == "Start" then
        table.insert(self.lines, 1, code)
    elseif where == "End" then
        table.insert(self.lines, code)
    elseif type(where) == "number" then
        table.insert(self.lines, where, code)
    end
end

function CodeBuilder:toString()
    return table.concat(self.lines, "\n")
end

function CodeBuilder:execute(context)
    local f, err = load(self:toString(), "CodeBuilder", "t", context or _G)
    if not f then error(err) end
    return f()
end

return CodeBuilder
