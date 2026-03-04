local CssFilters = { _cssFilters = {} }
function CssFilters.registerCssFilter(n, c) CssFilters._cssFilters[n] = c end
function CssFilters.hasCssFilter(n) return CssFilters._cssFilters[n] ~= nil end
function CssFilters.getCssFilter(n) return CssFilters._cssFilters[n] end
return CssFilters
