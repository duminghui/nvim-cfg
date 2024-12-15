local icons = xxx.icons

local M = {}

---@type snacks.Config
M.opts = {
  ---@type snacks.win.Config|{}
  -- win = {
  --   wo = {
  --     winblend = 0,
  --   },
  --   backdrop = {
  --     bg = "#FFFFFF",
  --     blend = 100,
  --     transparent = false,
  --   },
  -- },
  ---@type table<string, snacks.win.Config>
  -- styles = {
  --   -- notification = {
  --   --   wo = {
  --   --     winblend = 6,
  --   --   },
  --   -- },
  --   -- ["notification.history"] = {
  --   -- wo = {
  --   --   winblend = 0,
  --   -- },
  --   -- backdrop = {
  --   --   transparent = true,
  --   -- },
  --   -- },
  -- },
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
  indent = {
    indent = {
      hl = {
        "SnacksIndent1",
        "SnacksIndent2",
        "SnacksIndent3",
        "SnacksIndent4",
        "SnacksIndent5",
        "SnacksIndent6",
        "SnacksIndent7",
        "SnacksIndent8",
      },
    },
    animate = {
      duration = {
        step = 20,
        total = 200,
      },
    },
    scope = {
      hl = {
        "SnacksIndentScope1",
        "SnacksIndentScope1",
        "SnacksIndentScope2",
        "SnacksIndentScope2",
        "SnacksIndentScope3",
        "SnacksIndentScope3",
        "SnacksIndentScope4",
        "SnacksIndentScope4",
        "SnacksIndentScope5",
        "SnacksIndentScope5",
        "SnacksIndentScope6",
        "SnacksIndentScope6",
        "SnacksIndentScope7",
        "SnacksIndentScope7",
        "SnacksIndentScope8",
        "SnacksIndentScope8",
      },
    },
    chunk = {
      enabled = false,
      hl = {
        "SnacksIndentScope1",
        "SnacksIndentScope2",
        "SnacksIndentScope3",
        "SnacksIndentScope4",
        "SnacksIndentScope5",
        "SnacksIndentScope6",
        "SnacksIndentScope7",
        "SnacksIndentScope8",
      },
    },
  },
  dashboard = {
    preset = {
      -- stylua: ignore
      ---@type snacks.dashboard.Item[]
      keys = {
        { icon = icons.ui.Search  .. " ", key = "f", desc = "Find File", action = ":lua Snacks.dashboard.pick('files')" },
        { icon = icons.ui.FilePlus .. " ", key = "n", desc = "New File", action = ":ene | startinsert" },
        { icon = icons.ui.TextFind .. " ", key = "g", desc = "Find Text", action = ":lua Snacks.dashboard.pick('live_grep')" },
        { icon = icons.ui.ArrangeBringToFront .. " ", key = "r", desc = "Recent Files", action = ":lua Snacks.dashboard.pick('oldfiles')" },
        { icon = icons.ui.Gear .. " ", key = "c", desc = "Config", action = ":lua Snacks.dashboard.pick('files', {cwd = vim.fn.stdpath('config')})" },
        { icon = icons.ui.WindowRestore .. " "  , key = "s", desc = "Sessions", action=":SessionManager load_session" },
        { icon = icons.ui.Restore .. " ", key = "L", desc = "Last Session", action=":SessionManager load_last_session" },
        { icon = icons.ui.Puzzle .. " ", key = "x", desc = "Lazy Extras", action = ":LazyExtras" },
        { icon = "󰒲 ", key ="l", desc = "Lazy", action = ":Lazy" },
        { icon = icons.ui.SignOut .. " ", key = "q", desc = "Quit", action = ":qa" },
      },
    },
    formats = {
      -- icon = function(item)
      --   if item.file and item.icon == "file" or item.icon == "directory" then
      --     require("snacks.dashboard").icon(item.file, item.icon)
      --   end
      --   return { item.icon, width = 2, hl = "icon" }
      -- end,
    },
    sections = {
      { section = "header" },
      { section = "keys", gap = 1, padding = 1 },
      -- { section = "startup" },
      function()
        M.lazy_stats = M.lazy_stats and M.lazy_stats.startuptime > 0 and M.lazy_stats or require("lazy.stats").stats()
        local ms = (math.floor(M.lazy_stats.startuptime * 100 + 0.5) / 100)
        return {
          -- pane = 2,
          align = "center",
          text = {
            { icons.kind.Event .. " Neovim loaded ", hl = "footer" },
            { M.lazy_stats.loaded .. "/" .. M.lazy_stats.count, hl = "special" },
            { " plugins in ", hl = "footer" },
            { ms .. "ms", hl = "special" },
          },
        }
      end,
    },
  },
}

return {
  {
    "folke/snacks.nvim",
    ---@type snacks.Config
    opts = {
      indent = { enabled = true },
      scroll = { enabled = false },
    },
  },
  {
    "folke/snacks.nvim",
    opts = M.opts,
  },
}
