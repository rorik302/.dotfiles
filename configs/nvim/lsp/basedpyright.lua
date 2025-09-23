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
				typeCheckingMode = "standard",
			},
		},
	},
}
