local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  spec = {
    -- add LazyVim and import its plugins
    { "LazyVim/LazyVim", import = "lazyvim.plugins" },
    -- import/override with your plugins
    -- config in lazyvim.json
    -- { import = "lazyvim.plugins.extras.coding.luasnip" },
    { import = "lazyvim.plugins.extras.coding.mini-surround" },
    -- { import = "lazyvim.plugins.extras.coding.nvim-cmp" },
    { import = "lazyvim.plugins.extras.editor.illuminate" },
    -- { import = "lazyvim.plugins.extras.editor.navic" },
    { import = "lazyvim.plugins.extras.lang.json" },
    { import = "lazyvim.plugins.extras.lang.toml" },
    { import = "lazyvim.plugins.extras.lang.yaml" },
    { import = "lazyvim.plugins.extras.ui.treesitter-context" },
    -- { import = "lazyvim.plugins.extras.util.chezmoi" },
    { import = "lazyvim.plugins.extras.util.mini-hipatterns" },
    -- vscode在lazyvim.plugins.xtras中有自动加载
    { import = "lazyvim.plugins.extras.vscode" },
    { import = "plugins" },
    { import = "plugins.extras.vscode" },
  },
  defaults = {
    -- By default, only LazyVim plugins will be lazy-loaded. Your custom plugins will load during startup.
    -- If you know what you're doing, you can set this to `true` to have all your custom plugins lazy-loaded by default.
    lazy = false,
    -- It's recommended to leave version=false for now, since a lot the plugin that support versioning,
    -- have outdated releases, which may break your Neovim install.
    version = false, -- always use the latest git commit
    -- version = "*", -- try installing the latest stable version for plugins that support semver
  },
  lockfile = vim.fn.stdpath("state") .. "/lazy-lock.json",
  rocks = {
    enabled = false,
  },
  concurrency = 20,
  install = { colorscheme = { "neosolarized", "tokyonight", "habamax" } },
  checker = { enabled = true }, -- automatically check for plugin updates
  ui = {
    size = { width = 0.8, height = 0.7 },
    -- border = 'single',
    border = "none",
    -- The backdrop opacity. 0 is fully opaque, 100 is fully transparent.
    backdrop = 100,
    icons = {
      cmd = "",
      config = "󰒓",
      event = "󰉁",
      favorite = "󰓎", --  󰥺
      ft = "󰈔",
      init = "󰒓",
      import = "󱚀",
      keys = "󰌌", -- 󰌌 󱀍
      lazy = "󰒲",
      loaded = "●",
      not_loaded = "○",
      -- plugin = '󰏓',
      plugin = "󰙴 ", -- 󱕅 󰙴 󰐱
      runtime = "",
      require = "󰹳", -- 󰢱
      source = "󰗀",
      start = "󰐊",
      -- task = '✔',
      task = "󰄭 ",
      list = {
        "󰨐",
        "󰨓",
        "󰧞",
        -- '󱨊',
        -- '●',
        -- '󰜴',
        -- '',
        -- '󰍴',
      },
    },
    throttle = 20,
  },
  performance = {
    rtp = {
      -- disable some rtp plugins
      disabled_plugins = {
        "gzip",
        -- "matchit",
        -- "matchparen",
        -- "netrwPlugin",
        "tarPlugin",
        "tohtml",
        "tutor",
        "zipPlugin",
      },
    },
  },
})
