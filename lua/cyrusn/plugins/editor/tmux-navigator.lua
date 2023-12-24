return {
	"christoomey/vim-tmux-navigator",
	lazy = false,
	keys = {
		{ "<C-h>", "<cmd>TmuxNavigatorLeft<cr>", desc = "Tmux Window Left" },
		{ "<C-l>", "<cmd>TmuxNavigatorRight<cr>", desc = "Tmux Window Right" },
		{ "<C-k>", "<cmd>TmuxNavigatorDown<cr>", desc = "Tmux Window Down" },
		{ "<C-j>", "<cmd>TmuxNavigatorUp<cr>", desc = "Tmux Window Up" },
	},
}
