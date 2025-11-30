return {
	"romgrk/barbar.nvim",
	dependencies = {
		"lewis6991/gitsigns.nvim",
		"nvim-tree/nvim-web-devicons",
	},
	init = function()
		vim.g.barbar_auto_setup = false
	end,
	version = "^1.0.0",
	config = function()
		require("barbar").setup()

		vim.keymap.set("n", "<leader>bx", ":BufferClose<CR>", { silent = true, desc = "Buffer: Close" })
		vim.keymap.set(
			"n",
			"<leader>bX",
			":BufferCloseAllButCurrent<CR>",
			{ silent = true, desc = "Buffer: Close All But Current" }
		)
		vim.keymap.set("n", "<A-l>", ":BufferNext<CR>", { noremap = true, silent = true, desc = "Buffer: Next" })
		vim.keymap.set(
			"n",
			"<A-h>",
			":BufferPrevious<CR>",
			{ noremap = true, silent = true, desc = "Buffer: Previous" }
		)
	end,
}
