return {
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		lazy = false,
		opts = {
			auto_install = true,
		},
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = {
					"lua_ls",
					"html",
					"cssls",
					"cssmodules_ls",
					"css_variables",
					"tailwindcss",
					"ts_ls",
					"volar",
					"intelephense",
					"rust_analyzer",
				},
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			local capabilities = require("cmp_nvim_lsp").default_capabilities()
			local lsp_config = require("lspconfig")

			lsp_config.lua_ls.setup({
				capabilities = capabilities,
			})

			lsp_config.html.setup({
				capabilities = capabilities,
			})

			lsp_config.cssls.setup({
				capabilities = capabilities,
			})

			lsp_config.cssmodules_ls.setup({
				capabilities = capabilities,
			})

			lsp_config.css_variables.setup({
				capabilities = capabilities,
			})

			lsp_config.tailwindcss.setup({
				capabilities = capabilities,
			})

			lsp_config.ts_ls.setup({
				capabilities = capabilities,
			})

			lsp_config.volar.setup({
				capabilities = capabilities,
			})

			lsp_config.intelephense.setup({
				capabilities = capabilities,
			})

			lsp_config.rust_analyzer.setup({
				capabilities = capabilities,
			})

			vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
			vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
			vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {})
		end,
	},
}
