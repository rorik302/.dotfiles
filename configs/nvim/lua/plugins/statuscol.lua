return {
	"luukvbaal/statuscol.nvim",
	config = function()
		local builtin = require("statuscol.builtin")

		require("statuscol").setup({
			segments = {
				{
					sign = { name = { ".*" }, text = { ".*" } },
					click = "v:lua.ScSa",
				},
				{
					text = { builtin.lnumfunc },
					condition = { true, builtin.not_empty },
					click = "v:lua.ScLa",
				},
				{
					sign = { namespace = { "gitsigns" }, colwidth = 1, wrap = true },
					click = "v:lua.ScSa",
				},
				{
					text = {
						function(args)
							args.fold.close = ""
							args.fold.open = ""
							return builtin.foldfunc(args)
						end,
					},
					click = "v:lua.ScFa",
				},
			},
		})
	end,
}
