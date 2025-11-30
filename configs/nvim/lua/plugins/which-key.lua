return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	config = function()
		local wk = require("which-key")

		wk.setup({
			preset = "modern",
			win = {
				width = { min = 0.4, max = 0.5 },
				height = { min = 9, max = 25 },
			},
		})

		wk.add({
			{ "<leader>a", group = "AI" },
			{ "<leader>b", group = "Buffer" },
			{ "<leader>d", group = "Diagnostic" },
			{ "<leader>f", group = "Find" },
			{ "<leader>g", group = "Git" },
			{ "<leader>l", group = "LiveMD" },
			{ "<leader>m", group = "Multicursor" },
			{ "<leader>S", group = "TreeSJ" },
			{ "<leader>t", group = "Terminal" },
			{ "<leader>tn", group = "Snacks: New Terminal" },
		})
	end,
}
