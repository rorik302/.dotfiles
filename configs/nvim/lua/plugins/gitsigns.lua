return {
	"lewis6991/gitsigns.nvim",
	config = function()
		require("gitsigns").setup({
			numhl = true,
		})

		vim.keymap.set(
			"n",
			"<leader>gb",
			":Gitsigns toggle_current_line_blame<CR>",
			{ desc = "Gitsigns: Toggle Blame Line" }
		)
		vim.keymap.set("n", "<leader>gw", ":Gitsigns toggle_word_diff<CR>", { desc = "Gitsigns: Toggle Word Diff" })
		vim.keymap.set("n", "<leader>gB", ":Gitsigns blame<CR>", { desc = "Gitsigns: Blame" })
		vim.keymap.set("n", "<leader>gd", ":Gitsigns diffthis<CR>", { desc = "Gitsigns: Diff File" })
		vim.keymap.set("n", "<leader>gD", ":Gitsigns toggle_deleted<CR>", { desc = "Gitsigns: Toggle Deleted" })
		vim.keymap.set("n", "<leader>gh", ":Gitsigns preview_hunk<CR>", { desc = "Gitsigns: Hunk" })
	end,
}
