return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	config = function()
		local wk = require("which-key")

		wk.setup({
			preset = "helix",
		})

		wk.add({
			{ "<leader>a", group = "AI" },
			{ "<leader>b", group = "Buffer" },
			{ "<leader>d", group = "Diagnostic" },
			{ "<leader>f", group = "Find" },
			{ "<leader>g", group = "Git" },
			{ "<leader>l", group = "LiveMD" },
			{ "<leader>m", group = "Multicursor" },
			{ "<leader>s", group = "TreeSJ" },
			{ "<leader>t", group = "Terminal" },
		})
	end,
}
