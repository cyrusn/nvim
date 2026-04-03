require("mini.tabline").setup()

require("mini.sessions").setup({
	directory = vim.fn.stdpath("data") .. "/session",
	autoread = false,
	autowrite = true,
})

vim.api.nvim_create_autocmd("VimLeavePre", {
	group = vim.api.nvim_create_augroup("MiniSessionsAutoSave", { clear = true }),
	callback = function()
		local name = vim.fn.fnamemodify(vim.fn.getcwd(), ":t")
		require("mini.sessions").write(name)
	end,
})

vim.keymap.set("n", "<leader>qs", function()
	require("mini.sessions").select()
end, { desc = "Select Session" })

vim.keymap.set("n", "<leader>ql", function()
	local name = vim.fn.fnamemodify(vim.fn.getcwd(), ":t")
	require("mini.sessions").read(name)
end, { desc = "Load Project Session" })

vim.keymap.set("n", "<leader>qd", function()
	require("mini.sessions").select("delete")
end, { desc = "Delete Session" })

vim.api.nvim_create_autocmd("FileType", {
	group = vim.api.nvim_create_augroup("treesitter_highlight", { clear = true }),
	callback = function(ev)
		local _, lang = ev.match, vim.treesitter.language.get_lang(ev.match)
		pcall(vim.treesitter.start, ev.buf, lang)
	end,
})

local MiniStatusline = require("mini.statusline")
MiniStatusline.setup({
	content = {
		active = function()
			local mode, mode_hl = MiniStatusline.section_mode({ trunc_width = 120 })
			local git = MiniStatusline.section_git({ trunc_width = 40 })
			local diff = MiniStatusline.section_diff({ trunc_width = 75 })
			local diagnostics = MiniStatusline.section_diagnostics({ trunc_width = 75 })
			local lsp = MiniStatusline.section_lsp({ trunc_width = 75 })
			local filename = vim.fn.expand("%:.")
			local fileinfo = MiniStatusline.section_fileinfo({ trunc_width = 120 })
			local location = MiniStatusline.section_location({ trunc_width = 75 })
			local search = MiniStatusline.section_searchcount({ trunc_width = 75 })

			local time = os.date(" %R")

			return MiniStatusline.combine_groups({
				{ hl = mode_hl, strings = { mode } },
				{ hl = "MiniStatuslineDevinfo", strings = { git, diff, diagnostics, lsp } },
				"%<",
				{ hl = "MiniStatuslineFilename", strings = { filename } },
				"%=",
				{ hl = "MiniStatuslineFileinfo", strings = { fileinfo } },
				{ hl = mode_hl, strings = { search, location, time } },
			})
		end,
	},
})

require("mini.notify").setup({
	window = {
		config = function()
			local has_statusline = vim.o.laststatus > 0
			local pad = vim.o.cmdheight + (has_statusline and 1 or 0)
			return {
				anchor = "SE",
				col = vim.o.columns,
				row = vim.o.lines - pad,
				border = "none",
			}
		end,
	},
})
vim.notify = require("mini.notify").make_notify()

local miniclue = require("mini.clue")
miniclue.setup({
	triggers = {
		{ mode = "n", keys = "<Leader>" },
		{ mode = "x", keys = "<Leader>" },
		{ mode = "i", keys = "<C-x>" },
		{ mode = "n", keys = "g" },
		{ mode = "x", keys = "g" },
		{ mode = "n", keys = "'" },
		{ mode = "n", keys = "`" },
		{ mode = "x", keys = "'" },
		{ mode = "x", keys = "`" },
		{ mode = "n", keys = '"' },
		{ mode = "x", keys = '"' },
		{ mode = "i", keys = "<C-r>" },
		{ mode = "c", keys = "<C-r>" },
		{ mode = "n", keys = "<C-w>" },
		{ mode = "n", keys = "z" },
		{ mode = "x", keys = "z" },
		{ mode = "n", keys = "[" },
		{ mode = "n", keys = "]" },
		{ mode = "x", keys = "[" },
		{ mode = "x", keys = "]" },
	},

	clues = {
		{ mode = "n", keys = "<Leader>c", desc = "+code" },
		{ mode = "n", keys = "<Leader>g", desc = "+git" },
		{ mode = "n", keys = "<Leader>q", desc = "+session" },
		{ mode = "n", keys = "<Leader>s", desc = "+search" },
		{ mode = "n", keys = "<Leader>f", desc = "+find" },
		{ mode = "n", keys = "<Leader>u", desc = "+ui" },
		{ mode = "n", keys = "<Leader>b", desc = "+buffer" },
		{ mode = "n", keys = "<Leader>l", desc = "+System" },
		miniclue.gen_clues.builtin_completion(),
		miniclue.gen_clues.g(),
		miniclue.gen_clues.marks(),
		miniclue.gen_clues.square_brackets(),
		miniclue.gen_clues.registers(),
		miniclue.gen_clues.windows(),
		miniclue.gen_clues.z(),
	},

	window = {
		delay = 200,
		config = {
			width = "auto",
		},
	},
})

require("mini.move").setup()

require("mini.basics").setup({
	options = {
		basic = true,
		extra_ui = false,
		win_borders = "default",
	},
	mappings = {
		basic = true,
		option_toggle_prefix = "",
		windows = true,
		move_with_alt = true,
	},
	autocommands = {
		basic = true,
		relnum_in_visual_mode = false,
	},
})
