return {
	"Shatur/neovim-ayu",
	config = function()
		require("ayu").setup({
			mirage = true,
		})

		vim.cmd("colorscheme ayu-mirage")

		vim.api.nvim_set_hl(0, "SnacksPickerPathHidden", { fg = "#7d7d7d" })
	end,
}
