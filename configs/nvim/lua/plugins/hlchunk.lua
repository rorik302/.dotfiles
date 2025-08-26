return {
	"shellRaining/hlchunk.nvim",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		require("hlchunk").setup({
			chunk = {
				enable = true,
				chars = {
					right_arrow = "─",
				},
				use_treesitter = true,
			},
		})
	end,
}
