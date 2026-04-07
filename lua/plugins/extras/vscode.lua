-- local vscode = vim.g.vscode == 1
-- -- vscode = true
--
-- ---@type LazySpec
-- return {
--
--   -- 不加snacks.nvim会报错
--   { "folke/snacks.nvim", vscode = true },
--   { "smoka7/hop.nvim", vscode = true },
--
--   { "monaqa/dial.nvim", cond = vscode and true },
--   { "ggandor/flit.nvim", cond = vscode and false },
--   { "ggandor/leap.nvim", cond = vscode and false },
--   { "echasnovski/mini.ai", cond = true },
--   { "echasnovski/mini.comment", enabled = false },
--   { "echasnovski/mini.move", cond = vscode and false },
--   { "echasnovski/mini.pairs", cond = not vscode },
--   { "echasnovski/mini.surround", cond = true },
--   { "nvim-treesitter/nvim-treesitter", cond = not vscode },
--   { "nvim-treesitter/nvim-treesitter-textobjects", cond = not vscode },
--   { "JoosepAlviste/nvim-ts-context-commentstring", enabled = false },
--   { "folke/ts-comments.nvim", cond = not vscode },
--   { "tpope/vim-repeat", enabled = false },
--   { "gbprod/yanky.nvim", enabled = false },
-- }

if not vim.g.vscode then
  return {}
end

local enabled = {
  "LazyVim",
  "lazy.nvim",
  "snacks.nvim", -- 不加这个会报错
  -- "dial.nvim",
  "mini.ai",
  "mini.surround",
  "hop.nvim",
}

local Config = require("lazy.core.config")
Config.options.checker.enabled = false
Config.options.change_detection.enabled = false
Config.options.defaults.cond = function(plugin)
  return vim.tbl_contains(enabled, plugin.name) or plugin.vscode
end

local opt = vim.opt

-- fix vscode auto-open the Output messages view
opt.cmdheight = 66

opt.shortmess = {
  l = false, -- use "999L, 888B" instead of "999 lines, 888 bytes"
  m = false, -- use "[+]" instead of "[Modified]"
  r = false, -- use "[RO]" instead of "[readonly]"
  w = false, -- use "[w]" instead of "written" for file write message and "[a]" instead of "appended" for ':w >> file' command
  a = true, -- all of the above abbreviations
  o = true, -- overwrite message for writing a file with subsequent message for reading a file (useful for ":wn" or when 'autowrite' on)
  O = true, -- message for reading a file overwrites any previous message;  also for quickfix message (e.g., ":cn")
  s = true, -- don't give "search hit BOTTOM, continuing at TOP" or "search hit TOP, continuing at BOTTOM" messages; when using the search count do not show "W" after the count message (see S below)
  t = true, -- truncate file message at the start if it is too long to fit on the command-line, "<" will appear in the left most column; ignored in Ex mode T = true, --  truncate other messages in the middle if they are too long to fit on the command line; "..." will appear in the middle; ignored in Ex mode
  W = true, -- don't give "written" or "[w]" when writing a file
  A = true, -- don't give the "ATTENTION" message when an existing swap file is found
  I = true, -- don't give the intro message when starting Vim,:intro
  c = true, -- don't give |ins-completion-menu| messages; for example, "-- XXX completion (YYY)", "match 1 of 2", "The only match", "Pattern not found", "Back at original", etc.
  C = true, -- don't give messages while scanning for ins-completion items, for instance "scanning tags"
  q = false, -- use "recording" instead of "recording @a"
  F = true, -- don't give the file info when editing a file, like `:silent` was used for the command
  S = true, -- do not show search count message when searching, e.g.'[1/5]',
}

-- local create_autocmd = vim.api.nvim_create_autocmd
--
-- local function augroup(name)
--   return vim.api.nvim_create_augroup("lazyvim_" .. name, { clear = true })
-- end

-- create_autocmd({ "BufRead", "BufWinEnter", "BufNewFile" }, {
--   group = augroup("nospell"),
--   once = true,
--   callback = function()
--     vim.opt_local.spell = false
--     -- vim.cmd("set nospell")
--   end,
-- })

-- create_autocmd({ "BufRead", "BufWinEnter", "BufNewFile" }, {
--   group = augroup("relativenumber"),
--   callback = function()
--     local current_time = os.date("%Y-%m-%d %H:%M:%S")
--     print("当前时间:", current_time)
--     vim.opt.relativenumber = true
--     -- vim.cmd("set nospell")
--   end,
-- })

return {}
