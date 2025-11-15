return {
	"olimorris/codecompanion.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{
			"MeanderingProgrammer/render-markdown.nvim",
			opts = {
				file_types = { "markdown", "codecompanion" },
			},
			ft = { "markdown", "codecompanion" },
		},
		"lalitmee/codecompanion-spinners.nvim",
		"ravitemer/codecompanion-history.nvim",
	},
	config = function()
		require("codecompanion").setup({
			display = {
				action_palette = {
					provider = "snacks",
				},
			},
			strategies = {
				chat = { adapter = "cerebras" },
				inline = { adapter = "cerebras" },
				cmd = { adapter = "cerebras" },
			},
			adapters = {
				acp = {
					opts = {
						show_defaults = false,
					},
				},
				http = {
					opts = {
						show_defaults = false,
						show_model_choices = true,
					},
					cerebras = function()
						return require("codecompanion.adapters").extend("openai_compatible", {
							env = {
								url = "https://api.cerebras.ai/v1",
								api_key = vim.trim(vim.fn.system("cat ~/secrets/cerebras_api_key")),
								chat_url = "/chat/completions",
								models_endpoint = "/models",
							},
							schema = {
								model = {
									default = "qwen-3-32b",
									choices = {
										"gpt-oss-120b",
										"llama3.1-8b",
										"llama-3.3-70b",
										"qwen-3-32b",
										"qwen-3-235b-a22b-instruct-2507",
										"qwen-3-235b-a22b-thinking-2507",
										"zai-glm-4.6",
									},
								},
							},
						})
					end,
				},
			},
			extensions = {
				spinner = {
					opts = {
						style = "snacks",
					},
				},
				history = {
					enabled = true,
					opts = {
						expiration_days = 7,
					},
				},
			},
		})
	end,
}
