return {
	"nvimdev/guard.nvim",
	dependencies = {
		"nvimdev/guard-collection",
	},
	config = function()
		local ft = require("guard.filetype")

		ft("lua"):fmt("stylua"):lint("selene")
		ft("python"):fmt("ruff"):lint("mypy"):append("ruff")

		vim.g.guard_config = {
			fmt_on_save = false,
			save_on_fmt = false,
		}

		vim.keymap.set("n", "<leader>F", ":Guard fmt<CR>", { desc = "Guard: Format" })
	end,
}
