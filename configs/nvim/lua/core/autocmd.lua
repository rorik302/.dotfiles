local function augroup(name, clear)
	local clear_opt = clear or true
	return vim.api.nvim_create_augroup("User_" .. name, { clear = clear_opt })
end

vim.api.nvim_create_autocmd("BufReadPost", {
	desc = "Восстановление позиции курсора при открытии буфера",
	group = augroup("LastCursorPosition"),
	callback = function(event)
		local exclude = { "gitcommit", "commit", "gitrebase" }
		if vim.tbl_contains(exclude, vim.bo[event.buf].filetype) then
			return
		end

		local mark = vim.api.nvim_buf_get_mark(event.buf, '"')
		local lcount = vim.api.nvim_buf_line_count(event.buf)

		if mark[1] > 0 and mark[1] <= lcount then
			pcall(vim.api.nvim_win_set_cursor, 0, mark)
		end
	end,
})

vim.api.nvim_create_autocmd("FileType", {
	pattern = "python",
	callback = function()
		vim.opt_local.expandtab = true
		vim.opt_local.shiftwidth = 4
		vim.opt_local.tabstop = 4
		vim.opt_local.softtabstop = 4
	end,
})

vim.api.nvim_create_autocmd("FileType", {
	callback = function(event)
		local buf = vim.bo[event.buf]
		pcall(function()
			vim.treesitter.start(event.buf)
			buf.indentexpr = "v:lua.require('nvim-treesitter').indentexpr()"
		end)
	end,
})

vim.api.nvim_create_autocmd("BufWinLeave", {
	pattern = { "*.*" },
	command = "mkview",
	desc = "Save folds when closing file",
})

vim.api.nvim_create_autocmd("BufWinEnter", {
	pattern = { "*.*" },
	command = "silent! loadview",
	desc = "Load folds when opening file",
})

vim.api.nvim_create_autocmd("FileType", {
	pattern = "help",
	command = "wincmd L",
})

vim.api.nvim_create_autocmd("VimResized", {
	command = "wincmd =",
})

vim.api.nvim_create_autocmd("FileType", {
	callback = function()
		vim.opt_local.formatoptions:remove({ "c", "r", "o" })
	end,
})

vim.api.nvim_create_autocmd({ "WinEnter", "BufEnter" }, {
	group = vim.api.nvim_create_augroup("active_cursorline", { clear = true }),
	callback = function()
		vim.opt_local.cursorline = true
	end,
})

vim.api.nvim_create_autocmd({ "WinLeave", "BufLeave" }, {
	group = "active_cursorline",
	callback = function()
		vim.opt_local.cursorline = false
	end,
})

vim.api.nvim_create_autocmd("CursorMoved", {
	group = vim.api.nvim_create_augroup("LspReferenceHighlight", { clear = true }),
	desc = "Highlight references under cursor",
	callback = function()
		if vim.fn.mode() ~= "i" then
			local clients = vim.lsp.get_clients({ bufnr = 0 })
			local supports_highlight = false
			for _, client in ipairs(clients) do
				if client.server_capabilities.documentHighlightProvider then
					supports_highlight = true
					break
				end
			end

			if supports_highlight then
				vim.lsp.buf.clear_references()
				vim.lsp.buf.document_highlight()
			end
		end
	end,
})

vim.api.nvim_create_autocmd("CursorMovedI", {
	group = "LspReferenceHighlight",
	desc = "Clear highlights when entering insert mode",
	callback = function()
		vim.lsp.buf.clear_references()
	end,
})
