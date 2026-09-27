local miniclue = require("mini.clue")
local miniclue_opts = {
	triggers = {
		{ mode = { "n", "x" }, keys = "<Leader>" },
		{ mode = "n", keys = "[" },
		{ mode = "n", keys = "]" },
		{ mode = "i", keys = "<C-x>" },
		{ mode = { "n", "x" }, keys = "g" },
		{ mode = { "n", "x" }, keys = "'" },
		{ mode = { "n", "x" }, keys = "`" },
		{ mode = { "n", "x" }, keys = '"' },
		{ mode = { "i", "c" }, keys = "<C-r>" },
		{ mode = "n", keys = "<C-w>" },
		{ mode = { "n", "x" }, keys = "z" },
	},

	clues = {
		miniclue.gen_clues.square_brackets(),
		miniclue.gen_clues.builtin_completion(),
		miniclue.gen_clues.g(),
		miniclue.gen_clues.marks(),
		miniclue.gen_clues.registers(),
		miniclue.gen_clues.windows({
			submode_move = true,
			submode_navigate = true,
			submode_resize = true,
		}),
		miniclue.gen_clues.z(),
		{ mode = "n", keys = "<Leader>b", desc = "+Buffers" },
		{ mode = "n", keys = "<leader>c", desc = "Code" },
		{ mode = "n", keys = "<leader>g", desc = "Git" },
		{ mode = "n", keys = "<leader>q", desc = "Session" },
		{ mode = "n", keys = "<leader>s", desc = "Search" },
		{ mode = "n", keys = "<leader>f", desc = "Find" },
		{ mode = "n", keys = "<leader>u", desc = "UI" },
		{ mode = "n", keys = "<leader>l", desc = "System" },
		{ mode = "n", keys = "<leader>a", desc = "AI" },
		{ mode = "n", keys = "<leader>sh", desc = "Search History" },
		{ mode = "n", keys = "<leader>sg", desc = "Search Git" },
		{ mode = "n", keys = "<leader>s/", desc = "Grep" },
		{ mode = "n", keys = "gr", desc = "LSP" },
	},
	window = {
		delay = 500,
	},
}

miniclue.setup(miniclue_opts)
