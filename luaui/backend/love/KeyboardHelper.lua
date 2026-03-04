--[[
    KeyboardHelper.
    Faithful port of haxe_ui.backend.kha.KeyboardHelper for Love2D.
--]]

local KeyboardHelper = {}

KeyboardHelper.listen = nil
KeyboardHelper.unlisten = nil

function KeyboardHelper.init(opts)
    -- In Love2D, we typically use the callbacks in main.lua.
    -- This helper can act as a registry.
    if opts then
        KeyboardHelper.listen = opts.listen
        KeyboardHelper.unlisten = opts.unlisten
    end
end

function KeyboardHelper.isInitialized()
    return KeyboardHelper.listen ~= nil
end

return KeyboardHelper
