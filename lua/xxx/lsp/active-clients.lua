local M = {}

---@param ft string
---@return table table
M.none_ls_list_registered_providers_names = function(ft)
  local ok, s = pcall(require, "null-ls.sources")
  if not ok then
    return {}
  end
  local available_sources = s.get_available(ft)
  local registered = {}
  for _, source in ipairs(available_sources) do
    for method in pairs(source.methods) do
      registered[method] = registered[method] or {}
      table.insert(registered[method], source.name)
    end
  end
  return registered
end

---@param ft string
---@param method 'code-action'|'formatter' | 'linter'
---@return table
M.none_ls_list_registered = function(ft, method)
  local registered_providers = M.none_ls_list_registered_providers_names(ft)
  local tbl = require("xxx.core.table")
  if tbl.len(registered_providers) == 0 then
    return {}
  end
  local nl_methods = require("null-ls").methods
  local switch = {
    ["code-action"] = {
      nl_methods.CODE_ACTION,
    },
    ["formatter"] = {
      nl_methods.FORMATTING,
    },
    ["linter"] = {
      nl_methods.DIAGNOSTICS,
      nl_methods.DIAGNOSTICS_ON_OPEN,
      nl_methods.DIAGNOSTICS_ON_SAVE,
    },
  }

  local providers_for_methods = vim
    .iter(vim.tbl_map(function(m)
      return registered_providers[m] or {}
    end, switch[method] or {}))
    :flatten()
    :totable()

  return providers_for_methods
end

---@return string[]
M.list_conform_formatters = function()
  local fmts = {}
  if LazyVim.has("conform.nvim") then
    --- @type conform.FormatterInfo[]
    local available_formatters = require("conform").list_formatters()
    for _, formatter in ipairs(available_formatters) do
      local formatter_name = formatter.name
      if not formatter.available then
        formatter_name = string.format("%s(N)", formatter_name)
      end
      table.insert(fmts, formatter_name)
    end
  end
  return fmts
end

---@return string[] client_names client names:
---@return boolean copilot_active copilot active
M.list_client_names = function()
  local buf_clients = vim.lsp.get_clients({ bufnr = 0 })
  local buf_client_names = {}
  local copilot_active = false
  for _, client in pairs(buf_clients) do
    -- print(client.name, client.method)
    if client.name ~= "null-ls" then
      table.insert(buf_client_names, client.name)
    end
    if client.name == "copilot" then
      copilot_active = true
    end
  end

  -- add formatter
  local buf_ft = vim.bo.filetype

  local supported_formatters = M.none_ls_list_registered(buf_ft, "formatter")
  vim.list_extend(buf_client_names, supported_formatters)

  -- add linter
  local supported_linters = M.none_ls_list_registered(buf_ft, "linter")
  vim.list_extend(buf_client_names, supported_linters)

  -- add code action
  local supported_code_actions = M.none_ls_list_registered(buf_ft, "code-action")
  vim.list_extend(buf_client_names, supported_code_actions)

  local formatters = M.list_conform_formatters()
  vim.list_extend(buf_client_names, formatters)

  local unique_client_names = vim.fn.uniq(buf_client_names)

  local client_names = {}
  if type(unique_client_names) == "table" then
    client_names = unique_client_names
  end
  return client_names, copilot_active
end

return M
