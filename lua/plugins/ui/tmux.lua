-- 在这里设置clipboard, 并且event为VeryLazy, 才会在tmux中起作用
-- vim.print(string.format("clipboard tmux.lua: %s", vim.opt.clipboard._value))
vim.opt.clipboard = { "unnamedplus" } -- Use the system clipboard
return {
  {
    "aserowy/tmux.nvim",
    event = "VeryLazy",
    -- 要加opts, 否则插件不进行配置
    opts = {
      copy_sync = {
        -- enables copy sync. by default, all registers are synchronized.
        -- to control which registers are synced, see the `sync_*` options.
        enable = true,

        -- ignore specific tmux buffers e.g. buffer0 = true to ignore the
        -- first buffer or named_buffer_name = true to ignore a named tmux
        -- buffer with name named_buffer_name :)
        ignore_buffers = { empty = false },

        -- TMUX >= 3.2: all yanks (and deletes) will get redirected to system
        -- clipboard by tmux
        redirect_to_clipboard = false,

        -- offset controls where register sync starts
        -- e.g. offset 2 lets registers 0 and 1 untouched
        register_offset = 0,

        -- overwrites vim.g.clipboard to redirect * and + to the system
        -- clipboard using tmux. If you sync your system clipboard without tmux,
        -- disable this option!
        sync_clipboard = true,

        -- synchronizes registers *, +, unnamed, and 0 till 9 with tmux buffers.
        sync_registers = true,

        -- synchronizes registers when pressing p and P.
        sync_registers_keymap_put = true,

        -- synchronizes registers when pressing (C-r) and ".
        sync_registers_keymap_reg = true,

        -- syncs deletes with tmux clipboard as well, it is adviced to
        -- do so. Nvim does not allow syncing registers 0 and 1 without
        -- overwriting the unnamed register. Thus, ddp would not be possible.
        sync_deletes = true,

        -- syncs the unnamed register with the first buffer entry from tmux.
        sync_unnamed = true,
      },
      navigation = {
        -- cycles to opposite pane while navigating into the border
        cycle_navigation = true,

        -- enables default keybindings (C-hjkl) for normal mode
        enable_default_keybindings = true,

        -- prevents unzoom tmux when navigating beyond vim border
        persist_zoom = true,
      },
      resize = {
        -- enables default keybindings (A-hjkl) for normal mode
        enable_default_keybindings = true,

        -- sets resize steps for x axis
        resize_step_x = 1,

        -- sets resize steps for y axis
        resize_step_y = 1,
      },
    },
    -- 不用加下面的条件, 一直用tmux.nvim来进行窗口导航和改变窗口大小
    -- cond = function()
    --   return os.getenv("TERM_PROGRAM") == "tmux"
    -- end,
    keys = {
      { "<C-h>", "<CMD>lua require'tmux'.move_left()<CR>", desc = "Move To Left Window" },
      { "<C-j>", "<CMD>lua require'tmux'.move_bottom()<CR>", desc = "Move To Bottom Window" },
      { "<C-k>", "<CMD>lua require'tmux'.move_top()<CR>", desc = "Move To Top Window" },
      { "<C-l>", "<CMD>lua require'tmux'.move_right()<CR>", desc = "Move To Right Window" },
      { "<A-h>", "<CMD>lua require'tmux'.resize_left()<CR>", desc = "Resize Left" },
      { "<A-j>", "<CMD>lua require'tmux'.resize_bottom()<CR>", desc = "Resize Bottom" },
      { "<A-k>", "<CMD>lua require'tmux'.resize_top()<CR>", desc = "Resize Top" },
      { "<A-l>", "<CMD>lua require'tmux'.resize_right()<CR>", desc = "Resize Right" },
      { "p", "v:lua.tmux.sync_registers('p')", desc = "Tmux registers put" },
      { "P", "v:lua.tmux.sync_registers('P')", desc = "Tmux registers put" },
    },
  },
  -- {
  --   "aserowy/tmux.nvim",
  --   opts = function()
  --     vim.print(string.format("clipboard tmux opts: %s", vim.opt.clipboard._value))
  --   end,
  -- },
}
