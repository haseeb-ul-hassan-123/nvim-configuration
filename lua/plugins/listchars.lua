return {

	"fraso-dev/nvim-listchars",
	config = function()
		require("nvim-listchars").setup({
			save_state = true,
			listchars = {
				trail = "-",
				eol = "↲",
				tab = "⋙ ",
			},
			lighten_step = 10,
			exclude_filetypes = {},
			notifications = false,
		})
	end,
}
