return {
  "nvimtools/none-ls.nvim",
  dependencies = {
    "nvimtools/none-ls-extras.nvim",
  },
  config = function()
    local null_ls = require("null-ls")
    null_ls.setup({
      sources = {
        null_ls.builtins.formatting.stylua,
        null_ls.builtins.formatting.prettier,
        null_ls.builtins.completion.spell,
        null_ls.builtins.formatting.prettier.with({
          extra_args = { "--tab-width", "2", "--use-tabs", "false" },
        }),
        null_ls.builtins.formatting.black,
        null_ls.builtins.formatting.phpcsfixer.with({
          filetypes = { "php" },
        }),
        null_ls.builtins.formatting.blade_formatter.with({
          filetypes = { "blade" },
          extra_args = { "--indent-size=2" }
        }),
        require("none-ls.diagnostics.eslint"),
      },
    })

    vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})
  end,
}
