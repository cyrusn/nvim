return {
	"folke/snacks.nvim",
	event = "VeryLazy",
	keys = {
		-- bufdelete
		{ "<leader>bd", "<cmd>lua Snacks.bufdelete.delete()<cr>", desc = "Close Buffer" },
		{ "<leader>bo", "<cmd>lua Snacks.bufdelete.other()<cr>", desc = "Close Other Buffers" },
		-- lazygit
		{ "<leader>hg", "<cmd>lua Snacks.lazygit()<cr>", desc = "Lazygit" },
		-- notifier
		{ "<leader>kn", "<cmd>lua Snacks.picker.notifications()<cr>", desc = "Show Notifier History" },
		-- terminal
		{ "<leader>uz", "<cmd>lua Snacks.terminal()<cr>", desc = "Terminal" },
		-- explorer
		{ "<leader>e", "<cmd>lua Snacks.explorer()<cr>", desc = "File Tree" },
		-- picker:main
		{ "<leader><space>", "<cmd>lua Snacks.picker.files()<cr>", desc = "Files" },
		{ "<leader>,", "<cmd>lua Snacks.picker.buffers()<cr>", desc = "Buffers" },
		{ "<leader>kp", "<cmd>lua Snacks.picker.pickers()<cr>", desc = "Pickers" },
		{ "<leader>kg", "<cmd>lua Snacks.picker.grep()<cr>", desc = "Grep" },
		{ "<leader>ks", "<cmd>lua Snacks.picker.smart()<cr>", desc = "Smart" },
		{ "<leader>kb", "<cmd>lua Snacks.picker.grep_buffers()<cr>", desc = "Grep Open Buffers" },
		{ "<leader>kw", "<cmd>lua Snacks.picker.grep_word()<cr>", desc = "Grep Word" },
		{ "<leader>kf", "<cmd>lua Snacks.picker.files()<cr>", desc = "Files" },
		{ "<leader>kh", "<cmd>lua Snacks.picker.help()<cr>", desc = "Help" },
		{ "<leader>kl", "<cmd>lua Snacks.picker.lines()<cr>", desc = "Lines" },
		{ "<leader>kq", "<cmd>lua Snacks.picker.qflist()<cr>", desc = "Quickfix" },
		{ "<leader>kc", "<cmd>lua Snacks.picker.commands()<cr>", desc = "Commands" },
		{ "<leader>kr", "<cmd>lua Snacks.picker.lsp_references()<cr>", desc = "LSP References" },
		{ "<leader>kd", "<cmd>lua Snacks.picker.lsp_definitions()<cr>", desc = "LSP Definintions" },
		{ "<leader>ku", "<cmd>lua Snacks.picker.undo()<cr>", desc = "Undo History" },
		{ "<leader>k<tab>", "<cmd>lua Snacks.picker.resume()<cr>", desc = "Resume" },
	},
	opts = {
		styles = {
			notification = {
				wo = { wrap = true }, -- wrap notifications
			},
		},
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
		picker = {
			ui_select = { enabled = true },
			matcher = { frecency = true },
			layout = { preset = "custom", cycle = true, preview = true },
			layouts = {
				custom = {
					layout = {
						box = "horizontal",
						backdrop = false,
						row = -2,
						width = 0.9,
						height = 0.4,
						border = true,
						title = " {title} {live} {flags}",
						{
							box = "vertical",
							{ win = "input", height = 1, border = "bottom" },
							{ win = "list", border = "none" },
						},
						{ win = "preview", title = "{preview}", width = 0.65, border = "left" },
					},
				},
			},
			formatters = { file = { filename_first = true, truncate = 120 } },
			sources = {
				buffers = { current = false },
				explorer = {
					layout = { preset = "custom", preview = true },
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
				lines = { layout = { preset = "custom", preview = "main" } },
				lsp_type_definitions = { include_current = true, auto_confirm = false },
				lsp_workspace_symbols = { include_current = true },
				smart = { multi = { "buffers", "recent", "files" }, hidden = true },
				qflist = { focus = "list" },
				yanky = { focus = "list" },
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
				toggle.treesitter():map("<leader>uT")
				toggle.dim():map("<leader>uD")
				toggle.indent():map("<leader>ug")
				toggle
					.option(
						"conceallevel",
						{ off = 0, on = vim.o.conceallevel > 0 and vim.o.conceallevel or 2, name = "Conceal Level" }
					)
					:map("<leader>uc")
			end,
		})

		vim.api.nvim_set_hl(0, "SnacksNotifierMinimal", { link = "NormalNC", bg = "none" })
	end,
}
