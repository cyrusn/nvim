return {
	"chentoast/marks.nvim",
	event = "VeryLazy",
	opts = {},
	config = function()
		require("marks").setup({
			default_mappings = false,
			mappings = {
				set = "ms",
				toggle = "mm",
				next = "mf",
				prev = "mb",
				preview = "mp",
				delete_buf = "mX",
				delete = "mx",
			},
		})

		local ok, wk = pcall(require, "which-key")

		if ok then
			wk.add({
				{ "m", group = "marks", icon = { icon = "", color = "green" } },
				{ "mm", name = "Mark Toggle" },
				{ "mf", name = "Next Mark" },
				{ "mb", name = "Prev Mark" },
				{ "mp", name = "Preview Mark" },
				{ "ms", name = "Set Mark" },
				{ "mx", name = "Delete Mark" },
				{ "mX", name = "Delete Marks" },
			})
		end
	end,
}
