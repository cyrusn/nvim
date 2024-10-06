return {
	"echasnovski/mini.nvim",
	lazy = false,
	keys = {
		{ "<leader>n", "<cmd>lua MiniNotify.show_history()<cr>", desc = "Show history" },
		{ "<leader>x", "<cmd>lua MiniBufremove.delete(0)<cr>", desc = "Delete Buffer" },
		{ "<leader>e", "<cmd>lua MiniFiles.open()<cr>", desc = "Open files" },
	},
	config = function()
		-- vim.cmd.colorscheme("minicyan")
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
				close = "<esc>",
				go_in = "L",
				go_in_plus = "l",
				go_out = "H",
				go_out_plus = "h",
				mark_goto = "'",
				mark_set = "m",
				reset = "<BS>",
				reveal_cwd = "@",
				show_help = "g?",
				synchronize = "=",
				trim_left = "<",
				trim_right = ">",
			},

			options = { use_as_default_explorer = false},
			windows = {
				preview = true,
				width_focus = 25,
				width_preview = 80,
			},
		})
		require("mini.tabline").setup()
		require("mini.statusline").setup()
    require("mini.git").setup()
    require("mini.diff").setup()
    require("mini.icons").setup()
		require("mini.pairs").setup()
		require("mini.operators").setup()
		require("mini.cursorword").setup()
		require("mini.basics").setup({
			mappings = {
				basic = false,
				window = true,
			},
		})

		require("mini.bufremove").setup()
		require("mini.comment").setup()
		require("mini.indentscope").setup()
		require("mini.move").setup()
		require("mini.surround").setup()

		local miniclue = require("mini.clue")
		miniclue.setup({
			triggers = {
				-- Leader triggers
				{ mode = "n", keys = "<Leader>" },
				{ mode = "x", keys = "<Leader>" },

				-- Built-in completion
				{ mode = "i", keys = "<C-x>" },

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
				{ mode = "n", keys = "<leader>d", desc = "+diagnostic" },
				{ mode = "n", keys = "<leader>s", desc = "+search" },
				{ mode = "n", keys = "<leader>t", desc = "+toggle" },
				{ mode = "n", keys = "<leader>c", desc = "+code" },
				{ mode = "n", keys = "<leader>h", desc = "+hunk" },
				{ mode = "x", keys = "<leader>c", desc = "+code" },
				{ mode = "x", keys = "<leader>h", desc = "+hunk" },
				{ mode = "n", keys = "<leader>m", desc = "+mini" },
				-- { mode = "n", keys = "<leader>o", desc = "+obsidian" },

				-- Enhance this by adding descriptions for <Leader> mapping groups
				miniclue.gen_clues.builtin_completion(),
				miniclue.gen_clues.g(),
				miniclue.gen_clues.marks(),
				miniclue.gen_clues.registers(),
				miniclue.gen_clues.windows(),
				miniclue.gen_clues.z(),
			},
			window = {
				delay = 500,
			},
		})

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
}
