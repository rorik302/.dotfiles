vim.api.nvim_create_autocmd("BufEnter", {
	pattern = { "*.hl", "hypr*.conf" },
	callback = function()
		vim.lsp.start({
			name = "hyprls",
			cmd = { "hyprls" },
			root_dir = vim.fn.getcwd(),
		})
	end,
})
