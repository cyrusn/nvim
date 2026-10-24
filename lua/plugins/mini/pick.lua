require("mini.pick").setup({
	mappings = {
		refine = "<C-y>",
		refine_marked = "<C-q>",
	},
	window = {
		config = {
			border = "double",
			anchor = "NW",
			width = math.floor(vim.o.columns * 0.6),
			height = math.floor(vim.o.lines * 0.4),
			col = math.floor(vim.o.columns * 0.2),
			row = math.floor(vim.o.lines * 0.3),
		},
		prompt = "❯ ",
	},
})

local function pickers()
	local names = vim.tbl_keys(MiniPick.registry)
	table.sort(names)
	MiniPick.start({
		source = {
			items = names,
			name = "Pickers",
			choose = function(name)
				local picker = MiniPick.registry[name]
				if picker then
					vim.schedule(picker)
				end
			end,
		},
	})
end

MiniPick.registry.pickers = pickers

vim.keymap.set("n", "<leader>,", MiniPick.builtin.buffers, { desc = "Buffers" })
vim.keymap.set("n", "<leader>/", MiniPick.builtin.grep_live, { desc = "Grep" })
vim.keymap.set("n", "<leader>p", MiniPick.registry.pickers, { desc = "Pickers" })
vim.keymap.set("n", "<leader><tab>", MiniPick.builtin.resume, { desc = "Pickers Resume" })
vim.keymap.set("n", "<leader><space>", MiniPick.builtin.files, { desc = "Find Files" })
vim.keymap.set("n", "<leader>fd", function() MiniExtra.pickers.git_files({ scope = "modified" }) end, { desc = "Git Status Files" })

vim.keymap.set("n", "<leader>s/w", function()
	local pattern = vim.fn.expand("<cword>")
	if pattern ~= "" then
		MiniPick.builtin.grep({ pattern = pattern })
	end
end, { desc = "Grep Word" })

vim.keymap.set("n", "<leader>shn", function()
	require("mini.notify").show_history()
end, { desc = "Notification History" })
vim.keymap.set("n", "<leader>sH", MiniPick.builtin.help, { desc = "Help" })
vim.keymap.set("n", "<leader>ci", vim.lsp.buf.incoming_calls, { desc = "Calls Incoming" })
vim.keymap.set("n", "<leader>co", vim.lsp.buf.outgoing_calls, { desc = "Calls Outgoing" })
