local mini_basics_opts = {
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
}

require("mini.basics").setup(mini_basics_opts)
