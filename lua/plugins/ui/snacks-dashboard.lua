local icons = xxx.icons

local M = {}

M.opts = {
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
  "folke/snacks.nvim",
  opts = M.opts,
}
