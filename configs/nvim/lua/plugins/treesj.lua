return {
	"Wansmer/treesj",
	dependencies = {
		"nvim-treesitter/nvim-treesitter",
	},
	config = function()
		local sj = require("treesj")

		sj.setup({
			use_default_keymaps = false,
		})

		vim.keymap.set("n", "<leader>st", sj.toggle, { desc = "TreeSJ: Toggle" })
		vim.keymap.set("n", "<leader>ss", sj.split, { desc = "TreeSJ: Split" })
		vim.keymap.set("n", "<leader>sj", sj.join, { desc = "TreeSJ: Join" })
	end,
}
