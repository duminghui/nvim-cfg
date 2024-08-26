-- ## Usage
-- ## Options
--
-- *clients*
-- clients = { copilot = { symbol = icons.git.Octoface, color = { fg = "#6CC644", bg = com_bg } } }

local default_options = {
  icons = {
    active = "",
    inactive = "󰊱",
  },
  clients = {},
}

local M = require("lualine.component"):extend()
local icons = xxx.icons

function M:init(options)
  M.super.init(self, options)
  self.options = vim.tbl_deep_extend("keep", self.options or {}, default_options)
  self.highlights = {}
  for key, client in pairs(self.options.clients) do
    self.highlights[key] = self:create_hl(client.color, "lsp_client_" .. key)
  end
end

function M:update_status()
  local active_clients = require("xxx.lsp.active-clients")
  local client_names, copilot_active = active_clients.list_client_names()

  local language_servers = table.concat(client_names, icons.ui.SquareSmall)

  if copilot_active then
    local copilot = self.options.clients.copilot
    language_servers = language_servers .. self:format_hl(self.highlights["copilot"]) .. " " .. copilot.symbol -- .. "%*"
  end
  local icon = #language_servers > 0 and self.options.icons.active or self.options.icons.inactive
  return icon .. " " .. language_servers
end

return M
