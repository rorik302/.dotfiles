return {
	"y3owk1n/undo-glow.nvim",
	version = "*",
	config = function()
		local ug = require("undo-glow")

		ug.setup({
			animation = {
				enabled = true,
				animation_type = "zoom",
			},
		})

		vim.keymap.set("n", "u", ug.undo, { noremap = true, desc = "Undo with highlight" })
		vim.keymap.set("n", "<C-r>", ug.redo, { noremap = true, desc = "Redo with highlight" })
		vim.keymap.set("n", "p", ug.paste_below, { noremap = true, desc = "Paste below with highlight" })
		vim.keymap.set("n", "P", ug.paste_above, { noremap = true, desc = "Paste above with highlight" })
		vim.keymap.set("n", "n", ug.search_next, { noremap = true, desc = "Search next with highlight" })
		vim.keymap.set("n", "N", ug.search_prev, { noremap = true, desc = "Search previous with highlight" })
		vim.keymap.set("n", "*", ug.search_star, { noremap = true, desc = "Search * with highlight" })
		vim.keymap.set("n", "#", ug.search_hash, { noremap = true, desc = "Search # with highlight" })

		vim.keymap.set(
			{ "n", "v" },
			"gc",
			ug.comment,
			{ noremap = true, expr = true, desc = "Toggle comment with highlight" }
		)
		vim.keymap.set(
			"n",
			"gcc",
			ug.comment_line,
			{ noremap = true, expr = true, desc = "Toggle comment line with highlight" }
		)

		vim.api.nvim_create_autocmd("TextYankPost", {
			desc = "Highlight when yanking (copying) text",
			callback = function()
				ug.yank()
			end,
		})
		vim.api.nvim_create_autocmd("CmdLineLeave", {
			pattern = { "/", "?" },
			desc = "Highlight when search cmdline leave",
			callback = function()
				ug.search_cmd()
			end,
		})
	end,
}
