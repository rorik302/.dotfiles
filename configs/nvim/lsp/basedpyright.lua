---@type vim.lsp.Config
return {
	cmd = { "basedpyright-langserver", "--stdio" },
	filetypes = { "python" },
	root_markers = {
		"pyproject.toml",
		"requirements.txt",
		"setup.py",
		"setup.cfg",
		".git",
	},
	settings = {
		basedpyright = {
			analysis = {
				autoSearchPath = true,
				autoImportCompletions = true,
				useLibraryCodeForTypes = true,
				typeCheckingMode = "standard",
			},
			inlayHints = {
				variableTypes = true,
				functionReturnTypes = true,
				callArgumentNames = false,
				parameterTypes = false,
				genericTypes = false,
			},
		},
	},
}
