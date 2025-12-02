return {
	"folke/snacks.nvim",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	priority = 1000,
	lazy = false,
	---@type snacks.Config
	opts = {
		explorer = {
			enabled = true,
			replace_netrw = true,
		},
		input = { enabled = true },
		notifier = { enabled = true, timeout = 3000 },
		picker = {
			enabled = true,
			include = { "*" },
			layout = {
				cycle = false,
			},
		},
	},
	config = function(_, opts)
		require("snacks").setup(opts)

		require("plugins.snacks.explorer")
		require("plugins.snacks.notifier")
		require("plugins.snacks.picker")
	end,
}
