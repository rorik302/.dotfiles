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
			-- toml = { "tombi" }, -- почему-то выдает ошибку, что линтер не найден
			typescript = { "eslint_d" },
			yaml = { "yamllint" },
		}

		vim.api.nvim_create_autocmd({ "InsertLeave", "BufRead", "BufWritePost" }, {
			callback = function()
				require("lint").try_lint()
			end,
		})
	end,
}
