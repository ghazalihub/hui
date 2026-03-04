--[[
    CssFilters.
    Faithful port of haxe_ui.styles.CssFilters.
--]]

local CssFilters = { _cssFilters = {} }

function CssFilters.registerCssFilter(name, ctor)
    CssFilters._cssFilters[name] = ctor
end

function CssFilters.hasCssFilter(name)
    return CssFilters._cssFilters[name] ~= nil
end

function CssFilters.getCssFilter(name)
    return CssFilters._cssFilters[name]
end

return CssFilters
