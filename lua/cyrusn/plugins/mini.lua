return {
	{ "echasnovski/mini.statusline", config = true },
	{ "echasnovski/mini.tabline", config = true },
	{ "echasnovski/mini.comment", config = true },
	{ "echasnovski/mini.cursorword", config = true },
	{ "echasnovski/mini.move", config = true },
	{ "echasnovski/mini.operators", config = true },
	{ "echasnovski/mini.pairs", config = true },
	{ "echasnovski/mini.surround", config = true },
	{
		"echasnovski/mini.bufremove",
		keys = {
			{ "<leader>x", "<cmd>lua MiniBufremove.delete(0, true)<cr>", desc = "Close Buffer" },
		},
		config = true,
	},
	{
		"echasnovski/mini.files",
		lazy = false,
		dependancies = {
			"echasnovski/mini.icons",
		},
		keys = {
			{ "<leader>e", "<cmd>lua MiniFiles.open()<cr>", desc = "Open MiniFiles" },
			{ "g.", "<cmd>MiniFilesToggleHiddenFiles<cr>", desc = "Toggle Hidden Files", ft = "minifiles" },
		},
		config = function()
			local MiniFiles = require("mini.files")
			local ignored_files = {
				".git",
				".DS_Store",
				"node_modules",
			}
			local show_hidden = false

			local default_sort = MiniFiles.default_sort
			local default_filter = MiniFiles.default_filter

			local sort_hidden = function(entries)
				local all_paths = table.concat(
					vim.tbl_map(function(entry)
						return entry.path
					end, entries),
					"\n"
				)
				local output_lines = {}
				local job_id = vim.fn.jobstart({ "git", "check-ignore", "--stdin" }, {
					stdout_buffered = true,
					on_stdout = function(_, data)
						output_lines = data
					end,
				})

				-- command failed to run
				if job_id < 1 then
					return entries
				end

				-- send paths via STDIN
				vim.fn.chansend(job_id, all_paths)
				vim.fn.chanclose(job_id, "stdin")
				vim.fn.jobwait({ job_id })
				return require("mini.files").default_sort(vim.tbl_filter(function(entry)
					return not vim.tbl_contains(output_lines, entry.path)
				end, entries))
			end

			local filter_hidden = function(fs_entry)
				return not vim.list_contains(ignored_files, fs_entry.name)
			end

			local toggle_hidden_files = function()
				show_hidden = not show_hidden

				local new_sorter = show_hidden and default_sort or sort_hidden
				local new_filter = show_hidden and default_filter or filter_hidden

				MiniFiles.refresh({
					content = {
						sort = new_sorter,
						filter = new_filter,
					},
				})
			end

			vim.api.nvim_create_user_command("MiniFilesToggleHiddenFiles", toggle_hidden_files, { nargs = 0 })

			require("mini.files").setup({
				content = {
					filter = show_hidden and default_filter or filter_hidden,
					sort = show_hidden and default_sort or sort_hidden,
				},
				mappings = {
					close = "<ESC>",
					go_in = "L",
					go_in_plus = "l",
					go_out = "H",
					go_out_plus = "h",
				},
				options = { use_as_default_explorer = true },
				windows = {
					preview = true,
					width_focus = 25,
					width_preview = 80,
				},
			})
		end,
	},
	{
		"echasnovski/mini.notify",
		lazy = false,
		keys = {
			{ "<leader>n", "<cmd>lua MiniNotify.show_history()<cr>", desc = "Show history" },
		},
		config = function()
			local notify = require("mini.notify")
			notify.setup()

			vim.notify = notify.make_notify({
				ERROR = { duration = 3000 },
				WARN = { duration = 2000 },
				INFO = { duration = 2000 },
				DEBUG = { duration = 2000 },
				TRACE = { duration = 2000 },
				OFF = { duration = 2000 },
			})
		end,
	},
	{
		"echasnovski/mini.basics",
		config = function()
			require("mini.basics").setup({
				mappings = {
					basic = true,
					windows = true,
				},
			})
		end,
	},
	{
		"echasnovski/mini.indentscope",
		config = function()
			local indentscope = require("mini.indentscope")
			indentscope.setup({
				symbol = "│",
				draw = {
					animation = indentscope.gen_animation.none(),
				},
			})
		end,
	},
	{
		"echasnovski/mini.clue",
		config = function()
			local miniclue = require("mini.clue")
			miniclue.setup({
				triggers = {
					-- Leader triggers
					{ mode = "n", keys = "<Leader>" },
					{ mode = "x", keys = "<Leader>" },

					-- `g` key
					{ mode = "n", keys = "g" },
					{ mode = "x", keys = "g" },

					-- Marks
					{ mode = "n", keys = "'" },
					{ mode = "n", keys = "`" },
					{ mode = "x", keys = "'" },
					{ mode = "x", keys = "`" },

					-- Registers
					{ mode = "n", keys = '"' },
					{ mode = "x", keys = '"' },
					{ mode = "i", keys = "<C-r>" },
					{ mode = "c", keys = "<C-r>" },

					-- Window commands
					{ mode = "n", keys = "<C-w>" },

					-- `z` key
					{ mode = "n", keys = "z" },
					{ mode = "x", keys = "z" },
				},

				clues = {
					{ mode = "n", keys = "<leader>s", desc = "+search" },
					{ mode = "n", keys = "<leader>c", desc = "+code" },
					{ mode = "n", keys = "<leader>h", desc = "+hunk" },
					{ mode = "x", keys = "<leader>c", desc = "+code" },
					{ mode = "x", keys = "<leader>h", desc = "+hunk" },

					-- Enhance this by adding descriptions for <Leader> mapping groups
					miniclue.gen_clues.builtin_completion(),
					miniclue.gen_clues.g(),
					miniclue.gen_clues.marks(),
					miniclue.gen_clues.registers({
						show_contents = false,
					}),
					miniclue.gen_clues.windows(),
					miniclue.gen_clues.z(),
				},
				window = {
					delay = 500,
				},
			})
		end,
	},
	{
		"echasnovski/mini.hipatterns",
		config = function()
			local hipatterns = require("mini.hipatterns")
			hipatterns.setup({
				highlighters = {
					-- Highlight standalone 'FIXME', 'HACK', 'TODO', 'NOTE'
					fixme = { pattern = "%f[%w]()FIXME()%f[%W]", group = "MiniHipatternsFixme" },
					hack = { pattern = "%f[%w]()HACK()%f[%W]", group = "MiniHipatternsHack" },
					todo = { pattern = "%f[%w]()TODO()%f[%W]", group = "MiniHipatternsTodo" },
					note = { pattern = "%f[%w]()NOTE()%f[%W]", group = "MiniHipatternsNote" },
					hex_color = hipatterns.gen_highlighter.hex_color(),
				},
			})
		end,
	},
}
