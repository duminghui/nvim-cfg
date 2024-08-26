local util = require("lspconfig.util")
return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        taplo = {
          -- Fix 'this document has been excluded' (show this when toml file not in a git repo)
          root_dir = function(fname)
            return util.root_pattern("*.toml")(fname) or util.find_git_ancestor(fname)
          end,
        },
      },
    },
  },
}
