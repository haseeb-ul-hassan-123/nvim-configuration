-- Auto Save When Leave insert mode or Text Change
vim.api.nvim_create_autocmd({ "InsertLeave", "TextChanged", "BufLeave" }, {
	desc = "Auto Save When Leave insert mode or Text Change",
	group = vim.api.nvim_create_augroup("AutoSave", { clear = true }),
	callback = function()
		pcall(vim.cmd.w)
	end,
})

-- LogSitter Plugin Inspired By Turbo Console
vim.api.nvim_create_augroup("LogSitter", { clear = true })
vim.api.nvim_create_autocmd("FileType", {
	group = "LogSitter",
	pattern = "javascript,typescript,go,lua",
	callback = function()
		vim.keymap.set("n", "<leader>lg", function()
			require("logsitter").log()
		end, { desc = "logsitter - log under cursor value" })

		-- experimental visual mode
		vim.keymap.set("x", "<leader>lg", function()
			require("logsitter").log_visual()
		end, { desc = "logsitter - log under cursor value" })
	end,
})

--[[ -- Show Noice Popup When Start Recording
vim.api.nvim_create_autocmd("RecordingEnter", {
	desc = "Show Noice Popup When Recording",
	group = vim.api.nvim_create_augroup("Recording-Start", { clear = true }),
	callback = function()
		print("Macro - Recording Start")
	end,
})
]]
--[[
-- Show Noice Popup When Leaving Recording
vim.api.nvim_create_autocmd("RecordingLeave", {
	desc = "Show Noice Popup When Leaving Recording",
	group = vim.api.nvim_create_augroup("Recording-End", { clear = true }),
	callback = function()
		print("Macro - Recording End")
	end,
})  ]]
