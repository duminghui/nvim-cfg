local icons = xxx.icons
---@type LazySpec
return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      diagnostics = {
        virtual_text = {
          prefix = "■",
        },
      },
    },
  },
  -- {
  --   "neovim/nvim-lspconfig",
  --   opts = function()
  --     local keys = require("lazyvim.plugins.lsp.keymaps").get()
  --     -- stylua: ignore
  --     keys[#keys + 1] = { "gd", "<CMD>Trouble lsp_definitions<CR>", desc = "Goto Definition (Trouble)", has = "definition" }
  --     keys[#keys + 1] = { "gr", "<CMD>Trouble lsp_references<CR>", desc = "References (Trouble)", nowait = true }
  --     keys[#keys + 1] = { "gI", "<CMD>Trouble lsp_implementations<CR>", desc = "Goto Implementation (Trouble)" }
  --     keys[#keys + 1] = { "gy", "<CMD>Trouble lsp_type_definitions<CR>", desc = "Goto T[y]pe Definition (Trouble)" }
  --     keys[#keys + 1] = { "gD", "<CMD>Trouble lsp_declarations<CR>", desc = "Goto Declaration (Trouble)" }
  --   end,
  -- },
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        ["*"] = {
          keys = {
            { "gd", "<CMD>Trouble lsp_definitions<CR>", desc = "Goto Definition (Trouble)", has = "definition" },
            { "gr", "<CMD>Trouble lsp_references<CR>", desc = "References (Trouble)", nowait = true },
            { "gI", "<CMD>Trouble lsp_implementations<CR>", desc = "Goto Implementation (Trouble)" },
            { "gy", "<CMD>Trouble lsp_type_definitions<CR>", desc = "Goto T[y]pe Definition (Trouble)" },
            { "gD", "<CMD>Trouble lsp_declarations<CR>", desc = "Goto Declaration (Trouble)" },
          },
        },
      },
    },
  },
  {
    "mason-org/mason.nvim",
    opts = {
      ui = {
        icons = {
          package_installed = icons.ui.CheckboxMarkedCircle,
          package_pending = icons.ui.Pending,
          package_uninstalled = icons.ui.Plus2, -- 󰙝
        },
      },
    },
  },
}
