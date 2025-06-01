return {
  {
    "rmagatti/auto-session",
    lazy = false,
    priority = 1000,
    config = function()
      require("auto-session").setup({
        auto_restore_enabled = true,
        auto_save_enabled = true,
        auto_session_suppress_dirs = { "~/", "~/Downloads", "~/Projects" },
        pre_save_cmds = { "Neotree close" },
        post_restore_cmds = { "Neotree filesystem reveal left" },
        session_lens = {
          load_on_setup = true,
          theme_conf = { border = true },
          previewer = false,
        },
      })
      
      -- Set keymaps for session management
      vim.keymap.set("n", "<leader>ls", require("auto-session.session-lens").search_session, 
        { noremap = true, silent = true, desc = "Search sessions" })
      vim.keymap.set("n", "<leader>sd", "<cmd>Autosession delete<CR>",
        { noremap = true, silent = true, desc = "Delete session" })
      vim.keymap.set("n", "<leader>sr", "<cmd>SessionRestore<CR>",
        { noremap = true, silent = true, desc = "Restore session" })
      vim.keymap.set("n", "<leader>ss", "<cmd>SessionSave<CR>",
        { noremap = true, silent = true, desc = "Save session" })
    end,
    dependencies = {
      "nvim-telescope/telescope.nvim",
    },
  },
  {
    "rmagatti/session-lens",
    lazy = false,
    config = function()
      require("session-lens").setup({
        path_display = { "shorten" },
        theme = "dropdown",
        theme_conf = {
          winblend = 10,
          border = true,
        },
        previewer = false,
      })
      
      -- Make sure telescope loads the session-lens extension
      require("telescope").load_extension("session-lens")
    end,
    dependencies = {
      "rmagatti/auto-session",
      "nvim-telescope/telescope.nvim",
    },
  },
}
