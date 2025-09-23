return {
	"nvimdev/guard.nvim",
	dependencies = {
		"nvimdev/guard-collection",
	},
	config = function()
		local ft = require("guard.filetype")

		ft("lua"):fmt("stylua"):lint("selene")
		ft("python"):fmt("ruff"):lint("ruff")

		vim.keymap.set("n", "<leader>F", ":Guard fmt<CR>", { desc = "Guard: Format" })
	end,
}
