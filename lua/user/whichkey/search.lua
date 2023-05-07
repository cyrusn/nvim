-- Search
return {
	{ "n", "<leader>sh", "<cmd>Telescope help_tags theme=ivy<cr>", "Helps" },
	{ "n", "<leader>sm", "<cmd>Telescope man_pages theme=ivy<cr>", "Man Pages" },
	{ "n", "<leader>sc", "<cmd>Telescope commands theme=ivy<cr>", "Commands" },
	{ "n", "<leader>sk", "<cmd>Telescope keymaps theme=dropdown<cr>", "Keymaps" },
	{ "n", "<leader>sb", "<cmd>Telescope buffers theme=ivy<cr>", "Search Buffers" },
	{ "n", "<leader>sp", "<cmd>Telescope projects theme=dropdown<cr>", "Projects" },
	{ "n", "<leader>sr", "<cmd>Telescope oldfiles theme=dropdown<cr>", "Recent Files" },
	{ "n", "<leader>sf", "<cmd>Telescope live_grep theme=ivy<cr>", "Find Text" },
}
