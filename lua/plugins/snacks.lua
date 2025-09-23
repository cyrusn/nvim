vim.pack.add({ "https://github.com/folke/snacks.nvim" })

require("snacks").setup({
	styles = {
		notification = {
			wo = { wrap = true }, -- wrap notifications
		},
	},
	bufdelete = {},
	indent = {},
	scope = {},
	lazygit = {},
	quickfile = {},
	words = {},
	statuscolumn = {},
	terminal = {},
	notifier = {
		style = "minimal",
		top_down = false,
		width = { min = 1, max = 0.4 },
		height = { min = 1, max = 0.4 },
		margin = { top = 2, right = 1, bottom = 2 },
	},
	explorer = { replace_netrw = true },
	picker = {
		ui_select = { enabled = true },
		matcher = { frecency = true },
		layout = { preset = "fat_split", cycle = true },
		layouts = {
			float = {
				preview = true,
				layout = {
					backdrop = false,
					width = 0.6,
					height = 0.8,
					col = -1,
					row = -1,
					title = "{title} {live} {flags}",
					title_pos = "center",
					border = "rounded",
					box = "horizontal",
					{ win = "preview", title = "{preview}", width = 0.6, border = "right" },
					{
						box = "vertical",
						{ win = "input", height = 1, border = "bottom" },
						{ win = "list" },
					},
				},
			},
			tall = {
				layout = {
					backdrop = false,
					width = 0.25,
					height = 0.8,
					row = -1,
					col = -2,
					title = "{title} {live} {flags}",
					title_pos = "center",
					border = "rounded",
					box = "vertical",
					{ win = "input", height = 1 },
					{ win = "list" },
					{ win = "preview", title = "{preview}", height = 0.4, border = "top" },
				},
			},
			fat = {
				preview = false,
				layout = {
					box = "vertical",
					backdrop = false,
					row = -1,
					width = 0.7,
					height = 12,
					border = "rounded",
					title = " {title} {live} {flags}",
					title_pos = "center",
					{ win = "input", height = 1 },
					{
						box = "horizontal",
						{ win = "list", border = "none" },
						{ win = "preview", title = "{preview}", width = 0.7 },
					},
				},
			},
			fat_preview = { preset = "fat", preview = true },
			fat_split = { preset = "fat", preview = "main" },
		},
		formatters = { file = { filename_first = true, truncate = 120 } },
		sources = {
			buffers = { current = false },
			explorer = {
				layout = { preset = "float", preview = true },
				auto_close = true,
				git_status_open = true,
				diagnostics_open = true,
				hidden = true,
			},
			files = { hidden = true },
			grep_buffers = { live = false },
			lsp_references = { include_current = true, auto_confirm = false, focus = "list" },
			lsp_symbols = {
				include_current = true,
				auto_confirm = false,
				focus = "list",
				filter = {
					default = true,
				},
			},
			recent = { filter = { cwd = true } },
			lsp_type_definitions = { include_current = true, auto_confirm = false },
			lsp_workspace_symbols = { include_current = true },
			smart = { multi = { "buffers", "recent", "files" }, hidden = true },
			qflist = { focus = "list" },
			yanky = { focus = "list" },
		},
	},
})

vim.keymap.set("n", "<leader>x", "<cmd>lua Snacks.bufdelete.delete()<cr>", { desc = "Close Buffer" })
vim.keymap.set("n", "<leader>X", "<cmd>lua Snacks.bufdelete.other()<cr>", { desc = "Close Other Buffers" })
-- lazygit
vim.keymap.set("n", "<leader>hg", "<cmd>lua Snacks.lazygit()<cr>", { desc = "Lazygit" })
-- notifier
vim.keymap.set("n", "<leader>kn", "<cmd>lua Snacks.picker.notifications()<cr>", { desc = "Show Notifier History" })
-- terminal
vim.keymap.set("n", "<leader>z", "<cmd>lua Snacks.terminal()<cr>", { desc = "Terminal" })
-- explorer
vim.keymap.set("n", "<leader>e", "<cmd>lua Snacks.explorer()<cr>", { desc = "File Tree" })
-- picker:main
vim.keymap.set("n", "<leader><space>", "<cmd>lua Snacks.picker.smart()<cr>", { desc = "Smart" })
vim.keymap.set("n", "<leader>,", "<cmd>lua Snacks.picker.buffers()<cr>", { desc = "Buffers" })
vim.keymap.set("n", "<leader>p", "<cmd>lua Snacks.picker.pickers()<cr>", { desc = "Pickers" })
vim.keymap.set("n", "<leader><tab>", "<cmd>lua Snacks.picker.resume()<cr>", { desc = "Resume" })
vim.keymap.set("n", "<leader>kg", "<cmd>lua Snacks.picker.grep()<cr>", { desc = "Grep" })
vim.keymap.set("n", "<leader>kw", "<cmd>lua Snacks.picker.grep_word()<cr>", { desc = "Grep Word" })
vim.keymap.set("n", "<leader>kf", "<cmd>lua Snacks.picker.files()<cr>", { desc = "Files" })
vim.keymap.set("n", "<leader>kh", "<cmd>lua Snacks.picker.help()<cr>", { desc = "Help" })
vim.keymap.set("n", "<leader>kq", "<cmd>lua Snacks.picker.qflist()<cr>", { desc = "Quickfix" })
vim.keymap.set("n", "<leader>kc", "<cmd>lua Snacks.picker.commands()<cr>", { desc = "Commands" })
vim.keymap.set("n", "<leader>kr", "<cmd>lua Snacks.picker.lsp_references()<cr>", { desc = "LSP References" })
vim.keymap.set("n", "<leader>kd", "<cmd>lua Snacks.picker.lsp_definitions()<cr>", { desc = "LSP Definintions" })
