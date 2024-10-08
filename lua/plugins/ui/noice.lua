local icons = xxx.icons

local M = {}

--- require("noice")
---@type NoiceConfig
M.opts = {
  ---@type NoiceConfigViews
  views = {
    ---@type NoiceViewOptions
    notify = {},
    split = {},
    vsplit = {},
    popup = {},
    mini = {
      ---@type NoiceAlign
      align = "message-right",
      -- reverse = true,
      position = {
        row = -1,
        col = 1,
      },
      win_options = {
        winblend = 0,
      },
    },
    cmdline = {
      -- win_options = {
      --   winblend = 0,
      -- },
    },
    cmdline_popup = {
      -- this is below at cmdline
    },
    cmdline_output = {},
    messages = {},
    confirm = {},
    hover = {},
    popupmenu = {
      win_options = {
        -- winblend = 0,
        winhighlight = {
          -- fix background black
          NormalFloat = "NoicePopupmenu",
          CursorLine = "CursorLine",
        },
      },
    },
  },
  cmdline = {
    ---@type table<string, CmdlineFormat>
    format = {
      ---@diagnostic disable:missing-fields
      cmdline = { icon = icons.misc.Shell },
      search_down = { icon = " " .. icons.ui.Search .. " " .. icons.ui.ChevronDownTriple },
      search_up = { icon = " " .. icons.ui.Search .. " " .. icons.ui.ChevronUpTriple },
      filter = { icon = icons.misc.Bash },
      lua = { icon = icons.misc.Lua },
      help = { icon = icons.ui.Question },
      input = { icon = icons.misc.KeyboardVariant },
    },
  },
  messages = {
    -- NOTE: If you enable messages, then the cmdline is enabled automatically.
    -- This is a current Neovim limitation.
    enabled = true, -- enables the Noice messages UI
  },
  popupmenu = {
    ---@type 'nui'|'cmp'
    backend = "nui",
    -- backend = "cmp",
  },
  lsp = {
    progress = {
      enabled = false,
    },
  },
}

return {
  "folke/noice.nvim",
  opts = M.opts,
}
