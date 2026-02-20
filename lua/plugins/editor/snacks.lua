return {
	"folke/snacks.nvim",
	event = "VeryLazy",
	keys = {
		-- picker:main
		{ "<leader>e", "<cmd>lua Snacks.explorer()<cr>", desc = "File Tree" },
		{ "<leader><space>", "<cmd>lua Snacks.picker.smart()<cr>", desc = "Smart Search" },
		{ "<leader>,", "<cmd>lua Snacks.picker.buffers()<cr>", desc = "Buffers" },

		-- buffers
		{ "<leader>bd", "<cmd>lua Snacks.bufdelete.delete()<cr>", desc = "Close Current Buffer" },
		{ "<leader>bo", "<cmd>lua Snacks.bufdelete.other()<cr>", desc = "Close Other Buffers" },

		-- lazygit
		{ "<leader>hg", "<cmd>lua Snacks.lazygit()<cr>", desc = "Lazygit" },

		-- terminal
		{ "<leader>ut", "<cmd>lua Snacks.terminal()<cr>", desc = "Terminal" },

		-- find
		{ "<leader>kc", "<cmd>lua Snacks.picker.files({cwd=vim.fn.stdpath('config')})<cr>", desc = "Find Config File" },
		{ "<leader>kf", "<cmd>lua Snacks.picker.files()<cr>", desc = "Find Files" },
		{ "<leader>kg", "<cmd>lua Snacks.picker.git_files()<cr>", desc = "Find Git Files" },
		{ "<leader>kp", "<cmd>lua Snacks.picker.projects()<cr>", desc = "Projects" },
		{ "<leader>kr", "<cmd>lua Snacks.picker.recent()<cr>", desc = "Recent" },

		-- search
		{ "<leader>sb", "<cmd>lua Snacks.picker.grep_buffers()<cr>", desc = "Grep Open Buffers" },
		{ "<leader>sc", "<cmd>lua Snacks.picker.command_history()<cr>", desc = "Command History" },
		{ "<leader>sC", "<cmd>lua Snacks.picker.commands()<cr>", desc = "Commands" },
		{ "<leader>sd", "<cmd>lua Snacks.picker.lsp_definitions()<cr>", desc = "LSP Definintions" },
		{ "<leader>sg", "<cmd>lua Snacks.picker.grep()<cr>", desc = "Grep" },
		{ "<leader>sh", "<cmd>lua Snacks.picker.help()<cr>", desc = "Help" },
		{ "<leader>sH", "<cmd>lua Snacks.picker.highlights()<cr>", desc = "Highlights" },
		{ "<leader>si", "<cmd>lua Snacks.picker.icons()<cr>", desc = "Icons" },
		{ "<leader>sj", "<cmd>lua Snacks.picker.jumps()<cr>", desc = "Jumps" },
		{ "<leader>sk", "<cmd>lua Snacks.picker.keymaps()<cr>", desc = "Keymaps" },
		{ "<leader>sl", "<cmd>lua Snacks.picker.lines()<cr>", desc = "Lines" },
		{ "<leader>sm", "<cmd>lua Snacks.picker.marks()<cr>", desc = "Marks" },
		{ "<leader>sM", "<cmd>lua Snacks.picker.man()<cr>", desc = "Man Pages" },
		{ "<leader>sn", "<cmd>lua Snacks.picker.notifications()<cr>", desc = "Show Notifier History" },
		{ "<leader>sp", "<cmd>lua Snacks.picker.pickers()<cr>", desc = "Pickers" },
		{ "<leader>sP", "<cmd>lua Snacks.picker.lazy()<cr>", desc = "Search for Plugin Spec" },
		{ "<leader>sq", "<cmd>lua Snacks.picker.qflist()<cr>", desc = "Quickfix" },
		{ "<leader>sr", "<cmd>lua Snacks.picker.lsp_references()<cr>", desc = "LSP References" },
		{ "<leader>ss", "<cmd>lua Snacks.picker.lsp_symbols()<cr>", desc = "LSP Symbols" },
		{ "<leader>su", "<cmd>lua Snacks.picker.undo()<cr>", desc = "Undo History" },
		{ "<leader>sw", "<cmd>lua Snacks.picker.grep_word()<cr>", desc = "Grep Word" },
		{ "<leader>s<space>", "<cmd>lua Snacks.picker.resume()<cr>", desc = "Resume" },
	},
	opts = {
		bigfile = {},
		bufdelete = {},
		indent = {},
		scope = {},
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
			layout = { preset = "custom", cycle = true, preview = true },
			layouts = {
				custom = {
					layout = {
						backdrop = false,
						width = 0.65,
						min_width = 80,
						height = 0.9,
						min_height = 30,
						box = "vertical",
						title_pos = "center",
						{ win = "preview", title = "{preview:Preview}", height = 0.618, border = true },
						{
							box = "vertical",
							border = true,
							title = "{title} {live} {flags}",
							{ win = "input", height = 1, border = "bottom" },
							{ win = "list" },
						},
					},
				},
			},
			formatters = { file = { filename_first = true, truncate = 120 } },
			sources = {
				buffers = { current = false },
				command_history = {
					layout = { preset = "custom", preview = false },
				},
				explorer = {
					layout = { preset = "custom", preview = "main" },
					auto_close = true,
					git_status_open = true,
					diagnostics_open = true,
					hidden = true,
				},
				files = { hidden = true },
				lines = { layout = { preset = "custom" } },
				smart = { hidden = true, sort_empty = false },
			},
		},
	},
	init = function()
		vim.api.nvim_create_autocmd("User", {
			group = vim.api.nvim_create_augroup("cyrusn_snacks_toggle", { clear = true }),
			callback = function()
				local toggle = require("snacks.toggle")
				toggle.option("spell", { name = "Spelling" }):map("<leader>us")
				toggle.option("wrap", { name = "Wrap" }):map("<leader>uw")
				toggle.option("relativenumber", { name = "Relative Number" }):map("<leader>uL")
				toggle.diagnostics():map("<leader>ud")
				toggle.line_number():map("<leader>ul")
				toggle
					.option("conceallevel", { off = 0, on = vim.o.conceallevel > 0 and vim.o.conceallevel or 2 })
					:map("<leader>uc")
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
	end,
}
