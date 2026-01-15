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
		{ "<leader>k<tab>", "<cmd>lua Snacks.picker.resume()<cr>", desc = "Resume" },
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
		words = {},
		statuscolumn = {},
		terminal = {},
		toggle = {},
		-- notifier = {},
		explorer = { replace_netrw = true },
		picker = {
			ui_select = { enabled = true },
			matcher = { frecency = true },
			layout = { preset = "fat_split", cycle = true },
			layouts = {
				tall = {
					preview = false,
					layout = {
						backdrop = false,
						row = -2,
						col = -1,
						width = 35,
						height = 0.8,
						title = "{title} {live} {flags}",
						title_pos = "center",
						border = "rounded",
						box = "vertical",
						{ win = "input", height = 1 },
						{
							box = "horizontal",
							{ win = "list" },
							{ win = "preview", width = 0.7 },
						},
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
				tall_split = { preset = "tall", preview = "main" },
			},
			formatters = { file = { filename_first = true, truncate = 120 } },
			sources = {
				buffers = { current = false },
				explorer = {
					layout = { preset = "tall", preview = "main" },
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
