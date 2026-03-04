--[[
    Style.
    Faithful port of haxe_ui.styles.Style.
--]]

local Style = {}
Style.__index = Style

function Style.new()
    local self = setmetatable({}, Style)
    -- Layout
    self.left = nil
    self.top = nil
    self.width = nil
    self.height = nil
    self.percentWidth = nil
    self.percentHeight = nil
    self.autoWidth = nil
    self.autoHeight = nil

    -- Padding
    self.paddingTop = nil
    self.paddingLeft = nil
    self.paddingRight = nil
    self.paddingBottom = nil

    -- Margin
    self.marginTop = nil
    self.marginLeft = nil
    self.marginRight = nil
    self.marginBottom = nil

    -- Spacing
    self.horizontalSpacing = nil
    self.verticalSpacing = nil

    -- Colors
    self.color = nil
    self.backgroundColor = nil
    self.backgroundOpacity = nil
    self.borderColor = nil
    self.borderSize = nil
    self.borderRadius = nil

    -- Text
    self.fontName = nil
    self.fontSize = nil
    self.fontBold = nil
    self.textAlign = nil

    -- Misc
    self.opacity = nil
    self.cursor = nil
    self.hidden = nil
    self.clip = nil
    self.native = nil

    self.customDirectives = nil
    return self
end

function Style:apply(s)
    if not s then return end
    for k, v in pairs(s) do
        if type(v) ~= "function" then
            self[k] = v
        end
    end
end

return Style
