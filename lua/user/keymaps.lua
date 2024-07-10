--  See `:help wincmd` for a list of all window commands
vim.keymap.set("n", "<C-h>", "<C-w>h>", { desc = "Move focus to the left window" })
vim.keymap.set("n", "<C-l>", "<C-w>l>", { desc = "Move focus to the right window" })
vim.keymap.set("n", "<C-j>", "<C-w>j>", { desc = "Move focus to the lower window" })
vim.keymap.set("n", "<C-k>", "<C-w>k>", { desc = "Move focus to the upper window" })

-- NOTE: LSP -- Keymap
vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float, { desc = "open diagnostic in float window" })

--[[ vim.keymap.set("n", "<Esc>", function()
	require("oil").close()
end, {}) ]]

--  See `:help wincmd` for a list of all window commands
-- vim.keymap.set("n", ";", "<C-w>", { desc = "Remap [<C-w>] - ;" })

vim.keymap.set("n", "<leader>'", "<C-^>", { desc = "Switch to last buffer" })

-- Quit with leader key
vim.keymap.set("n", "<leader>q", "<cmd>q<cr>", { silent = false })

-- Press 'H', 'L' to jump to start/end of a line (first/last char)
vim.keymap.set("n", "L", "$", { desc = "Remap [$] with [L] - Go To Beginning Of The Line" })
vim.keymap.set("n", "H", "^", { desc = "Remap [^] with [H] - Go To End Of The Line" })

-- Open Copilot panel
vim.keymap.set("n", "<leader>oc", function()
	require("copilot.panel").open({})
end, { desc = "[O]pen [C]opilot panel" })
--
-- NOTE: Map - Cut,Copy,Paste etc to different register
vim.keymap.set("n", "x", '"ax', { desc = "Store To a register" })
vim.keymap.set("n", "d", '"ad', { desc = "Store To a register" })
vim.keymap.set("n", "dd", '"add', { desc = "Store To a register" })
vim.keymap.set("n", "c", '"ac', { desc = "Store To a register" })
vim.keymap.set("n", "D", '"aD', { desc = "Store To a register" })
vim.keymap.set("n", "C", '"aC', { desc = "Store To a register" })
vim.keymap.set("v", "d", '"ad', { desc = "Store To a register" })
vim.keymap.set("v", "c", '"ac', { desc = "Store To a register" })
-- Insert --
-- Map jj to <esc>
vim.keymap.set("i", "jj", "<esc>")

vim.diagnostic.config({
	float = {
		border = "rounded",
	},
})
-- Goto next diagnostic of any severity
vim.keymap.set("n", "]d", function()
	vim.diagnostic.goto_next({})
	vim.api.nvim_feedkeys("zz", "n", false)
end, { desc = "Go To Next [D]iagnostic Of Any Severity" })

-- Goto previous diagnostic of any severity
vim.keymap.set("n", "[d", function()
	vim.diagnostic.goto_prev({})
	vim.api.nvim_feedkeys("zz", "n", false)
end, { desc = "Go To Previous [D]iagnostic Of Any Severity" })

-- Goto next error diagnostic
vim.keymap.set("n", "]e", function()
	vim.diagnostic.goto_next({ severity = vim.diagnostic.severity.ERROR })
	vim.api.nvim_feedkeys("zz", "n", false)
end, { desc = "Go To Next [E]rror [D]iagnostic" })

-- Goto previous error diagnostic
vim.keymap.set("n", "[e", function()
	vim.diagnostic.goto_prev({ severity = vim.diagnostic.severity.ERROR })
	vim.api.nvim_feedkeys("zz", "n", false)
end, { desc = "Go To Previous [E]rror Diagnostic" })

-- Goto next warning diagnostic
vim.keymap.set("n", "]w", function()
	vim.diagnostic.goto_next({ severity = vim.diagnostic.severity.WARN })
	vim.api.nvim_feedkeys("zz", "n", false)
end, { desc = "Go To Next [W]arning [D]iagnostic" })

-- Goto previous warning diagnostic
vim.keymap.set("n", "[w", function()
	vim.diagnostic.goto_prev({ severity = vim.diagnostic.severity.WARN })
	vim.api.nvim_feedkeys("zz", "n", false)
end, { desc = "Go To Previous [W]arning [D]iagnostic" })

-- NOTE: undotree.nvim -- keymap
vim.keymap.set("n", "<leader>u", "<cmd>UndotreeToggle<CR>", { desc = "Toggle [U]ndotree" })

-- NOTE: Harpoon -- Keymap
local harpoon = require("harpoon.ui")

-- ToggleMenu
vim.keymap.set("n", "<leader>ho", function()
	harpoon.toggle_quick_menu()
end, { desc = "Harpoon Toggle Quick Menu" })

-- Add Mark
vim.keymap.set("n", "<leader>ha", function()
	local bufnr = vim.fn.expand("%:t")
	vim.notify("Add Mark To Harpoon: " .. bufnr)
	require("harpoon.mark").add_file()
end, { desc = "[H]arpoon [A]dd File" })

-- Navigate Next Mark
vim.keymap.set("n", "<leader>hn", function()
	harpoon.nav_next()
end, { desc = "[H]arpoon Navigate To [N]ext Mark" })

-- Navigate Previous Mark
vim.keymap.set("n", "<leader>hp", function()
	harpoon.nav_prev()
end, { desc = "[H]arpoon Navigate To [P]revious Mark" })

-- NOTE: Telescope keymap -- START
-- See `:help telescope.builtin`
local builtin = require("telescope.builtin")

local buffer_no_preview = function()
	builtin.buffers(require("user.config.telescope_config").theme_no_preview())
end

vim.keymap.set("n", "<leader>sh", builtin.help_tags, { desc = "Telescope - Telescope - [S]earch [H]elp" })
vim.keymap.set("n", "<leader>sk", builtin.keymaps, { desc = "Telescope - [S]earch [K]eymaps" })
vim.keymap.set("n", "<leader>sb", buffer_no_preview, { desc = "Telescope - [S]earch [B]uffers" })
vim.keymap.set("n", "<leader>sf", builtin.find_files, { desc = "Telescope - [S]earch [F]iles" })
vim.keymap.set("n", "<leader>ss", builtin.builtin, { desc = "Telescope - [S]earch [S]elect Telescope" })
vim.keymap.set("n", "<leader>sw", builtin.grep_string, { desc = "[S]earch current [W]ord" })
vim.keymap.set("n", "<leader>sg", builtin.live_grep, { desc = "Telescope - [S]earch by [G]rep" })
vim.keymap.set("n", "<leader>sd", builtin.diagnostics, { desc = "[S]earch [D]iagnostics" })
vim.keymap.set("n", "<leader>sr", builtin.resume, { desc = "Telescope - [S]earch [R]esume" })
vim.keymap.set("n", "<leader>s.", builtin.oldfiles, { desc = 'Telescope - [S]earch Recent Files ("." for repeat)' })
vim.keymap.set("n", "<leader><leader>", builtin.buffers, { desc = "Telescope - [ ] Find existing buffers" })

-- Telescope Harpoon
vim.keymap.set(
	"n",
	"<leader>sm",
	"<cmd>Telescope harpoon marks<CR>",
	{ desc = "Telescope - [S]earch Harpoon [M]arks In Telesope" }
)
vim.keymap.set("n", "<leader>sp", "<cmd>Telescope noice<CR>", { desc = "[S]earch Noice [P]opups" })

-- Slightly advanced example of overriding default behavior and theme
vim.keymap.set("n", "<leader>/", function()
	-- You can pass additional configuration to telescope to change theme, layout, etc.
	builtin.current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
		winblend = 10,
		previewer = false,
	}))
end, { desc = "[/] Fuzzily search in current buffer" })

-- Also possible to pass additional configuration options.
--  See `:help telescope.builtin.live_grep()` for information about particular keys
vim.keymap.set("n", "<leader>s/", function()
	builtin.live_grep({
		grep_open_files = true,
		prompt_title = "Live Grep in Open Files",
	})
end, { desc = "[S]earch [/] in Open Files" })

-- Shortcut for searching your neovim configuration files
vim.keymap.set("n", "<leader>sn", function()
	builtin.find_files({ cwd = vim.fn.stdpath("config") })
end, { desc = "[S]earch [N]eovim files" })

-- NOTE: LSP -- Keymap
vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("kickstart-lsp-attach", { clear = true }),
	callback = function(event)
		-- In this case, we create a function that lets us more easily define mappings specific
		-- for LSP related items. It sets the mode, buffer and description for us each time.
		local map = function(keys, func, desc)
			vim.keymap.set("n", keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
		end

		-- Jump to the definition of the word under your cursor.
		--  This is where a variable was first declared, or where a function is defined, etc.
		--  To jump back, press <C-t>.
		map("gd", require("telescope.builtin").lsp_definitions, "[G]oto [D]efinition")

		-- Find references for the word under your cursor.
		map("gr", require("telescope.builtin").lsp_references, "[G]oto [R]eferences")

		-- Jump to the implementation of the word under your cursor.
		--  Useful when your language has ways of declaring types without an actual implementation.
		map("gI", require("telescope.builtin").lsp_implementations, "[G]oto [I]mplementation")

		-- Jump to the type of the word under your cursor.
		--  Useful when you're not sure what type a variable is and you want to see
		--  the definition of its *type*, not where it was *defined*.
		map("<leader>D", require("telescope.builtin").lsp_type_definitions, "Type [D]efinition")

		-- Fuzzy find all the symbols in your current document.
		--  Symbols are things like variables, functions, types, etc.
		map("<leader>ds", require("telescope.builtin").lsp_document_symbols, "[D]ocument [S]ymbols")

		-- Fuzzy find all the symbols in your current workspace
		--  Similar to document symbols, except searches over your whole project.
		map("<leader>ws", require("telescope.builtin").lsp_dynamic_workspace_symbols, "[W]orkspace [S]ymbols")

		-- Rename the variable under your cursor
		--  Most Language Servers support renaming across files, etc.
		map("<leader>rn", vim.lsp.buf.rename, "[R]e[n]ame")

		-- Execute a code action, usually your cursor needs to be on top of an error
		-- or a suggestion from your LSP for this to activate.
		map("<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction")

		-- Opens a popup that displays documentation about the word under your cursor
		--  See `:help K` for why this keymap
		map("K", vim.lsp.buf.hover, "Hover Documentation")

		-- WARN: This is not Goto Definition, this is Goto Declaration.
		--  For example, in C this would take you to the header
		map("gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")

		-- The following two autocommands are used to highlight references of the
		-- word under your cursor when your cursor rests there for a little while.
		--    See `:help CursorHold` for information about when this is executed
		--
		-- When you move your cursor, the highlights will be cleared (the second autocommand).
		local client = vim.lsp.get_client_by_id(event.data.client_id)
		if client and client.server_capabilities.documentHighlightProvider then
			vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
				buffer = event.buf,
				callback = vim.lsp.buf.document_highlight,
			})

			vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
				buffer = event.buf,
				callback = vim.lsp.buf.clear_references,
			})
		end
	end,
})

-- NOTE: UFO -- Keymap
vim.o.foldcolumn = "1" -- '0' is not bad
vim.o.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
vim.o.foldlevelstart = 99
vim.o.foldenable = true

local ufo = require("ufo")

vim.keymap.set("n", "zR", ufo.openAllFolds, { desc = "UFO - Open All Folds" })
vim.keymap.set("n", "zM", ufo.closeAllFolds, { desc = "UFO - ClosE All Folds" })
vim.keymap.set("n", "zr", ufo.openFoldsExceptKinds, { desc = "UFO - Open Folds Except Kinds " })
vim.keymap.set("n", "zm", ufo.closeFoldsWith, { desc = "UFO - Close Folds With" }) -- closeAllFolds == closeFoldsWith(0)

vim.keymap.set("n", "zK", function()
	local winid = ufo.peekFoldedLinesUnderCursor()
	if not winid then
		-- choose one of coc.nvim and nvim lsp
		--vim.fn.CocActionAsync('definitionHover') -- coc.nvim
		vim.lsp.buf.hover()
	end
end)

-- NOTE: rest.nvim -- keymap
vim.keymap.set("n", "<leader>rr", "<Plug>RestNvim", { desc = "RestNvim - Run Api Under Cursor" })
vim.keymap.set("n", "<leader>rp", "<Plug>RestNvimPreview", { desc = "RestNvim - Preview Api Under Cursor" })
vim.keymap.set("n", "<leader>rl", "<Plug>RestNvimLast", { desc = "RestNvim - Run Last Api " })

--NOTE: trouble.nvim -- keymap
vim.keymap.set("n", "<leader>xx", function()
	require("trouble").toggle()
end, { desc = "Trouble - Toggle" })

vim.keymap.set("n", "<leader>xw", function()
	require("trouble").toggle("workspace_diagnostics")
end, { desc = "Trouble - Toggle Workspace [D]iagnostics" })

vim.keymap.set("n", "<leader>xd", function()
	require("trouble").toggle("document_diagnostics")
end, { desc = "Trouble - Toggle Document Diagnostics" })

vim.keymap.set("n", "<leader>xq", function()
	require("trouble").toggle("quickfix")
end, { desc = "Trouble - Quickfix" })

vim.keymap.set("n", "<leader>xl", function()
	require("trouble").toggle("loclist")
end, { desc = "Trouble - Loclist" })

vim.keymap.set("n", "<leader>xR", function()
	require("trouble").toggle("lsp_references")
end, { desc = "Trouble - LSP References" })

-- NOTE: oil.nvim -- keymap
vim.keymap.set("n", "<leader>e", function()
	require("oil").toggle_float()
end, { desc = "Toggle Oil" })

-- NOTE: goto_preview -- keymaps
vim.keymap.set("n", "<leader>gpd", function()
	require("goto-preview").goto_preview_type_definition({})
end, { desc = "Open Defination (Floating Window) " })

vim.keymap.set("n", "<leader>gpt", function()
	require("goto-preview").goto_preview_type_definition({})
end, { desc = "Open Type Defination (Floating Window)" })

vim.keymap.set("n", "<leader>gpi", function()
	require("goto-preview").goto_preview_implementation({})
end, { desc = "Open Implementation (Floating Window)" })

vim.keymap.set("n", "<leader>gpD", function()
	require("goto-preview").goto_preview_declaration({})
end, { desc = "Open Declaration (Floating Window)" })

vim.keymap.set("n", "<leader>gP ", function()
	require("goto-preview").close_all_win({})
end, { desc = "close all <goto> (Floating Window)" })

vim.keymap.set("n", "<leader>gpr", function()
	require("goto-preview").goto_preview_references({})
end, { desc = "Open Reference (Floating Window)" })

vim.keymap.set("n", "<Esc>", function()
	require("goto-preview").close_all_win()
end, {})
