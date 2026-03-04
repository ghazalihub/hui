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
        filesystem = { getDirectoryItems = function() return {} end, getInfo = function() return {type="file"} end }
    }
end

-- Test script
local ActionType = require("luaui.actions.ActionType")
local AnimationSequence = require("luaui.animation.AnimationSequence")
local Component = require("luaui.core.Component")
local HBox = require("luaui.containers.HBox")
local WindowFooter = require("luaui.containers.windows.WindowFooter")
local MouseEvent = require("luaui.events.MouseEvent")

print("LuaUI Port Verification")
print("-----------------------")

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

-- 3. Test Event Dispatching
local clicked = false
footer:registerEvent(MouseEvent.CLICK, function(e)
    print("WindowFooter clicked! Event type: " .. e.type)
    clicked = true
end)

local event = MouseEvent.new(MouseEvent.CLICK)
footer:dispatch(event)

if clicked then
    print("Event dispatching working correctly.")
else
    print("FAILED: Event dispatching failed.")
end

-- 4. Test Invalidation/Validation
local ValidationManager = require("luaui.validation.ValidationManager").get_instance()
footer:invalidateComponent()
print("Component invalidated. Validation pending: " .. tostring(ValidationManager.isPending))

-- 5. Test AnimationSequence structure
local seq = AnimationSequence.new()
print("AnimationSequence created. Builders: " .. #seq.builders)

print("-----------------------")
print("Verification Complete")
