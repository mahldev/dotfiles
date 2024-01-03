-- https://github.com/emmanueloga/columns/blob/master/utils/color.lua

local m = {}

local hexchars = "0123456789abcdef"

function m.hex_to_rgb(hex)
  hex = string.lower(hex)
  local ret = {}
  for i = 0, 2 do
    local char1 = string.sub(hex, i * 2 + 2, i * 2 + 2)
    local char2 = string.sub(hex, i * 2 + 3, i * 2 + 3)
    local digit1 = string.find(hexchars, char1) - 1
    local digit2 = string.find(hexchars, char2) - 1
    ret[i + 1] = (digit1 * 16 + digit2) / 255.0
  end
  return ret
end

--[[
 * converts an rgb color value to hsl. conversion formula
 * adapted from http://en.wikipedia.org/wiki/hsl_color_space.
 * assumes r, g, and b are contained in the set [0, 255] and
 * returns h, s, and l in the set [0, 1].
 *
 * @param   number  r       the red color value
 * @param   number  g       the green color value
 * @param   number  b       the blue color value
 * @return  array           the hsl representation
]]
function m.rgbtohsl(r, g, b)
  local max, min = math.max(r, g, b), math.min(r, g, b)
  local h = 0
  local s = 0
  local l = 0

  l = (max + min) / 2

  if max == min then
    h, s = 0, 0 -- achromatic
  else
    local d = max - min
    if l > 0.5 then
      s = d / (2 - max - min)
    else
      s = d / (max + min)
    end
    if max == r then
      h = (g - b) / d
      if g < b then
        h = h + 6
      end
    elseif max == g then
      h = (b - r) / d + 2
    elseif max == b then
      h = (r - g) / d + 4
    end
    h = h / 6
  end

  return h * 360, s * 100, l * 100
end

--[[
 * converts an hsl color value to rgb. conversion formula
 * adapted from http://en.wikipedia.org/wiki/hsl_color_space.
 * assumes h, s, and l are contained in the set [0, 1] and
 * returns r, g, and b in the set [0, 255].
 *
 * @param   number  h       the hue
 * @param   number  s       the saturation
 * @param   number  l       the lightness
 * @return  array           the rgb representation
]]
function m.hsltorgb(h, s, l)
  local r, g, b

  if s == 0 then
    r, g, b = l, l, l -- achromatic
  else
    function hue2rgb(p, q, t)
      if t < 0 then
        t = t + 1
      end
      if t > 1 then
        t = t - 1
      end
      if t < 1 / 6 then
        return p + (q - p) * 6 * t
      end
      if t < 1 / 2 then
        return q
      end
      if t < 2 / 3 then
        return p + (q - p) * (2 / 3 - t) * 6
      end
      return p
    end

    local q
    if l < 0.5 then
      q = l * (1 + s)
    else
      q = l + s - l * s
    end
    local p = 2 * l - q

    r = hue2rgb(p, q, h + 1 / 3)
    g = hue2rgb(p, q, h)
    b = hue2rgb(p, q, h - 1 / 3)
  end

  return r * 255, g * 255, b * 255
end

function m.hextohsl(hex)
  local hsluv = require("solarized-osaka.hsluv")
  local rgb = m.hex_to_rgb(hex)
  local h, s, l = m.rgbtohsl(rgb[1], rgb[2], rgb[3])

  return string.format("hsl(%d, %d, %d)", math.floor(h + 0.5), math.floor(s + 0.5), math.floor(l + 0.5))
end

--[[
 * converts an hsl color value to rgb in hex representation.
 * @param   number  h       the hue
 * @param   number  s       the saturation
 * @param   number  l       the lightness
 * @return  string           the hex representation
]]
function m.hsltohex(h, s, l)
  local r, g, b = m.hsltorgb(h / 360, s / 100, l / 100)

  return string.format("#%02x%02x%02x", r, g, b)
end

function m.replacehexwithhsl()
  -- get the current line number
  local line_number = vim.api.nvim_win_get_cursor(0)[1]

  -- get the line content
  local line_content = vim.api.nvim_buf_get_lines(0, line_number - 1, line_number, false)[1]

  -- find hex code patterns and replace them
  for hex in line_content:gmatch("#[0-9a-fa-f]+") do
    local hsl = m.hextohsl(hex)
    line_content = line_content:gsub(hex, hsl)
  end

  -- set the line content back
  vim.api.nvim_buf_set_lines(0, line_number - 1, line_number, false, { line_content })
end

return m
