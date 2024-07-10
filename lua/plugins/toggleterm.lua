return {
	"akinsho/toggleterm.nvim",
	version = "*",
	opts = {
		-- direction
		direction = "float",

		-- auto show/hide
		open_mapping = [[<leader>ft]],

		highlight = {
			FloatBorder = {
				guifg = "#000000",
				guibg = "#000000",
			},
		},

		-- floating setting
		float_opts = {
			border = "rounded",
			winblend = 0,
			highlights = {
				border = "double",
				background = "Normal",
			},
		},

		-- experimental feature
		winbar = {
			enabled = true,
			name_formatter = function(term) --  term: Terminal
				return term.count
			end,
		},
	},
	config = function(_, opts)
		require("toggleterm").setup(opts)
	end,
}
