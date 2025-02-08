---@module "Snacks"
return {
	"folke/snacks.nvim",
	priority = 1000,
	lazy = false,
	keys = {
		-- bufdelete
		{ "<leader>x", "<cmd>lua Snacks.bufdelete.delete()<cr>", desc = "Close Buffer" },
		{ "<leader>X", "<cmd>lua Snacks.bufdelete.other()<cr>", desc = "Close Other Buffers" },
		-- words
		{ "]r", "<cmd>lua Snacks.words.jump(1, true)<cr>", desc = "Next Reference" },
		{ "[r", "<cmd>lua Snacks.words.jump(-1, true)<cr>", desc = "Prev Reference" },
		-- lazygit
		{ "<leader>hg", "<cmd>lua Snacks.lazygit()<cr>", desc = "Lazygit" },
		-- notifier
		-- { "<leader>n", "<cmd>lua Snacks.notifier.show_history()<cr>", desc = "Show Notifier History" },
		-- terminal
		{ "<leader>z", "<cmd>lua Snacks.terminal.toggle()<cr>", desc = "Terminal" },
		-- explorer
		{ "<leader>e", "<cmd>lua Snacks.explorer()<cr>", desc = "File Explorer" },
		-- picker:main
		{ "<leader><space>", "<cmd>lua Snacks.picker.smart()<cr>", desc = "Smart Find Files" },
		{ "<leader>C", "<cmd>lua Snacks.picker.files({cwd=vim.fn.stdpath('config')})<cr>", desc = "Find Config Files" },
		{ "<leader>g", "<cmd>lua Snacks.picker.git_status()<cr>", desc = "Git Status" },
		{ "<leader>j", "<cmd>lua Snacks.picker.jumps()<cr>", desc = "Jumps" },
		{ "<leader>,", "<cmd>lua Snacks.picker.buffers()<cr>", desc = "Buffers" },
		{ "<leader>l", "<cmd>lua Snacks.picker.lines()<cr>", desc = "Lines" },
		{ "<leader>n", "<cmd>lua Snacks.picker.notifications()<cr>", desc = "Notification History" },
		{ "<leader>r", "<cmd>lua Snacks.picker.lsp_references()<cr>", nowait = true, desc = "References" },
		{ "<leader>:", "<cmd>lua Snacks.picker.command_history()<cr>", desc = "Command History" },
		{ "<leader>/", "<cmd>lua Snacks.picker.grep_buffers()<cr>", desc = "Grep Open Buffers" },
		{ "<leader>p", "<cmd>lua Snacks.picker.grep_word()<cr>", desc = "Grep Word", mode = { "n", "x" } },
		{ "<leader>P", "<cmd>lua Snacks.picker.grep()<cr>", desc = "Grep" },

		-- picker:git
		{ "<leader>hL", "<cmd>lua Snacks.picker.git_log_line()<cr>", desc = "Git Log Line" },
		{ "<leader>hS", "<cmd>lua Snacks.picker.git_stash()<cr>", desc = "Git Stash" },
		{ "<leader>hb", "<cmd>lua Snacks.picker.git_branches()<cr>", desc = "Git Branches" },
		{ "<leader>hf", "<cmd>lua Snacks.picker.git_log_file()<cr>", desc = "Git Log File" },
		{ "<leader>hh", "<cmd>lua Snacks.picker.git_diff()<cr>", desc = "Git Diff (Hunks)" },
		{ "<leader>hl", "<cmd>lua Snacks.picker.git_log()<cr>", desc = "Git Log" },

		-- picker:search
		{ "<leader>s/", "<cmd>lua Snacks.picker.search_history()<cr>", desc = "Search History" },
		{ "<leader>sD", "<cmd>lua Snacks.picker.diagnostics_buffer()<cr>", desc = "Buffer Diagnostics" },
		{ "<leader>sU", "<cmd>lua Snacks.picker.colorschemes()<cr>", desc = "Colorschemes" },
		{ "<leader>sc", "<cmd>lua Snacks.picker.commands()<cr>", desc = "Commands" },
		{ "<leader>sd", "<cmd>lua Snacks.picker.diagnostics()<cr>", desc = "Diagnostics" },
		{ "<leader>sf", "<cmd>lua Snacks.picker.git_files()<cr>", desc = "Find Git Files" },
		{ "<leader>sh", "<cmd>lua Snacks.picker.help()<cr>", desc = "Help Pages" },
		{ "<leader>sk", "<cmd>lua Snacks.picker.keymaps()<cr>", desc = "Keymaps" },
		{ "<leader>sl", "<cmd>lua Snacks.picker.loclist()<cr>", desc = "Location List" },
		{ "<leader>sm", "<cmd>lua Snacks.picker.marks()<cr>", desc = "Marks" },
		{ "<leader>sp", "<cmd>lua Snacks.picker.projects()<cr>", desc = "Projects" },
		{ "<leader>sq", "<cmd>lua Snacks.picker.qflist()<cr>", desc = "Quickfix List" },
		{ "<leader>sr", "<cmd>lua Snacks.picker.recent()<cr>", desc = "Recent" },
		{ "<leader>su", "<cmd>lua Snacks.picker.undo()<cr>", desc = "Undo History" },
		{ '<leader>s"', "<cmd>lua Snacks.picker.registers()<cr>", desc = "Registers" },

		-- picker:LSP
		{ "<leader>cD", "<cmd>lua Snacks.picker.lsp_declarations()<cr>", desc = "Goto Declaration" },
		{ "<leader>cI", "<cmd>lua Snacks.picker.lsp_implementations()<cr>", desc = "Goto Implementation" },
		{ "<leader>cd", "<cmd>lua Snacks.picker.lsp_definitions()<cr>", desc = "Goto Definition" },
		{ "<leader>ct", "<cmd>lua Snacks.picker.lsp_type_definitions()<cr>", desc = "Goto Type Definition" },
		{ "<leader>cs", "<cmd>lua Snacks.picker.lsp_symbols()<cr>", desc = "LSP Symbols" },
		{ "<leader>cS", "<cmd>lua Snacks.picker.lsp_workspace_symbols()<cr>", desc = "LSP Workspace Symbols" },

		-- unused
		-- { "<leader>p", "<cmd>lua Snacks.picker.files()<cr>", desc = "Find Files" },
		-- { "<leader>sH", "<cmd>lua Snacks.picker.highlights()<cr>", desc = "Highlights" },
		-- { "<leader>sM", "<cmd>lua Snacks.picker.man()<cr>", desc = "Man Pages" },
		-- { "<leader>sa", "<cmd>lua Snacks.picker.autocmds()<cr>", desc = "Autocmds" },
		-- { "<leader>si", "<cmd>lua Snacks.picker.icons()<cr>", desc = "Icons" },
		-- { "<leader>sp", "<cmd>lua Snacks.picker.lazy()<cr>", desc = "Search for Plugin Spec" },
		-- { "<leader>ss", "<cmd>lua Snacks.picker.resume()<cr>", desc = "Resume" },
	},
	opts = {
		styles = {
			notification = {},
		},
		bufdelete = {},
		explorer = {},
		indent = {},
		lazygit = {},
		-- notifier = {},
		picker = {
			layout = { preset = "custom", preview = "main" },
			layouts = {
				custom = {
					preview = false,
					layout = {
						position = "bottom",
						backdrop = false,
						row = 1,
						width = 0,
						min_width = 80,
						height = 10,
						title = "{title} {live} {flags} ({preview})",
						title_pos = "center",
						border = "top",
						box = "vertical",
						{
							box = "horizontal",
							{ win = "list" },
							{ win = "preview", width = 0.7 },
						},
						{ win = "input", height = 1 },
					},
				},
			},
			formatters = { file = { filename_first = true } },
			sources = {
				explorer = {
					layout = { preset = "custom", preview = "main" },
					auto_close = true,
				},
				smart = {
					multi = { "buffers", "files" },
				},
				buffers = {
					current = false,
				},
				qrep_buffers = {
					need_search = true,
				},
				lsp_references = {
					include_current = true,
					auto_confirm = false, -- if true, will automatically jump to the reference when only single reference is found.
				},
				lsp_type_definitions = {
					include_current = true,
					auto_confirm = false,
				},
				command_history = { layout = { preview = false } },
				search_history = { layout = { preview = false } },
				keymaps = { layout = { preview = false } },
			},
		},
		statuscolumn = {},
		terminal = {},
		util = {},
		words = {},
	},
}
