return {
	"ThePrimeagen/harpoon",
	branch = "harpoon2",
	dependencies = { "nvim-lua/plenary.nvim" },
	config = function()
		local harpoon = require("harpoon")
		-- REQUIRED
		harpoon:setup()
		-- REQUIRED
		local harpoon_extensions = require("harpoon.extensions")
		harpoon:extend(harpoon_extensions.builtins.highlight_current_file())
		harpoon:extend(harpoon_extensions.builtins.navigate_with_number())

		vim.keymap.set("n", "<leader>la", function()
			harpoon:list():add()
		end, { desc = "Add file to harpoon" })

		vim.keymap.set("n", "<leader>ll", function()
			harpoon.ui:toggle_quick_menu(harpoon:list())
		end, { desc = "Edit harpoon list" })

    vim.keymap.set("n", "<M-1>", function() harpoon:list():select(1) end, {desc = "Harpoon 1"})
    vim.keymap.set("n", "<M-2>", function() harpoon:list():select(2) end, {desc = "Harpoon 2"})
    vim.keymap.set("n", "<M-3>", function() harpoon:list():select(3) end, {desc = "Harpoon 3"})
    vim.keymap.set("n", "<M-4>", function() harpoon:list():select(4) end, {desc = "Harpoon 4"})

		-- Toggle previous & next buffers stored within Harpoon list
		vim.keymap.set("n", "<M-S-P>", function() harpoon:list():prev() end, { desc = "Prev harpoon" })
		vim.keymap.set("n", "<M-S-N>", function() harpoon:list():next() end, { desc = "Next harpoon" })
	end,
	specs = {
		{
			"folke/snacks.nvim",
			opts = {
				picker = {
					sources = {
						harpoon = {
							title = "Harpoon",
							focus = "list",
							format = "file",
							finder = function()
								local harpoon = require("harpoon")
								local file_paths = {}
								for _, item in ipairs(harpoon:list().items) do
									if item.value ~= nil then
										table.insert(file_paths, {
											file = item.value,
											text = item.value,
										})
									end
								end
								return file_paths
							end,
							win = {
								input = {
									keys = {
										["<C-x>"] = { "delete", mode = { "n", "x" } },
									},
								},
								list = {
									keys = {
										["<C-x>"] = { "delete", mode = { "n", "x" } },
										["dd"] = { "delete", mode = { "n", "x" } },
									},
								},
							},
							actions = {
								delete = function(picker, item)
									local harpoon = require("harpoon")
									local to_remove = item or picker:selected()
									table.remove(harpoon:list().items, to_remove.idx)
									picker:find({
										refresh = true, -- refresh picker after removing values
									})
								end,
							},
						},
					},
				},
			},
		},
	},
}
