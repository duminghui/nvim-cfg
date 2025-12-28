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
