return {
	"folke/snacks.nvim",
	event = "VeryLazy",
	keys = {
		-- bufdelete
		{ "<leader>x", "<cmd>lua Snacks.bufdelete.delete()<cr>", desc = "Close Buffer" },
		{ "<leader>X", "<cmd>lua Snacks.bufdelete.other()<cr>", desc = "Close Other Buffers" },
		-- lazygit
		{ "<leader>hg", "<cmd>lua Snacks.lazygit()<cr>", desc = "Lazygit" },
		-- notifier
		{ "<leader>sn", "<cmd>lua Snacks.picker.notifications()<cr>", desc = "Show Notifier History" },
		-- terminal
		{ "<leader>z", "<cmd>lua Snacks.terminal()<cr>", desc = "Terminal" },
		-- explorer
		{ "<leader>e", "<cmd>lua Snacks.explorer()<cr>", desc = "File Tree" },
		-- picker:main
		{ "<leader><space>", "<cmd>lua Snacks.picker.smart()<cr>", desc = "Smart" },
		{ "<leader>,", "<cmd>lua Snacks.picker.buffers()<cr>", desc = "Buffers" },
		{ "<leader>p", "<cmd>lua Snacks.picker.pickers()<cr>", desc = "Pickers" },
		{ "<leader><tab>", "<cmd>lua Snacks.picker.resume()<cr>", desc = "Resume" },
		{ "<leader>sg", "<cmd>lua Snacks.picker.grep()<cr>", desc = "Grep" },
		{ "<leader>sw", "<cmd>lua Snacks.picker.grep_word()<cr>", desc = "Grep Word" },
		{ "<leader>sf", "<cmd>lua Snacks.picker.files()<cr>", desc = "Files" },
		{ "<leader>sh", "<cmd>lua Snacks.picker.help()<cr>", desc = "Help" },
		{ "<leader>sq", "<cmd>lua Snacks.picker.qflist()<cr>", desc = "Quickfix" },
		{ "<leader>sc", "<cmd>lua Snacks.picker.commands()<cr>", desc = "Commands" },
		{ "<leader>sr", "<cmd>lua Snacks.picker.lsp_references()<cr>", desc = "LSP References" },
		{ "<leader>sd", "<cmd>lua Snacks.picker.lsp_definitions()<cr>", desc = "LSP Definintions" },
	},
	opts = {
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
		bigfile = {},
		words = {},
		statuscolumn = {},
		terminal = {},
		util = {},
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
			matcher = {
				frecency = true,
			},
			layout = { preset = "ivy", preview = "main", cycle = true },
			sources = {
				buffers = { focus = "list", current = false },
				explorer = {
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
	},
}
