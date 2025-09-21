return {
	"Exafunction/windsurf.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	config = function()
		require("codeium").setup({
			enable_cmp_source = false,
			virtual_text = {
				enabled = true,
				key_bindings = {
					accept = "<A-y>",
					accept_word = "<A-w>",
					accept_line = "<A-l>",
					next = "<A-j>",
					prev = "<A-k>",
				},
			},
		})
	end,
}
