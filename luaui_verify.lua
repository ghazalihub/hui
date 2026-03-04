-- Mock love for terminal verification
if not love then
    love = {
        timer = { getTime = function() return os.clock() end },
        system = { getOS = function() return "Linux" end },
        graphics = {
            setColor = function() end,
            rectangle = function() end,
            circle = function() end,
            line = function() end,
            setFont = function() end,
            print = function() end,
            setScissor = function() end,
            getFont = function() return { getWidth = function() return 10 end, getHeight = function() return 10 end } end
        },
        filesystem = {
            getDirectoryItems = function() return {} end,
            getInfo = function() return {type="file"} end,
            read = function() return "{}" end,
            write = function() return true end
        }
    }
end

-- Test script
local ActionType = require("luaui.actions.ActionType")
local Component = require("luaui.core.Component")
local WindowFooter = require("luaui.containers.windows.WindowFooter")
local MouseEvent = require("luaui.events.MouseEvent")
local InvalidationFlags = require("luaui.validation.InvalidationFlags")
local Color = require("luaui.util.Color")

print("LuaUI Port Batch 1, 2 & 3 Verification")
print("------------------------------------")

-- 1. Test Actions
print("ActionType.PRESS: " .. ActionType.PRESS)

-- 2. Test Component Lifecycle
local root = Component.new()
root:set_id("root")
print("Root Component ID: " .. root:get_id())

local footer = WindowFooter.new()
footer:set_id("footer")
root:addComponent(footer)
print("Added WindowFooter to root. Child count: " .. root:get_numComponents())

-- 3. Test Event Dispatching (Bubbling)
local clicked = false
root:registerEvent(MouseEvent.CLICK, function(e)
    print("Root caught click from footer! Bubble worked.")
    clicked = true
end)

local event = MouseEvent.new(MouseEvent.CLICK)
event.bubble = true
footer:dispatch(event)

if clicked then
    print("Event dispatching/bubbling working correctly.")
else
    print("FAILED: Event dispatching failed.")
end

-- 4. Test Invalidation/Validation
local ValidationManager = require("luaui.validation.ValidationManager").get_instance()
footer:invalidateComponent(InvalidationFlags.ALL)
print("Component invalidated. Validation pending: " .. tostring(ValidationManager.isPending))

-- 5. Test Color util
local c = Color.fromComponents(255, 0, 0, 255)
print("Color red (ARGB): " .. string.format("0x%x", c))

print("-----------------------")
print("Verification Complete")
