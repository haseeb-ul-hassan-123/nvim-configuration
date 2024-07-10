return {
	{
		"kevinhwang91/nvim-ufo",
		event = "BufEnter",
		dependencies = {
			"kevinhwang91/promise-async",
		},
		config = function()
			local ufo = require("ufo")
			ufo.setup({})

		end,
	},
}
