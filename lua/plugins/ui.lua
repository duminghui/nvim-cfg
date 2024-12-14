---@type LazySpec
return {
  -- {
  --   "rcarriga/nvim-notify",
  --   opts = {
  --     background_colour = "NotifyBackground",
  --     icons = {
  --       DEBUG = icons.diagnostic.Debug .. " ",
  --       ERROR = icons.diagnostic.Error .. " ",
  --       INFO = icons.diagnostic.Information .. " ",
  --       TRACE = icons.diagnostic.Trace .. " ",
  --       WARN = icons.diagnostic.Warning .. " ",
  --     },
  --     render = "wrapped-compact",
  --     timeout = 6000,
  --   },
  -- },
  { import = "plugins.ui.bufferline" },
  { import = "plugins.ui.lualine" },
  -- { import = "plugins.ui.indent-blankline" },
  { import = "plugins.ui.noice" },

  { import = "plugins.ui.mini-icons" },

  { import = "plugins.ui.snacks" },

  {
    "nvim-treesitter/nvim-treesitter-context",
    --- require('treesitter-context')
    ---@type TSContext.UserConfig
    opts = {
      mode = "topline", -- cursor, topline
    },
  },

  {
    "HiPhish/rainbow-delimiters.nvim",
    event = "LazyFile",
    submodules = false,
    config = function()
      local opts = {
        highlight = {
          "RainbowDelimiter1",
          "RainbowDelimiter2",
          "RainbowDelimiter3",
          "RainbowDelimiter4",
          "RainbowDelimiter5",
          "RainbowDelimiter6",
          "RainbowDelimiter7",
          "RainbowDelimiter8",
        },
      }
      require("rainbow-delimiters.setup").setup(opts)
    end,
  },

  { import = "plugins.ui.tmux" },

  { import = "plugins.ui.fidget" },
}
