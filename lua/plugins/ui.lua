local icons = xxx.icons
---@type LazySpec
return {
  {
    "rcarriga/nvim-notify",
    opts = {
      background_colour = "NotifyBackground",
      icons = {
        DEBUG = icons.diagnostic.Debug .. " ",
        ERROR = icons.diagnostic.Error .. " ",
        INFO = icons.diagnostic.Information .. " ",
        TRACE = icons.diagnostic.Trace .. " ",
        WARN = icons.diagnostic.Warning .. " ",
      },
      render = "wrapped-compact",
      timeout = 6000,
    },
  },
  { import = "plugins.ui.bufferline" },
  { import = "plugins.ui.lualine" },
  { import = "plugins.ui.indent-blankline" },
  { import = "plugins.ui.noice" },

  { import = "plugins.ui.mini-icons" },

  {
    "nvimdev/dashboard-nvim",
    opts = function(_, opts)
      local icon_patchs = {
        [""] = icons.ui.Search,
        [""] = icons.ui.File,
        [""] = icons.ui.Files,
        [""] = icons.ui.Text,
        [""] = icons.ui.Gear,
        [""] = icons.ui.Restore,
        [""] = icons.misc.Package,
        [""] = icons.ui.SinOut,
        [""] = icons.ui.Gear,
      }
      local config = opts.config
      for _, entity in ipairs(config.center) do
        local icon = vim.trim(entity.icon)
        local icon_patch = icon_patchs[icon]
        if icon_patch then
          entity.icon = string.format("%s ", icon_patch)
        end
      end

      local footer = config.footer
      if type(footer) == "function" then
        footer = footer()
        for idx, entity in ipairs(footer) do
          footer[idx] = string.gsub(entity, "⚡", icons.kind.Event .. " ")
        end
      end
      config.footer = footer
    end,
  },

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
    dependencies = { "lukas-reineke/indent-blankline.nvim" },
    event = { "User FileOpened" },
    submodules = false,
    config = function()
      local highlight = LazyVim.get_plugin("indent-blankline.nvim").opts.scope.highlight
      local opts = {
        highlight = highlight,
      }
      require("rainbow-delimiters.setup").setup(opts)
    end,
    priority = 49,
  },

  { import = "plugins.ui.tmux" },

  { import = "plugins.ui.fidget" },
}
