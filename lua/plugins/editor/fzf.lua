return {
  "ibhagwan/fzf-lua",
  opts = function(_, opts)
    -- vim.print("fzf-lua opts(my)")
    local new_opts = {
      winopts = {
        border = "single",
        preview = {
          -- scrollchars = { "┃", "" },
          -- scrollbar = "float",
          -- winopts = {},
        },
      },
      fzf_opts = {
        -- ["--layout"] = "reverse-list",
        ["--layout"] = "default",
      },
      ui_select = function(fzf_opts, items)
        local new = vim.tbl_deep_extend("force", fzf_opts, {
          prompt = " ❯ ",
          winopts = {
            title = " " .. vim.trim((fzf_opts.prompt or "Select"):gsub("%s*:%s*$", "")) .. " ",
            title_pos = "center",
          },
        }, fzf_opts.kind == "codeaction" and {
          winopts = {
            layout = "vertical",
            -- height is number of items minus 15 lines for the preview, with a max of 80% screen height
            height = math.floor(math.min(vim.o.lines * 0.8 - 16, #items + 2) + 0.5) + 16,
            width = 0.5,
            preview = not vim.tbl_isempty(LazyVim.lsp.get_clients({ bufnr = 0, name = "vtsls" })) and {
              layout = "vertical",
              vertical = "down:15,border-top",
              hidden = "hidden",
            } or {
              layout = "vertical",
              vertical = "down:15,border-top",
            },
          },
        } or {
          winopts = {
            width = 0.5,
            -- height is number of items, with a max of 80% screen height
            height = math.floor(math.min(vim.o.lines * 0.8, math.max(#items, 7)) + 0.5),
          },
        })
        fzf_opts.prompt = " ❯ "
        return new
      end,
    }
    return vim.tbl_deep_extend("force", opts, new_opts)
  end,
  config = function(_, opts)
    if opts[1] == "default-title" then
      -- use the same prompt for all pickers for profile `default-title` and
      -- profiles that use `default-title` as base profile
      local function fix(t)
        -- t.prompt = t.prompt ~= nil and " ❯ " or nil
        t.prompt = t.prompt ~= nil and " ❯ " or " ❯ "
        for _, v in pairs(t) do
          if type(v) == "table" then
            fix(v)
          end
        end
        return t
      end
      opts = vim.tbl_deep_extend("force", fix(require("fzf-lua.profiles.default-title")), opts)
      opts[1] = nil
    end
    require("fzf-lua").setup(opts)
  end,
}
