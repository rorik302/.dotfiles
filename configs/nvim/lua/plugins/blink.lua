return {
	"Saghen/blink.cmp",
	version = "1.*",
	opts = {
		cmdline = {
			keymap = { preset = "enter" },
			completion = {
				list = {
					selection = { preselect = false, auto_insert = false },
				},
				menu = {
					auto_show = true,
				},
			},
		},
		completion = {
			documentation = {
				auto_show = true,
				auto_show_delay_ms = 1000,
			},
			ghost_text = {
				enabled = true,
			},
			list = {
				selection = { preselect = false, auto_insert = false },
			},
			menu = {
				draw = {
					columns = {
						{ "label", "label_description", gap = 1 },
						{ "kind_icon", "kind", gap = 1 },
						{ "source" },
					},
					components = {
						label = {
							text = function(ctx)
								return require("colorful-menu").blink_components_text(ctx)
							end,
							highlight = function(ctx)
								return require("colorful-menu").blink_components_highlight(ctx)
							end,
						},
						source = {
							text = function(ctx)
								return "[" .. ctx.source_name .. "]"
							end,
						},
					},
				},
			},
		},
		keymap = { preset = "enter" },
		signature = {
			enabled = true,
			trigger = {
				show_on_keyword = true,
			},
		},
		sources = {
			providers = {
				lazydev = { name = "LazyDev", module = "lazydev.integrations.blink", score_offset = 100 },
			},
			default = { "lsp", "path", "buffer" },
			per_filetype = {
				lua = { inherit_defaults = true, "lazydev" },
			},
		},
	},
}
