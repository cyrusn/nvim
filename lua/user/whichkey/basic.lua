-- Basic Leader
return {
	{ "n", "<leader><leader>", "<cmd>Telescope find_files theme=ivy<cr>", "Find files" },
	{ "n", "<leader>e", "<cmd>NvimTreeToggle<cr>", "Explorer" },
	{ "n", "<leader>f", "<cmd>Telescope live_grep<cr>", "Find Text" },
	{ "n", "<leader>u", "<cmd>Telescope undo<cr>", "Undo" },
	{ "n", "<leader>w", "<cmd>w<CR>", "Save" },
}
