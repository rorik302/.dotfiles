return {
	"stevearc/conform.nvim",
	config = function()
		require("conform").setup({
			formatters_by_ft = {
				css = { "prettier" },
				html = { "prettier" },
				json = { "prettier" },
				javascript = { "prettier" },
				lua = { "stylua" },
				markdown = { "markdownlint" },
				python = { "ruff", "black" },
				scss = { "prettier" },
				sass = { "prettier" },
				toml = { "tombi" },
				typescript = { "prettier" },
				vue = { "prettier" },
				yaml = { "prettier" },
			},
		})

		vim.api.nvim_create_autocmd("BufWritePre", {
			pattern = "*",
			callback = function(args)
				require("conform").format({ bufnr = args.buf })
			end,
		})
	end,
}
