return {
	{
		"hrsh7th/cmp-nvim-lsp",
	},
	{
		"L3MON4D3/LuaSnip",
		dependencies = {
			"saadparwaiz1/cmp_luasnip",
			"rafamadriz/friendly-snippets",
		},
	},
	{
		"hrsh7th/nvim-cmp",
		dependencies = {
			"neovim/nvim-lspconfig",
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-cmdline",
			"hrsh7th/nvim-cmp",
			"onsails/lspkind.nvim",
			"luckasRanarison/tailwind-tools.nvim",
		},
		config = function()
			require("luasnip.loaders.from_vscode").lazy_load()

			local lspkind = require("lspkind")
			local cmp = require("cmp")

			cmp.setup({

				snippet = {
					expand = function(args)
						require("luasnip").lsp_expand(args.body)
					end,
				},
				formatting = {
					format = lspkind.cmp_format({
						-- options: 'text', 'text_symbol', 'symbol_text', 'symbol'
						mode = "text_symbol",
						menu = {
							buffer = "[Buffer]",
							nvim_lsp = "[LSP]",
							luasnip = "[LuaSnip]",
							nvim_lua = "[Lua]",
							latex_symbols = "[Latex]",
							path = "[Path]",
						},
						before = require("tailwind-tools.cmp").lspkind_format,
					}),
				},

				window = {
					completion = cmp.config.window.bordered(),
					documentation = cmp.config.window.bordered(),
				},

				mapping = cmp.mapping.preset.insert({
					--  ["<C-b>"] = cmp.mapping.scroll_docs(-4),
					["<C-n>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
					["<C-p>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
					["<C-f>"] = cmp.mapping.scroll_docs(4),
					["<C-Space>"] = cmp.mapping.complete(),
					["<C-e>"] = cmp.mapping.abort(),
					["<C-y>"] = cmp.mapping.confirm({ select = true }),
					-- ["<tab>"] = false,
					["<tab>"] = cmp.config.disable,
				}),

				sources = cmp.config.sources({
					{ name = "cody" },
					{ name = "nvim_lua" },
					{ name = "nvim_lsp" },
					{ name = "luasnip" },
					{ name = "copilot" },
					{ name = "eruby" },
				}, {
					{ name = "path" },
					{ name = "buffer", keyword_length = 5 },
				}, {
					{ name = "gh_issues" },
				}),

				experimental = {
					-- I like the new menu better! Nice work hrsh7th
					native_menu = false,

					-- Let's play with this for a day or two
					ghost_text = true,
				},
			})

			cmp.setup.cmdline("/", {
				view = {
					entries = { name = "wildmenu", separator = "|" },
				},
			})
		end,
	},
}
