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
		"echasnovski/mini.files",
		dependancies = {
			"echasnovski/mini.icons",
		},
		keys = {
			{ "<leader>e", "<cmd>lua MiniFiles.open()<cr>", desc = "Open files" },
		},
		config = function()
			local helpers = require("cyrusn.config").helpers
			require("mini.files").setup({
				content = {
					filter = function(fs_entry)
						local ignored_files = {
							".git",
							".trash",
						}
						return not helpers.includes(ignored_files, fs_entry.name)
					end,
				},
				mappings = {
					go_in = "L",
					go_in_plus = "l",
					go_out = "H",
					go_out_plus = "h",
				},
				options = { use_as_default_explorer = false },
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
		keys = {
			{ "<leader>n", "<cmd>lua MiniNotify.show_history()<cr>", desc = "Show history" },
		},
		config = function()
			local notify = require("mini.notify")
			notify.setup()

			vim.notify = notify.make_notify({
				ERROR = { duration = 3000 },
				WARN = { duration = 1000 },
				INFO = { duration = 1000 },
				DEBUG = { duration = 1000 },
				TRACE = { duration = 1000 },
				OFF = { duration = 1000 },
			})
		end,
	},
	{
		"echasnovski/mini.basics",
		config = function()
			require("mini.basics").setup({
				mappings = {
					basic = false,
					window = true,
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
