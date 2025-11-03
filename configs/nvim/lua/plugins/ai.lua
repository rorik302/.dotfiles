vim.env.BOTHUB_API_KEY = vim.trim(vim.fn.system("cat ~/secrets/bothub_api_key"))

local bothub_models = {
	"gpt-oss-20b:free",
	"gemma-3-27b-it:free",
	"gemma-3-4b-it:free",
	"gemma-3n-e4b-it:free",
	"gemma-3n-e2b-it:free",
	"gemma-3-12b-it:free",
	"gemini-2.0-flash-exp:free",
	"deepseek-chat-v3-0324:free",
	"deepseek-r1:free",
	"deepseek-r1-distill-llama-70b:free",
	"deepseek-chat-v3.1:free",
	"deepseek-r1-0528-qwen3-8b:free",
	"deepseek-r1t-chimera:free",
	"deepseek-r1-0528:free",
	"deepseek-r1t2-chimera:free",
	"qwen3-30b-a3b:free",
	"qwq-32b-arliai-rpr-v1:free",
	"qwen-2.5-coder-32b-instruct:free",
	"qwen3-4b:free",
	"qwen3-14b:free",
	"qwen3-235b-a22b:free",
	"qwen2.5-vl-32b-instruct:free",
	"qwen-2.5-72b-instruct:free",
	"qwen3-coder:free",
	"mistral-small-24b-instruct-2501:free",
	"mistral-nemo:free",
	"mistral-small-3.1-24b-instruct:free",
	"mistral-small-3.2-24b-instruct:free",
	"mistral-7b-instruct:free",
	"llama-3.3-70b-instruct:free",
	"llama-4-maverick:free",
	"llama-3.2-3b-instruct:free",
	"llama-3.3-8b-instruct:free",
	"llama-4-scout:free",
	"glm-4.5-air:free",
	"tongyi-deepresearch-30b-a3b:free",
	"minimax-m2:free",
	"longcat-flash-chat:free",
	"shisa-v2-llama3.3-70b:free",
	"kimi-k2:free",
	"deepcoder-14b-preview:free",
	"mai-ds-r1:free",
	"hermes-3-llama-3.1-405b:free",
	"dolphin-mistral-24b-venice-edition:free",
	"nemotron-nano-9b-v2:free",
	"nemotron-nano-12b-v2-vl:free",
}

local codecompanion = {
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
	},
	config = function()
		require("codecompanion").setup({
			display = {
				action_palette = {
					provider = "snacks",
				},
			},
			strategies = {
				chat = {
					adapter = "bothub",
				},
				inline = {
					adapter = "bothub",
				},
				cmd = {
					adapter = "bothub",
				},
			},
			adapters = {
				http = {
					opts = {
						show_model_choices = true,
					},
					bothub = function()
						return require("codecompanion.adapters").extend("openai_compatible", {
							env = {
								url = "https://bothub.chat/api/v2/openai/v1",
								chat_url = "/chat/completions",
								api_key = vim.env.BOTHUB_API_KEY,
								models_endpoint = "/models",
							},
							schema = {
								model = {
									default = "qwen-2.5-coder-32b-instruct:free",
									choices = bothub_models,
								},
							},
						})
					end,
				},
			},
		})
	end,
}

local minuet = {

	"milanglacier/minuet-ai.nvim",
	dependencies = { "nvim-lua/plenary.nvim" },
	config = function()
		local lua_prompt = [[ 
        You are an expert Lua programmer. Provide concise, idiomatic Lua code completions. Focus on:
        - Modern Lua practices and patterns
        - Performance optimizations
        - Clear type annotations when helpful
        - Proper error handling
      ]]
		local python_prompt = [[
        You are an expert Python programmer. Provide concise, Pythonic code completions. Focus on:
        - PEP 8 compliance
        - Type hints for clarity
        - Modern Python features (3.8+)
        - Efficient algorithms and data structures
      ]]
		local ts_prompt = [[
        You are an expert TypeScript/JavaScript developer. Provide concise, modern code completions. Focus on:
        - TypeScript type safety
        - ES6+ features
        - Functional programming patterns
        - React/Vue/Node.js best practices when applicable
      ]]
		local common_prompt = [[
        You are an expert programmer. Provide concise, idiomatic code completions for the current language. Focus on:
        - Language-specific best practices
        - Performance considerations
        - Clear and maintainable code
        - Proper error handling
      ]]
		require("minuet").setup({
			request_timeout = 0,
			throttle = 5000,
			debounce = 1000,
			virtualtext = {
				auto_trigger_ft = { "*" },
				auto_trigger_ignore_ft = {},
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
			provider = "openai_compatible",
			n_completions = 1,
			context_window = 4000,
			provider_options = {
				openai_compatible = {
					api_key = function()
						return vim.env.BOTHUB_API_KEY
					end,
					name = "Bothub",
					end_point = "https://bothub.chat/api/v2/openai/v1/chat/completions",
					model = "qwen-2.5-coder-32b-instruct:free",
					system = {
						prompt = function()
							local ft = vim.bo.ft
							if ft == "lua" then
								return lua_prompt
							elseif ft == "python" then
								return python_prompt
							elseif ft == "typescript" or ft == "javascript" then
								return ts_prompt
							else
								return common_prompt
							end
						end,
					},
					optional = {
						generationConfig = {
							temperature = 0.1,
							topP = 0.9,
						},
					},
				},
			},
		})
	end,
}

return {
	minuet,
	codecompanion,
}
