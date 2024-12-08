local icons = xxx.icons

-- LazyVim/lua/lazyvim/plugins/init.lua

---@type LazySpec
return {
  {
    "LazyVim/LazyVim",
    ---@class LazyVimOptions
    opts = {
      colorscheme = "neosolarized",
      -- colorscheme = function()
      -- end,
      icons = {
        misc = {
          dot = icons.ui.Ellipsis,
        },
        ft = {
          octo = icons.misc.Github,
        },
        dap = {
          Stopped = { "󰁕 ", "DiagnosticWarn", "DapStoppedLine" },
          Breakpoint = "󰀚 ",
          BreakpointCondition = "󰋗 ",
          BreakpointRejected = { "󰋼 ", "DiagnosticError" },
          LogPoint = ".>",
        },
        diagnostics = {
          Error = icons.diagnostic.Error .. " ",
          Warn = icons.diagnostic.Warning .. " ",
          Hint = icons.diagnostic.Hint .. " ",
          Info = icons.diagnostic.Information .. " ",
        },
        git = {
          added = icons.git.BoldLineAdd .. " ",
          modified = icons.git.BoldLineModified .. " ",
          removed = icons.git.BoldLineRemove .. " ", -- 󰛲
        },
        kinds = icons.kinds("  "),
      },
    },
  },
  {
    "folke/snacks.nvim",
    ---@type snacks.Config
    opts = {
      ---@type table<string, snacks.win.Config>
      styles = {
        notification = {
          wo = {
            winblend = 0,
          },
        },
      },
      ---@type snacks.notifier.Config | { enabled: boolean }
      notifier = {
        timeout = 6000, -- default timeout in ms
        icons = {
          error = icons.diagnostic.Error .. " ",
          warn = icons.diagnostic.Warning .. " ",
          info = icons.diagnostic.Information .. " ",
          debug = icons.diagnostic.Debug .. " ",
          trace = " ",
        },
        ---@type snacks.notifier.style
        style = "compact",
      },
      ---@type snacks.toggle.Config
      toggle = {
        icon = {
          enabled = "󰔡 ",
          disabled = "󰨙 ",
        },
      },
    },
  },
}
