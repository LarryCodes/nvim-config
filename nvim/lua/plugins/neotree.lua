  return {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
    },
    config = function()
      require('neo-tree').setup({
        filesystem = {
          filtered_items = {
            visible = true,
            hide_dotfiles = false,
            hide_gitignored = false,
          }
        },
        window = {
          width = 30,
          auto_expand_width = false,
        },
        default_component_configs = {
          indent = {
            padding = 0,
          },
        },
      })
      
      -- Keep the shortcut for toggling Neo-tree
      vim.keymap.set('n', '<C-n>', ':Neotree toggle<CR>', { silent = true })
      
      -- Auto-open Neo-tree when Neovim starts
      vim.api.nvim_create_autocmd("VimEnter", {
        callback = function()
          -- Only open automatically if we're not opening a specific file
          if vim.fn.argc() == 0 then
            vim.cmd("Neotree filesystem reveal left")
          end
        end
      })
    end
  }
