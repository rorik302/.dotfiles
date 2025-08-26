return {
	"folke/snacks.nvim",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	priority = 1000,
	lazy = false,
	---@type snacks.Config
	opts = {
		dashboard = { enabled = true },
		explorer = {
			enabled = true,
			replace_netrw = true,
		},
		input = { enabled = true },
		notifier = { enabled = true, timeout = 3000 },
		picker = { enabled = true },
	},
	config = function(_, opts)
		local snacks = require("snacks")
		snacks.setup(opts)

		vim.keymap.set("n", "<leader>e", function()
			snacks.explorer()
		end, { desc = "Snacks: Toggle Explorer" })

		vim.keymap.set("n", "<leader>fb", snacks.picker.buffers, { desc = "Snacks: Find Buffer" })
		vim.keymap.set("n", "<leader>fc", snacks.picker.colorschemes, { desc = "Snacks: Find Colorscheme" })
		vim.keymap.set("n", "<leader>ff", snacks.picker.files, { desc = "Snacks: Find Files" })
		vim.keymap.set("n", "<leader>fg", snacks.picker.grep, { desc = "Snacks: Find Grep" })
		vim.keymap.set("n", "<leader>fh", snacks.picker.help, { desc = "Snacks: Find Help" })
		vim.keymap.set("n", "<leader>fH", snacks.picker.highlights, { desc = "Snacks: Find Highlight" })
		vim.keymap.set("n", "<leader>fi", snacks.picker.icons, { desc = "Snacks: Find Icons" })
		vim.keymap.set("n", "<leader>fk", snacks.picker.keymaps, { desc = "Snacks: Find Keymap" })
		vim.keymap.set("n", "<leader>fN", snacks.picker.notifications, { desc = "Snacks: Open Notifications" })
		vim.keymap.set("n", "<leader>fn", snacks.notifier.show_history, { desc = "Snacks: Notifications History" })
		vim.keymap.set("n", "<leader>fu", snacks.picker.undo, { desc = "Snacks: Undo History" })
	end,
}
