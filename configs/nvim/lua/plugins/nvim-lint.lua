return {
	"mfussenegger/nvim-lint",
	config = function()
		require("lint").linters_by_ft = {
			css = { "stylelint" },
			docker = { "hadolint" },
			html = { "htmlhint" },
			javascript = { "eslint_d" },
			json = { "jsonlint" },
			lua = { "selene" },
			markdown = { "markdownlint" },
			python = { "ruff", "mypy" },
			sass = { "stylelint" },
			scss = { "stylelint" },
			toml = { "tombi" },
			typescript = { "eslint_d" },
			yaml = { "yamllint" },
		}
	end,
}
