local M = {}

-- Turns #rrggbb -> { red, green, blue }
local function rgb_str2num(rgb_color_str)
  if rgb_color_str:find("#") == 1 then
    rgb_color_str = rgb_color_str:sub(2, #rgb_color_str)
  end
  local red = tonumber(rgb_color_str:sub(1, 2), 16)
  local green = tonumber(rgb_color_str:sub(3, 4), 16)
  local blue = tonumber(rgb_color_str:sub(5, 6), 16)
  return { red = red, green = green, blue = blue }
end

-- Turns { red, green, blue } -> #rrggbb
local function rgb_num2str(rgb_color_num)
  local rgb_color_str = string.format("#%02x%02x%02x", rgb_color_num.red, rgb_color_num.green, rgb_color_num.blue)
  return rgb_color_str
end

local function compositeAlpha(fgAlpha, bgAlpha)
  return 0xFF - (((0xFF - bgAlpha) * (0xFF - fgAlpha)) / 0xFF)
end

local function compositeComponent(fgC, fgA, bgC, bgA, a)
  if a == 0 then
    return 0
  end
  return ((0xFF * fgC * fgA) + (bgC * bgA * (0xFF - fgA))) / (a * 0xFF)
end

-- https://en.wikipedia.org/wiki/Alpha_compositing
-- https://cs.android.com/androidx/platform/frameworks/support/+/androidx-main:core/core/src/main/java/androidx/core/graphics/ColorUtils.java
function M.compositeColors(fg_alpha, fg, bg)
  local fg_color = rgb_str2num(fg)
  local bg_color = rgb_str2num(bg)
  local bg_alpha = 255

  local a = compositeAlpha(fg_alpha, bg_alpha)
  local r = compositeComponent(fg_color.red, fg_alpha, bg_color.red, bg_alpha, a)
  local g = compositeComponent(fg_color.green, fg_alpha, bg_color.green, bg_alpha, a)
  local b = compositeComponent(fg_color.blue, fg_alpha, bg_color.blue, bg_alpha, a)
  return rgb_num2str({ red = r, green = g, blue = b })
end

local universal = {
  yellow = "#b58900",
  orange = "#cb4b16",
  red = "#dc322f",
  magenta = "#d33682",
  violet = "#dc71c4",
  blue = "#268bd2",
  cyan = "#2aa198",
  green = "#859900",
  purple = "#800080",
  darkgold = "#ccac00",
  bg = "#002b36",
  bufferline = {
    text = "#657b83",
    text_selected = "#93a1a1",
    tag_fg = "#073642",
    tag_bg = "#002b36",
    modified = "#ccac00",
    pick = "#d33682",
  },
}

function M.set_universal(universal_colors)
  universal_colors = universal_colors or {}
  universal = vim.tbl_deep_extend("force", universal, universal_colors)
end

function M.universal()
  return universal
end

local rainbow = {
  c1 = "#FFD700",
  c2 = "#DA70D6",
  c3 = "#87CEFA",
  c4 = "#FFDB2A",
  -- c4 = "#FFA500",
  -- c4 = "#FFBD2A",
  -- c5 = '#EE82EE',
  c5 = "#F06292",
  c6 = "#359FF4",
  -- c6 = "#6495ED",
  c7 = "#2aa198",
  c8 = "#859900",
}

function M.gen_rainbow_highlight()
  local tbl = require("xxx.core.table")

  local rb_colors = rainbow

  local bg = "#002b36" -- universal.bg

  for i = 1, tbl.len(rb_colors) do
    local c_key = string.format("c%s", i)
    local color_org = rb_colors[c_key]
    local color = M.compositeColors(0x4D, color_org, bg)
    vim.cmd(string.format("highlight IndentBlanklineIndent%s guifg=%s gui=nocombine", i, color))
    vim.cmd(string.format("highlight IndentBlanklineScopeChar%s guifg=%s gui=nocombine", i, color_org))
    vim.cmd(string.format("highlight SnacksIndent%s guifg=%s", i, color))
    vim.cmd(string.format("highlight SnacksIndentScope%s guifg=%s", i, color_org))
    vim.cmd(string.format("highlight RainbowDelimiter%s guifg=%s gui=nocombine", i, color_org))
    -- vim.schedule(function()
    -- vim.notify(string.format('%s %s %s', i, color_org, color))
    -- end)
  end

  -- vim.cmd([[highlight IndentBlanklineContextChar guifg=#FFD700 gui=nocombine]])

  -- 要在listchars中添加 space:⋅, space相关的才会显示出来
  -- vim.cmd [[highlight IndentBlanklineSpaceChar guifg=#FFA500 gui=nocombine]]
  -- vim.cmd [[highlight IndentBlanklineContextSpaceChar guifg=#E3170D gui=nocombine ]]
end

return M
