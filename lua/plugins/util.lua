---@type LazySpec
return {
  {
    "nvim-mini/mini.hipatterns",
    enabled = false,
  },
  {
    -- Highlight hex and rgb colors within Neovim
    "NvChad/nvim-colorizer.lua",
    event = "BufEnter",
    opts = {
      filetypes = { "*", "!mason", "!lazy" },
      -- user_default_options = {
      --   RGB = true, -- #RGB hex codes
      --   RRGGBB = true, -- #RRGGBB hex codes
      --   names = true, -- "Name" codes like Blue or blue
      --   RRGGBBAA = true, -- #RRGGBBAA hex codes
      --   AARRGGBB = false, -- 0xAARRGGBB hex codes
      --   mode = "background",
      --   -- mode = 'foreground',
      --   -- mode = 'virtualtext',
      --   always_update = true,
      -- },
      options = {
        parsers = {
          names = {
            enable = true,
            lowercase = true,
            camelcase = true,
            uppercase = false,
            strip_digits = false,
            custom = false, -- table|function|false
          },
          hex = {
            default = true, -- default value for format keys (see above)
            rgb = true, -- #RGB
            rgba = true, -- #RGBA
            rrggbb = true, -- #RRGGBB
            rrggbbaa = true, -- #RRGGBBAA
            aarrggbb = true, -- 0xAARRGGBB
          },
          rgb = { enable = true },
          hsl = { enable = true },
          oklch = { enable = false },
          tailwind = {
            enable = false, -- parse Tailwind color names
            lsp = false, -- use Tailwind LSP documentColor
            update_names = false,
          },
          sass = {
            enable = false,
            parsers = { css = true },
            variable_pattern = "^%$([%w_-]+)",
          },
          xterm = { enable = false },
          custom = {},
        },
        display = {
          mode = "background", -- "background"|"foreground"|"virtualtext"
          background = {
            bright_fg = "#000000",
            dark_fg = "#ffffff",
          },
          virtualtext = {
            char = "■",
            position = "eol", -- "eol"|"before"|"after"
            hl_mode = "foreground",
          },
          priority = {
            default = 150, -- vim.hl.priorities.diagnostics
            lsp = 200, -- vim.hl.priorities.user
          },
        },
        hooks = {
          should_highlight_line = false, -- function(line, bufnr, line_num) -> bool
        },
        always_update = false,
      },
    },
  },

  {
    import = "plugins.util.neovim-session-manager",
  },

  -- {
  --   "xvzc/chezmoi.nvim",
  --   opts = {
  --     edit = {},
  --     notification = {
  --       on_open = true,
  --       on_apply = true,
  --       on_watch = false,
  --     },
  --   },
  -- },
}
