return {
	"echasnovski/mini.nvim",
	-- enabled = false,
	lazy = false,
	dependancies = {
		"echasnovski/mini.icons",
	},
	keys = {
		{ "<leader>e", "<cmd>lua MiniFiles.open()<cr>", desc = "MiniFiles" },
	},
	config = function()
		require("mini.basics").setup({
			options = {
				basic = true,
			},
			mappings = {
				basic = true,
				option_toggle_prefix = [[\]],
				windows = true,
				move_with_alt = true,
			},
		})
		require("mini.move").setup()
		require("mini.cursorword").setup()
		require("mini.jump").setup()
		require("mini.surround").setup()
		require("mini.pairs").setup()
		require("mini.files").setup({
			mappings = {
				go_in = "L",
				go_in_plus = "l",
				go_out = "H",
				go_out_plus = "h",
			},
			content = {
				filter = function(entry)
					return entry.name ~= ".DS_Store" and entry.name ~= ".git" and entry.name ~= ".direnv"
				end,
			},
		})
		local miniclue = require("mini.clue")
		miniclue.setup({
			triggers = {
				-- mini.nvim
				{ mode = "n", keys = "\\" },
				{ mode = "n", keys = "s" },
				{ mode = "x", keys = "s" },

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
				-- Enhance this by adding descriptions for <Leader> mapping groups
				miniclue.gen_clues.builtin_completion(),
				miniclue.gen_clues.g(),
				miniclue.gen_clues.marks(),
				miniclue.gen_clues.registers(),
				miniclue.gen_clues.windows(),
				miniclue.gen_clues.z(),
				{ mode = "n", keys = "<leader>c", desc = "+code" },
				{ mode = "n", keys = "<leader>h", desc = "+hunk" },
				{ mode = "n", keys = "<leader>w", desc = "+session" },
				{ mode = "n", keys = "<leader>k", desc = "+search" },
				{ mode = "n", keys = "<leader>l", desc = "+harpoon" },
			},
			window = {
				delay = 500,
			},
		})
	end,
}
