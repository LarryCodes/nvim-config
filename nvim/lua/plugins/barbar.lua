return {
	"romgrk/barbar.nvim",
	dependencies = {
		"lewis6991/gitsigns.nvim", -- OPTIONAL: for git status
		"nvim-tree/nvim-web-devicons", -- OPTIONAL: for file icons
	},
	config = function()
		vim.g.barbar_auto_setup = false
		local map = vim.api.nvim_set_keymap
		local opts = { noremap = true, silent = true }

		--Navigate to next buffer
		map("n", "<S-n>", ":BufferNext<CR>", opts)

		--Navigate to previous buffer
		map("n", "<S-p>", ":BufferPrev<CR>", opts)

		-- Go to buffer by index (1 to 9)
		map("n", "<leader>1", ":BufferGoto 1<CR>", opts)
		map("n", "<leader>2", ":BufferGoto 2<CR>", opts)
		map("n", "<leader>3", ":BufferGoto 3<CR>", opts)
		map("n", "<leader>4", ":BufferGoto 4<CR>", opts)
		map("n", "<leader>5", ":BufferGoto 5<CR>", opts)
		map("n", "<leader>6", ":BufferGoto 6<CR>", opts)
		map("n", "<leader>7", ":BufferGoto 7<CR>", opts)
		map("n", "<leader>8", ":BufferGoto 8<CR>", opts)
		map("n", "<leader>9", ":BufferGoto 9<CR>", opts)

		-- Close Buffer
		map("n", "<leader>c", ":BufferClose<CR>", opts)
	end,
}
