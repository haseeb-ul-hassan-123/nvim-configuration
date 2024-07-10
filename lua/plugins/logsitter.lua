return {
	"gaelph/logsitter.nvim",
	dependencies = { "nvim-treesitter/nvim-treesitter" },
	opts = {
		-- Format for the file name.
		-- Available values:
		-- - "default":  path to file relative to the current working directory
		-- - "short":    shortened path (with the builtin `pathshorten()` function)
		-- - "fileonly": only display the file name
		path_format = "default",
		-- The prefix for the log message. Can be an emoji like "🚀"
		prefix = "🚀 ~",
		-- The separator between the file path and the displayed value
		separator = "~",
	},
}
