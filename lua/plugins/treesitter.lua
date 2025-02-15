return { -- Highlight, edit, and navigate code
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	opts = {
		--:NOTE: noice.nvim recommended : `vim`, `regex`, `lua`, `bash`, `markdown` and `markdown_inline`
		ensure_installed = {
			"regex",
			"vim",
			"http",
			"json",
			"javascript",
			"typescript",
			"css",
			"gitignore",
			"go",
			"graphql",
			"http",
			"scss",
			"bash",
			"dockerfile",
			"lua",
			"json",
			"luadoc",
			"jsdoc",
			"dockerfile",
			"yaml",
			"javascript",
			"regex",
			"markdown",
			"markdown_inline",
			"xml",
		},
		auto_install = true,
		highlight = { enable = true },
		indent = { enable = true },
	},
	config = function(_, opts)
		-- [[ Configure Treesitter ]] See `:help nvim-treesitter`

		---@diagnostic disable-next-line: missing-fields
		require("nvim-treesitter.configs").setup(opts)

		-- There are additional nvim-treesitter modules that you can use to interact
		-- with nvim-treesitter. You should go explore a few and see what interests you:
		--
		--    - Incremental selection: Included, see `:help nvim-treesitter-incremental-selection-mod`
		--    - Show your current context: https://github.com/nvim-treesitter/nvim-treesitter-context
		--    - Treesitter + textobjects: https://github.com/nvim-treesitter/nvim-treesitter-textobjects
	end,
}
