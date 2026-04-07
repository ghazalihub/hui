local Color = {}
function Color.fromComponents(r, g, b, a)
    a = a or 255
    return (a * 16777216) + (r * 65536) + (g * 256) + b
end
function Color.get_r(c) return math.floor(c / 65536) % 256 end
function Color.get_g(c) return math.floor(c / 256) % 256 end
function Color.get_b(c) return c % 256 end
function Color.get_a(c) return math.floor(c / 16777216) % 256 end
return Color
