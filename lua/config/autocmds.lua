-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua

-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")

local function augroup(name)
  return vim.api.nvim_create_augroup("lazyvim_" .. name, { clear = true })
end

local create_autocmd = vim.api.nvim_create_autocmd

create_autocmd({ "BufRead", "BufWinEnter", "BufNewFile" }, {
  group = augroup("user_file_opened"),
  once = true,
  callback = function(args)
    local buftype = vim.api.nvim_get_option_value("buftype", { buf = args.buf })
    if not (vim.fn.expand("%") == "" or buftype == "nofile") then
      vim.cmd("do User FileOpened")
    end
  end,
})

---- below don't use in vscode
if vim.g.vscode then
  -- 删除自动添加拼写的功能, 这个功能会在文本下面加波浪线
  -- https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua#L97
  vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")
  return
end

create_autocmd("TextYankPost", {
  group = augroup("highlight_yank"),
  pattern = "*",
  desc = "Highlight text on yank",
  callback = function()
    -- require("vim.highlight").on_yank({ higroup = "Search", timeout = 150 })
    require("vim.hl").on_yank({ higroup = "Search", timeout = 150 })
  end,
})
