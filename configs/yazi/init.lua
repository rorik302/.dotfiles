require("projects"):setup({
	save = {
		method = "lua",
	},
	last = {
		load_after_start = true,
	},
})

th.git = th.git or {}
th.git.added_sign = "A"
th.git.modified_sign = "M"
th.git.modified = ui.Style():fg("#ffcc66")
th.git.deleted_sign = "D"
th.git.ignored_sign = "I"
th.git.untracked_sign = "N"
th.git.untracked = ui.Style():fg("#87d96c")
th.git.updated_sign = "U"
require("git"):setup()

require("full-border"):setup()

require("searchjump"):setup({
	unmatch_fg = "#b2a496",
	match_str_fg = "#000000",
	match_str_bg = "#ffcc66",
	first_match_str_fg = "#000000",
	first_match_str_bg = "#73ac3a",
	label_fg = "#000000",
	label_bg = "#ff6666",
})

require("fs-usage"):setup()

require("yatline"):setup({
	show_background = false,

	style_a = {
		fg = "black",
		bg_mode = {
			normal = "#73d0ff",
			select = "brightyellow",
			un_set = "brightred",
		},
	},
	style_b = {
		fg = "black",
		bg = "white",
	},

	header_line = {
		left = {
			section_a = {
				{ type = "line", custom = false, name = "tabs", params = { "left" } },
			},
			section_b = {},
			section_c = {},
		},
		right = {
			section_a = {
				{ type = "string", custom = false, name = "date", params = { "%A, %d %B %Y" } },
			},
			section_b = {
				{ type = "string", custom = false, name = "date", params = { "%X" } },
			},
			section_c = {},
		},
	},

	status_line = {
		left = {
			section_a = {
				{ type = "string", custom = false, name = "tab_mode" },
			},
			section_b = {
				{ type = "string", custom = false, name = "hovered_size" },
			},
			section_c = {
				{ type = "string", custom = false, name = "hovered_path" },
				{ type = "coloreds", custom = false, name = "count" },
			},
		},
		right = {
			section_a = {
				{ type = "string", custom = false, name = "cursor_position" },
			},
			section_b = {
				{ type = "string", custom = false, name = "cursor_percentage" },
			},
			section_c = {
				{ type = "string", custom = false, name = "hovered_file_extension", params = { true } },
				{ type = "coloreds", custom = false, name = "permissions" },
			},
		},
	},
})
