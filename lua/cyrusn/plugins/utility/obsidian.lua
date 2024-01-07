return {
	"epwalsh/obsidian.nvim",
	version = "*", -- recommended, use latest release instead of latest commit
	ft = "markdown",
	-- Replace the above line with this if you only want to load obsidian.nvim for markdown files in your vault:
	-- event = {
	--   -- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand'.
	--   -- E.g. "BufReadPre " .. vim.fn.expand "~" .. "/my-vault/**.md"
	--   "BufReadPre path/to/my-vault/**.md",
	--   "BufNewFile path/to/my-vault/**.md",
	-- },
	dependencies = {
		-- Required.
		"nvim-lua/plenary.nvim",

		-- see below for full list of optional dependencies 👇
	},
	keys = {
		{ "<leader>os", "<cmd>ObsidianQuickSwitch<cr>", desc = "Search Notes" },
		{ "<leader>ot", "<cmd>ObsidianToday<cr>", desc = "Open Today" },
		{ "<leader>oo", "<cmd>ObsidianOpen<cr>", desc = "Open Note" },
		{ "<leader>oa", "<cmd>ObsidianOpen Agenda<cr>", desc = "Open Agenda" },
	},
	opts = {
		workspaces = {
			{
				name = "Notes",
				path = "~/Documents/Note",
			},
		},
		mappings = {
			-- Overrides the 'gf' mapping to work on markdown/wiki links within your vault.
			["<leader>of"] = {
				action = function()
					return require("obsidian").util.gf_passthrough()
				end,
				opts = { noremap = false, expr = true, buffer = true, desc = "Follow Link" },
			},
			-- Toggle check-boxes.
			["<leader>ox"] = {
				action = function()
					return require("obsidian").util.toggle_checkbox()
				end,
				opts = { buffer = true, desc = "CheckBox" },
			},
		},
		-- see below for full list of options 👇
		open_app_foreground = true,
		daily_notes = {
			folder = "/Diary",
			template = nil,
		},
		disable_frontmatter = true,
	},
}
