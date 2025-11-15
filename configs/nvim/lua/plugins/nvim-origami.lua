return {
	"chrisgrieser/nvim-origami",
	event = "VeryLazy",
	config = function()
		require("origami").setup()
	end,
}
