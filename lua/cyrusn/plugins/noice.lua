return {
	"folke/noice.nvim",
	enabled = false,
	event = "VeryLazy",
	dependencies = {
		-- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
		"MunifTanjim/nui.nvim",
		{
			"rcarriga/nvim-notify",
			opts = {
				render = "wrapped-compact",
				max_width = 50,
				stages = "static",
				timeout = 3000,
				level = 0,
			},
		},
	},
	opts = {
		lsp = {
			-- override markdown rendering so that **cmp** and other plugins use **Treesitter**
			override = {
				["vim.lsp.util.convert_input_to_markdown_lines"] = true,
				["vim.lsp.util.stylize_markdown"] = true,
				["cmp.entry.get_documentation"] = true,
			},
		},
		presets = {
			long_message_to_split = true, -- long messages will be sent to a split
			lsp_doc_border = true, -- add a border to hover docs and signature help
		},
		cmdline = { view = "cmdline" },
		messages = { view = "mini" },
		notify = { view = "mini" },
	},
	keys = {
		{
			"<leader>nl",
			function()
				require("noice").cmd("last")
			end,
			desc = "Last",
		},
		{
			"<leader>nh",
			function()
				require("noice").cmd("history")
			end,
			desc = "History",
		},
		{ "<leader>sn", "<cmd>Noice telescope<cr>", desc = "Notification History" },
		{ "<leader>ns", "<cmd>Noice telescope<cr>", desc = "Search" },
		{ "<leader>nm", "<cmd>messages<cr>", desc = "Messages" },
	},
	config = function(_, opts)
		require("noice").setup(opts)
		require("telescope").load_extension("noice")
	end,
}
