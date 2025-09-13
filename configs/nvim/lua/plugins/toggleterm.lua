return {
	"akinsho/toggleterm.nvim",
	config = function()
		require("toggleterm").setup({})

		vim.keymap.set("n", "<leader>tt", ":ToggleTerm<CR>", { desc = "ToggleTerm: Toggle Terminal", silent = true })
		vim.keymap.set("n", "<leader>tn", ":TermNew<CR>", { desc = "ToggleTerm: New Terminal", silent = true })
		vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Set normal mode in terminal" })

		local Terminal = require("toggleterm.terminal").Terminal
		local lazygit =
			Terminal:new({ cmd = "lazygit", direction = "float", float_opts = { border = "rounded" }, hidden = true })
		function _lazygit_toggle()
			lazygit:toggle()
		end
		vim.keymap.set(
			"n",
			"<leader>gl",
			"<cmd>lua _lazygit_toggle()<CR>",
			{ desc = "ToggleTerm: Lazygit", noremap = true, silent = true }
		)
	end,
}
