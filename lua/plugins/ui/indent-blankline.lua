local icons = xxx.icons

local M = {}

---@type ibl.config
M.opts = {
  indent = {
    char = icons.ui.LineLeft,
    highlight = {
      "IndentBlanklineIndent1",
      "IndentBlanklineIndent2",
      "IndentBlanklineIndent3",
      "IndentBlanklineIndent4",
      "IndentBlanklineIndent5",
      "IndentBlanklineIndent6",
      "IndentBlanklineIndent7",
    },
    -- priority = 1,
  },
  scope = {
    show_start = false,
    show_end = false,
    show_exact_scope = true,
    highlight = {
      "IndentBlanklineScopeChar1",
      "IndentBlanklineScopeChar2",
      "IndentBlanklineScopeChar3",
      "IndentBlanklineScopeChar4",
      "IndentBlanklineScopeChar5",
      "IndentBlanklineScopeChar6",
      "IndentBlanklineScopeChar7",
    },
    -- priority = 1,
  },
  exclude = {
    filetypes = require("xxx.core.exclude-filetype").indent_blankline,
    buftypes = {
      "terminal",
      "nofile",
      "quickfix",
      "prompt",
    },
  },
}

---@param opts ibl.config
M.config = function(_, opts)
  -- vim.opt.list = true
  -- vim.opt.listchars:append "space:⋅"
  -- vim.opt.listchars:append "eol:↴"
  -- vim.print(M.opts)

  -- vim.g.rainbow_delimiters = { highlight = opts.scope.highlight }

  local hooks = require("ibl.hooks")
  hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
    local colors = require("xxx.core.colors")
    colors.gen_rainbow_highlight()
  end)

  local indent_blankline = require("ibl")

  indent_blankline.setup(opts)
  hooks.register(hooks.type.SCOPE_HIGHLIGHT, hooks.builtin.scope_highlight_from_extmark)
end

return {
  "lukas-reineke/indent-blankline.nvim",
  opts = M.opts,
  config = M.config,
  event = function()
    return { "User FileOpened" }
  end,
}
