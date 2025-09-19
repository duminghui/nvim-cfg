-- local util = require("lspconfig.util")
return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        taplo = {
          root_markers = { ".git", ".taplo.toml", "taplo.toml" },
          -- Fix 'this document has been excluded' (show this when toml file not in a git repo)
          -- root_dir = function(bufnr, on_dir)
          -- local git_ancestor = vim.fs.dirname(vim.fs.find(".git", { path = fname, upward = true })[1])
          -- return util.root_pattern("*.toml")(fname) or git_ancestor
          -- end
          root_dir = function(bufnr, on_dir)
            local server = "taplo"
            local markers = vim.lsp.config[server].root_markers
            -- vim.print(markers)
            local root = vim.fs.root(bufnr, function(name)
              -- vim.print(name)
              return name:match("%.toml$") ~= nil
            end)

            root = root or vim.fs.root(bufnr, markers)

            return root and on_dir(root)
          end,
        },
      },
    },
  },
}
