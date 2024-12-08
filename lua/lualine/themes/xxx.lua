-- local fg = '#657b83' --base00
-- local fg = '#282c34'
-- local fg = '#eee8d5' --base2
-- local fg = '#fdf6e3' --base3
-- local fg = "#002b36" -- base03
-- local bg = nil
-- local mode_n_bg = "#d33687" -- magenta
-- local mode_i_bg = "#859900" -- green
-- local mode_r_bg = "#cb4b16" -- orange
-- local mode_v_bg = "#b58900" -- yellow

local colorbuddy = require("colorbuddy")
local colors = colorbuddy.colors
local a_fg = colors.base03:to_vim()
local o_fg = colors.base00:to_vim()
local bg = nil
local mode_n_bg = colors.magenta:to_vim()
local mode_i_bg = colors.green:to_vim()
local mode_r_bg = colors.orange:to_vim()
local mode_v_bg = colors.yellow:to_vim()

return {
  normal = {
    a = { fg = a_fg, bg = mode_n_bg, gui = "bold" },
    b = { fg = o_fg, bg = bg },
    c = { fg = o_fg, bg = bg },
  },
  insert = {
    a = { fg = a_fg, bg = mode_i_bg, gui = "bold" },
  },
  visual = {
    a = { fg = a_fg, bg = mode_v_bg, gui = "bold" },
  },
  replace = {
    a = { fg = a_fg, bg = mode_r_bg, gui = "bold" },
  },
  command = {
    a = { fg = a_fg, bg = mode_i_bg, gui = "bold" },
  },
  -- inactive = {
  --     a = { bg = "darkgray", fg = gray, gui = 'bold' },
  --     b = { bg = "darkgray", fg = gray },
  --     c = { bg = "darkgray", fg = gray }
  -- }
}
