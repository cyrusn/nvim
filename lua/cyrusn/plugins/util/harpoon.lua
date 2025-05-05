return {
	"ThePrimeagen/harpoon",
	branch = "harpoon2",
	dependencies = { "nvim-lua/plenary.nvim" },
	config = function()
		local harpoon = require("harpoon")
		local snacks = require("snacks")
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
			local snacks = require("snacks")
			snacks.picker.harpoon()
		end, { desc = "List harpoon files " })

		vim.keymap.set("n", "<leader>le", function()
			harpoon.ui:toggle_quick_menu(harpoon:list())
		end, { desc = "Edit harpoon list" })

		-- Toggle previous & next buffers stored within Harpoon list
		vim.keymap.set("n", "[[", function()
			harpoon:list():prev()
		end)
		vim.keymap.set("n", "]]", function()
			harpoon:list():next()
		end)
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
								for idx, item in ipairs(harpoon:list().items) do
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
