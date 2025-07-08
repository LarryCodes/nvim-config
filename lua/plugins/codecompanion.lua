return {
  {
    "olimorris/codecompanion.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
      "j-hui/fidget.nvim",
    },
    config = function()
      require("codecompanion").setup({
        strategies = {
          chat = {
            adapter = {
              name = "anthropic",
              --model = "claude-3-7-sonnet-20250219",
              model = "claude-sonnet-4-20250514", 
            },
          },
          inline = {
            adapter = {
              name = "anthropic",
              model = "claude-3-7-sonnet-20250219"
            },
          }
        },
        adapters = {
          anthropic = function()
            return require("codecompanion.adapters").extend("anthropic", {
              env = {
                api_key ="ANTHROPIC_API_KEY",
              }
            })
          end
        },
        display = {
          chat = {
            window = {
              layout = "vertical",
              position = "right",
              border = "single",
              height = 0.8,
              width = 0.35,
              relative = "editor",
            }
          }
        }
      })

      -- Keybindings for CodeCompanion (normal and visual modes)
      vim.keymap.set({"n", "v"}, "<leader>aia", "<cmd>CodeCompanionActions<CR>", { desc = "CodeCompanion Actions" })
      vim.keymap.set({"n", "v"}, "<leader>aic", "<cmd>CodeCompanionChat<CR>", { desc = "CodeCompanion Chat" })
      vim.keymap.set({"n", "v"}, "<leader>ait", "<cmd>CodeCompanionChat Toggle<CR>", { desc = "CodeCompanion Chat Toggle" })
      vim.keymap.set({"n", "v"}, "<leader>aii", "<cmd>CodeCompanion<CR>", { desc = "CodeCompanion" })
      vim.keymap.set("v", "<leader>aie", ":<C-u>'<,'>CodeCompanion /explain<CR>", { desc="CodeCompanion Explain selection"})
        
      vim.keymap.set("v", "<leader>aicm", ":<C-u>'<,'>CodeCompanion /commit<CR>", { desc="CodeCompanion Generate commit message for selected code."})
      vim.keymap.set("v", "<leader>aif", ":<C-u>'<,'>CodeCompanion /fix<CR>", { desc="CodeCompanion fix the selected code."})

      local progress_handler = require("fidget.progress")
      local handles = {}
      local group = vim.api.nvim_create_augroup("CodeCompanionFidget", {})

      vim.api.nvim_create_autocmd("user", {
        pattern = "CodeCompanionRequestStarted",
        group = group,
        callback = function(e)
          handles[e.data.id] = progress_handler.handle.create({
            title = "CodeCompanion",
            message = "Evaluating...",
            lsp_client = { name = e.data.adapter.formatted_name }
          })
        end,
      })

      vim.api.nvim_create_autocmd("user", {
        pattern = "CodeCompanionRequestFinished",
        group = group,
        callback = function(e)
          local h = handles[e.data.id]
          if h then
            h.message = e.data.status == "success" and "Done" or "Failed"
            h:finish()
            handles[e.data.id] = nil
          end
        end,
      })
    end
  },
  {
    'MeanderingProgrammer/render-markdown.nvim',
    ft = { "markdown", "codecompanion" }
  }
}
