return {
	"folke/flash.nvim",
	event = "VeryLazy",
	config = function()
		local flash = require("flash")

		flash.setup({
			modes = {
				char = { enabled = true },
			},
		})

		vim.keymap.set({ "n", "x", "o" }, "f", function()
			vim.g.ug_ignore_cursor_moved = true
			flash.jump()
			vim.defer_fn(function()
				local region = require("undo-glow.utils").get_current_cursor_row()
				local undo_glow_opts = require("undo-glow.utils").merge_command_opts("UgSearch", {
					force_edge = true,
				})
				require("undo-glow").highlight_region(vim.tbl_extend("force", undo_glow_opts, region))
			end, 5)
		end, { desc = "Flash: Jump" })
		vim.keymap.set({ "n", "x", "o" }, "F", function()
			flash.treesitter()
		end, { desc = "Flash: Jump Treesitter" })
		vim.keymap.set({ "o" }, "r", function()
			flash.remote()
		end, { desc = "Flash: Remote" })
		vim.keymap.set({ "x", "o" }, "R", function()
			flash.treesitter_search()
		end, { desc = "Flash: Treesitter Search" })
	end,
}
