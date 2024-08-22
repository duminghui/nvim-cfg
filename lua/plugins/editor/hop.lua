---@type LazySpec
return {
  { "folke/flash.nvim", enabled = false },
  {
    "smoka7/hop.nvim",
    version = "*",
    vscode = true,
    opts = {
      -- https://github.com/smoka7/hop.nvim/pull/72
      hl_mode = "replace", -- combine, replace
      multi_windows = false,
    },
    keys = {
      { "<leader><leader>a", "<cmd>HopAnywhere<CR>", desc = "HopAnywhere" },
      { "<leader><leader>s", "<cmd>HopChar1<CR>", desc = "HopChar1" },
      { "<leader><leader>t", "<cmd>HopChar2<CR>", desc = "HopChar2" },
      { "<leader><leader>w", "<cmd>HopWord<CR>", desc = "HopWord" },
      { "<leader><leader>l", "<cmd>HopLineStart<CR>", desc = "HopLineStart" },
      { "<leader><leader>L", "<cmd>HopLine<CR>", desc = "HopLine" },
      { "<leader><leader>p", "<cmd>HopPattern<CR>", desc = "HopPattern" },
      { "<leader><leader>v", "<cmd>HopVertical<CR>", desc = "HopVertical" },
    },
  },
}
