return {
	{
		"goolord/alpha-nvim",
		config = function()
			require("alpha").setup(require("alpha.themes.dashboard").config)
		end,
	},
	-- {
	-- 	"nvimdev/dashboard-nvim",
	-- 	event = "VimEnter",
	-- 	config = function()
	-- 		local dash = require("dashboard")
	--
	-- 		local logo = [[
	--
	--
	--        ███████╗██╗   ██╗███████╗██████╗      █████╗ ███╗   ███╗███╗   ███╗ █████╗ ██████╗
	--        ██╔════╝╚██╗ ██╔╝██╔════╝██╔══██╗    ██╔══██╗████╗ ████║████╗ ████║██╔══██╗██╔══██╗
	--        ███████╗ ╚████╔╝ █████╗  ██║  ██║    ███████║██╔████╔██║██╔████╔██║███████║██║  ██║
	--        ╚════██║  ╚██╔╝  ██╔══╝  ██║  ██║    ██╔══██║██║╚██╔╝██║██║╚██╔╝██║██╔══██║██║  ██║
	--        ███████║   ██║   ███████╗██████╔╝    ██║  ██║██║ ╚═╝ ██║██║ ╚═╝ ██║██║  ██║██████╔╝
	--        ╚══════╝   ╚═╝   ╚══════╝╚═════╝     ╚═╝  ╚═╝╚═╝     ╚═╝╚═╝     ╚═╝╚═╝  ╚═╝╚═════╝
	--
	--    ]]
	-- 		logo = string.rep("\n", 2) .. logo .. ""
	-- 		dash.setup({
	-- 			theme = "hyper",
	-- 			config = {
	-- 				change_to_vcs_root = true,
	-- 				header = vim.split(logo, "\n"),
	-- 				week_header = {
	-- 					enable = false,
	-- 					concat = "my_terrace",
	-- 					--            append = vim.split(logo, "\n"),
	-- 				},
	-- 				hide = {
	-- 					statusline = false, -- hide statusline default is true
	-- 					tabline = false, -- hide statusline default is true   -- hide the tabline
	-- 					winbar = false, -- hide statusline default is true       -- hide winbar
	-- 				},
	-- 				shortcut = {
	-- 					{ desc = "󰊳 Update", group = "@property", action = "Lazy update", key = "u" },
	-- 					{
	-- 						icon = " ",
	-- 						icon_hl = "@variable",
	-- 						desc = "Files",
	-- 						group = "Label",
	-- 						action = "Telescope find_files",
	-- 						key = "f",
	-- 					},
	-- 					{
	-- 						desc = " Apps",
	-- 						group = "DiagnosticHint",
	-- 						action = "Telescope app",
	-- 						key = "a",
	-- 					},
	-- 					{
	-- 						desc = " dotfiles",
	-- 						group = "Number",
	-- 						action = "Telescope dotfiles",
	-- 						key = "d",
	-- 					},
	-- 				},
	-- 			},
	-- 		})
	-- 	end,
	-- 	dependencies = { { "nvim-tree/nvim-web-devicons" } },
	-- },
}
