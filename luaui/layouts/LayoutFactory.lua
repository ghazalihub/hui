--[[
    LayoutFactory.
    Faithful port of haxe_ui.layouts.LayoutFactory.
--]]

local LayoutFactory = { _map = {} }

function LayoutFactory.createFromName(name)
    local className = LayoutFactory._map[name:lower()]
    if className == nil then
        -- trace("WARNING: layout '" .. name .. "' not found")
        return nil -- Should return a DefaultLayout once ported
    end

    -- Logic to resolve class and create instance
    return nil
end

function LayoutFactory.register(name, className)
    LayoutFactory._map[name:lower()] = className
end

function LayoutFactory.lookupClass(name)
    return LayoutFactory._map[name:lower()]
end

return LayoutFactory
