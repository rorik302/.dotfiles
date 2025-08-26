return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	config = function()
		local wk = require("which-key")

		wk.add({
			{ "<leader>f", group = "Find" },
			{ "<leader>g", group = "Git" },
			{ "<leader>m", group = "Multicursor" },
			{ "<leader>s", group = "TreeSJ" },
			{ "<leader>t", group = "Terminal" },
		})
	end,
}
