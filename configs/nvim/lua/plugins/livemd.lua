return {
	"idossha/LiveMD.nvim",
	ft = { "markdown", "md" },
	cmd = { "LiveMDStart", "LiveMDStop" },
	config = function()
		require("livemd").setup()

		vim.keymap.set(
			"n",
			"<leader>lms",
			":LiveMDStart<CR>",
			{ desc = "LiveMD: Start", noremap = true, silent = true }
		)
		vim.keymap.set("n", "<leader>lmx", ":LiveMDStop<CR>", { desc = "LiveMD: Stop", noremap = true, silent = true })
	end,
}
