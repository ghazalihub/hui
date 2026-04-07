--[[
    LocaleStringExpression.
    Faithful port of haxe_ui.locale.LocaleStringExpression.
--]]

local LocaleStringExpression = {}
LocaleStringExpression.__index = LocaleStringExpression

function LocaleStringExpression.new()
    local self = setmetatable({}, LocaleStringExpression)
    self.isDefault = false
    self.varName = nil
    self.expression = nil
    self.expressionResult = nil
    return self
end

function LocaleStringExpression:evaluate(p0, p1, p2, p3)
    if self.isDefault then return true end
    -- Logic for evaluating expressions like var == value or var in range
    return false
end

return LocaleStringExpression
