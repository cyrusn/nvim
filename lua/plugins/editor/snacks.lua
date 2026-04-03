vim.keymap.set("n", "<leader>e", "<cmd>lua Snacks.explorer()<cr>", { desc = "File Tree" })
vim.keymap.set("n", "<leader><space>", "<cmd>lua Snacks.picker.smart()<cr>", { desc = "Smart Search" })
vim.keymap.set("n", "<leader>,", "<cmd>lua Snacks.picker.buffers()<cr>", { desc = "Buffers" })
vim.keymap.set("n", "<leader>/", "<cmd>lua Snacks.picker.grep()<cr>", { desc = "Grep" })

vim.keymap.set("n", "<leader>bd", "<cmd>lua Snacks.bufdelete.delete()<cr>", { desc = "Close Current Buffer" })
vim.keymap.set("n", "<leader>bo", "<cmd>lua Snacks.bufdelete.other()<cr>", { desc = "Close Other Buffers" })

vim.keymap.set("n", "<leader>gg", "<cmd>lua Snacks.lazygit()<cr>", { desc = "Lazygit" })

vim.keymap.set("n", "<leader>ut", "<cmd>lua Snacks.terminal()<cr>", { desc = "Terminal" })

vim.keymap.set(
	"n",
	"<leader>fc",
	"<cmd>lua Snacks.picker.files({cwd=vim.fn.stdpath('config')})<cr>",
	{ desc = "Find Config File" }
)
vim.keymap.set("n", "<leader>ff", "<cmd>lua Snacks.picker.files()<cr>", { desc = "Find Files" })
vim.keymap.set("n", "<leader>fd", "<cmd>lua Snacks.picker.git_status()<cr>", { desc = "Git " })
vim.keymap.set("n", "<leader>fg", "<cmd>lua Snacks.picker.git_files()<cr>", { desc = "Find Git Files" })
vim.keymap.set("n", "<leader>fp", "<cmd>lua Snacks.picker.projects()<cr>", { desc = "Projects" })
vim.keymap.set("n", "<leader>fr", "<cmd>lua Snacks.picker.recent()<cr>", { desc = "Recent" })

vim.keymap.set("n", "<leader>sb", "<cmd>lua Snacks.picker.grep_buffers()<cr>", { desc = "Grep Open Buffers" })
vim.keymap.set("n", "<leader>sd", "<cmd>lua Snacks.picker.git_diff()<cr>", { desc = "Git Diffs" })
vim.keymap.set("n", "<leader>sc", "<cmd>lua Snacks.picker.command_history()<cr>", { desc = "Command History" })
vim.keymap.set("n", "<leader>sC", "<cmd>lua Snacks.picker.commands()<cr>", { desc = "Commands" })
vim.keymap.set("n", "<leader>sh", "<cmd>lua Snacks.picker.help()<cr>", { desc = "Help" })
vim.keymap.set("n", "<leader>sH", "<cmd>lua Snacks.picker.highlights()<cr>", { desc = "Highlights" })
vim.keymap.set("n", "<leader>si", "<cmd>lua Snacks.picker.icons()<cr>", { desc = "Icons" })
vim.keymap.set("n", "<leader>sj", "<cmd>lua Snacks.picker.jumps()<cr>", { desc = "Jumps" })
vim.keymap.set("n", "<leader>sk", "<cmd>lua Snacks.picker.keymaps()<cr>", { desc = "Keymaps" })
vim.keymap.set("n", "<leader>sl", "<cmd>lua Snacks.picker.lines()<cr>", { desc = "Lines" })
vim.keymap.set("n", "<leader>sm", "<cmd>lua Snacks.picker.marks()<cr>", { desc = "Marks" })
vim.keymap.set("n", "<leader>sM", "<cmd>lua Snacks.picker.man()<cr>", { desc = "Man Pages" })
vim.keymap.set("n", "<leader>sn", "<cmd>lua Snacks.picker.notifications()<cr>", { desc = "Show Notifier History" })
vim.keymap.set("n", "<leader>sp", "<cmd>lua Snacks.picker.pickers()<cr>", { desc = "Pickers" })
vim.keymap.set("n", "<leader>sP", "<cmd>lua Snacks.picker.lazy()<cr>", { desc = "Search for Plugin Spec" })
vim.keymap.set("n", "<leader>sq", "<cmd>lua Snacks.picker.qflist()<cr>", { desc = "Quickfix" })
vim.keymap.set("n", "<leader>sr", "<cmd>lua Snacks.picker.registers()<cr>", { desc = "Register" })
vim.keymap.set("n", "<leader>su", "<cmd>lua Snacks.picker.undo()<cr>", { desc = "Undo History" })
vim.keymap.set("n", "<leader>sw", "<cmd>lua Snacks.picker.grep_word()<cr>", { desc = "Grep Word" })
vim.keymap.set("n", "<leader>s<space>", "<cmd>lua Snacks.picker.resume()<cr>", { desc = "Resume" })

vim.keymap.set("n", "<leader>cr", "<cmd>lua Snacks.picker.lsp_references()<cr>", { desc = "References" })
vim.keymap.set("n", "<leader>cd", "<cmd>lua Snacks.picker.lsp_definitions()<cr>", { desc = "Definintions" })
vim.keymap.set("n", "<leader>cD", "<cmd>lua Snacks.picker.lsp_declarations()<cr>", { desc = "Declaration" })
vim.keymap.set("n", "<leader>cI", "<cmd>lua Snacks.picker.lsp_implementations()<cr>", { desc = "Implementation" })
vim.keymap.set("n", "<leader>ct", "<cmd>lua Snacks.picker.lsp_type_definitions()<cr>", { desc = "Type Definition" })
vim.keymap.set("n", "<leader>ci", "<cmd>lua Snacks.picker.lsp_incoming_calls()<cr>", { desc = "Calls Incoming" })
vim.keymap.set("n", "<leader>co", "<cmd>lua Snacks.picker.lsp_outgoing_calls()<cr>", { desc = "Calls Outgoing" })
vim.keymap.set("n", "<leader>cn", "<cmd>lua Snacks.rename.rename_file()<cr>", { desc = "Rename File" })
vim.keymap.set("n", "<leader>cs", "<cmd>lua Snacks.picker.lsp_symbols()<cr>", { desc = "Symbols" })
vim.keymap.set("n", "<leader>cS", "<cmd>lua Snacks.picker.lsp_workspace_symbols()<cr>", { desc = "Workspace Symbols" })

require("snacks").setup({
	bigfile = {},
	bufdelete = {},
	indent = {},
	scope = {},
	notifier = { enabled = false },
	scroll = { enabled = false },
	dashboard = { enabled = false },
	lazygit = {},
	quickfile = {},
	words = {},
	statuscolumn = {},
	terminal = {},
	toggle = {},
	explorer = {},
	zen = {},
	picker = {
		ui_select = { enabled = true },
		matcher = {},
		layout = { preset = "dropdown", cycle = true },
		-- layouts = {
		-- 	custom = {
		-- 		layout = {
		-- 			backdrop = false,
		-- 			width = 0.65,
		-- 			min_width = 80,
		-- 			height = 0.9,
		-- 			min_height = 30,
		-- 			box = "vertical",
		-- 			title_pos = "center",
		-- 			{ win = "preview", title = "{preview:Preview}", height = 0.618, border = true },
		-- 			{
		-- 				box = "vertical",
		-- 				border = true,
		-- 				title = "{title} {live} {flags}",
		-- 				{ win = "input", height = 1, border = "bottom" },
		-- 				{ win = "list" },
		-- 			},
		-- 		},
		-- 	},
		-- },
		formatters = { file = { filename_first = true, truncate = 120 } },
		sources = {
			buffers = { focus = "list" },
			-- command_history = {
			-- 	layout = { preset = "custom", preview = false },
			-- },
			-- lines = { layout = { preset = "custom" } },
			explorer = {
				layout = {
					preview = "main",
				},
				auto_close = true,
				git_status_open = true,
				diagnostics_open = true,
				hidden = true,
			},
			files = { hidden = true },
			smart = { hidden = true, sort_empty = false },
		},
	},
})

vim.api.nvim_create_autocmd("VimEnter", {
	group = vim.api.nvim_create_augroup("cyrusn_snacks_toggle", { clear = true }),
	callback = function()
		local toggle = require("snacks.toggle")
		toggle.option("spell", { name = "Spelling" }):map("<leader>us")
		toggle.option("wrap", { name = "Wrap" }):map("<leader>uw")
		toggle.option("relativenumber", { name = "Relative Number" }):map("<leader>uL")
		toggle.diagnostics():map("<leader>ud")
		toggle.line_number():map("<leader>ul")
		toggle.treesitter():map("<leader>uT")
		toggle.option("background", { off = "light", on = "dark", name = "Dark Background" }):map("<leader>ub")
		toggle.inlay_hints():map("<leader>uh")
		toggle.indent():map("<leader>ug")
		toggle.dim():map("<leader>uD")
		toggle.zen():map("<leader>uz")
		toggle
			.option(
				"conceallevel",
				{ off = 0, on = vim.o.conceallevel > 0 and vim.o.conceallevel or 2, name = "Conceal Level" }
			)
			:map("<leader>uc")
	end,
})
