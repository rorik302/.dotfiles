local cerebras_api_key = vim.trim(vim.fn.system("cat ~/secrets/cerebras_api_key"))

return {
	"milanglacier/minuet-ai.nvim",
	dependencies = { "nvim-lua/plenary.nvim" },
	config = function()
		require("minuet").setup({
			virtualtext = {
				keymap = {
					accept = "<C-y>",
					accept_line = "<C-l>",
					accept_n_lines = "<C-h>",
					prev = "<C-k>",
					next = "<C-j>",
					dismiss = "<C-e>",
				},
				show_on_completion_menu = true,
			},
			provider = "openai_fim_compatible",
			n_completions = 1,
			throttle = 3000,
			debounce = 3000,
			provider_options = {
				openai_fim_compatible = {
					api_key = function()
						return cerebras_api_key
					end,
					name = "Cerebras",
					end_point = "https://api.cerebras.ai/v1/completions",
					model = "qwen-3-32b",
					optional = {
						max_tokens = 56,
					},
					template = {
						suffix = false,
					},
				},
			},
		})
	end,
}
