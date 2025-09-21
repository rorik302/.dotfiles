return {
	"akinsho/toggleterm.nvim",
	config = function()
		require("toggleterm").setup({})

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
