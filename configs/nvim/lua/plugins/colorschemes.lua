return {
	"lmantw/themify.nvim",
	lazy = false,
	priority = 999,
	config = function()
		require("themify").setup({
			"catppuccin/nvim",
			"gbprod/nord.nvim",
			"JoosepAlviste/palenightfall.nvim",
			"Shatur/neovim-ayu",
		})
	end,
}
