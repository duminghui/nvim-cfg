local M = {}

local popup = require("xxx.interface.popup")
local text = require("xxx.interface.text")

M.rtp_popup = function()
  local content_provider = function(popup_layout)
    local content = {}
    ---@diagnostic disable-next-line: param-type-mismatch
    for k, v in pairs(vim.opt.rtp:get()) do
      local path = string.format("%3d: %s", k, v)
      table.insert(content, path)
    end
    return text.align_left(popup_layout, content, 0.0)
  end
  local Popup = popup:new({
    buf_opts = { filetype = "RuntimePath" },
  })
  Popup:display(content_provider)
end

local function split(str, delimiter)
  local result = {}
  local start = 1
  local found = string.find(str, delimiter)

  while found ~= nil do
    table.insert(result, string.sub(str, start, found - 1))
    start = found + #delimiter
    found = string.find(str, delimiter, start)
  end

  table.insert(result, string.sub(str, start))

  return result
end

M.clients_config_popup = function()
  local content_provider = function()
    local active_clients = vim.lsp.get_clients()
    local content = {}
    for _, client in ipairs(active_clients) do
      table.insert(content, "------- " .. client.name .. " ------- >>>")
      for _, line in ipairs(split(vim.inspect(client.config), "\n")) do
        table.insert(content, line)
      end
      table.insert(content, "------- " .. client.name .. " ------- <<<")
    end
    return content
  end
  local Popup = popup:new({
    win_opts = {
      number = true,
      relativenumber = true,
    },
    buf_opts = { filetype = "lua" },
  })
  Popup:display(content_provider)
end
return M
