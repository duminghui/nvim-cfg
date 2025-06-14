local util = require("lspconfig.util")
return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        taplo = {
          -- Fix 'this document has been excluded' (show this when toml file not in a git repo)
          root_dir = function(fname)
            local git_ancestor = vim.fs.dirname(vim.fs.find(".git", { path = fname, upward = true })[1])
            return util.root_pattern("*.toml")(fname) or git_ancestor
          end,
        },
      },
    },
  },
}
