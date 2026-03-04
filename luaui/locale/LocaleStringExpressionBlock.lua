--[[
    LocaleStringExpressionBlock.
    Faithful port of haxe_ui.locale.LocaleStringExpressionBlock.
--]]

local LocaleStringExpressionBlock = {}
LocaleStringExpressionBlock.__index = LocaleStringExpressionBlock

function LocaleStringExpressionBlock.new()
    local self = setmetatable({}, LocaleStringExpressionBlock)
    self.expressions = {}
    return self
end

function LocaleStringExpressionBlock:evaluate(p0, p1, p2, p3)
    for _, expr in ipairs(self.expressions) do
        if not expr.isDefault and expr:evaluate(p0, p1, p2, p3) then
            return expr.expressionResult
        end
    end

    for _, expr in ipairs(self.expressions) do
        if expr.isDefault then
            return expr.expressionResult
        end
    end

    return nil
end

return LocaleStringExpressionBlock
