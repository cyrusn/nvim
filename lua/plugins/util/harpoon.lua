return {
	"ThePrimeagen/harpoon",
	event = "VeryLazy",
	branch = "harpoon2",
	dependencies = { "nvim-lua/plenary.nvim" },
	keys = function()
		local keys = {
			{ "<leader>l", "", desc = "+harpoon" },
			{
				"<leader>la",
				function()
					require("harpoon"):list():add()
				end,
				desc = "Harpoon File",
			},
			{
				"<leader>ll",
				"<cmd>lua Snacks.picker.harpoon()<cr>",
				desc = "Open Harpoon",
			},
			{
				"<leader>le",
				function()
					local harpoon = require("harpoon")
					harpoon.ui:toggle_quick_menu(harpoon:list())
				end,
				desc = "Harpoon Quick Menu",
			},
		}
		for i = 1, 5 do
			table.insert(keys, {
				"<leader>l" .. i,
				function()
					require("harpoon"):list():select(i)
				end,
				desc = "Harpoon to File " .. i,
			})
		end
		return keys
	end,
	config = function()
		local harpoon = require("harpoon")
		-- REQUIRED
		harpoon:setup()
		-- REQUIRED
		local harpoon_extensions = require("harpoon.extensions")
		harpoon:extend(harpoon_extensions.builtins.highlight_current_file())
		harpoon:extend(harpoon_extensions.builtins.navigate_with_number())

		-- Toggle previous & next buffers stored within Harpoon list
		vim.keymap.set("n", "<M-S-P>", function()
			harpoon:list():prev()
		end, { desc = "Prev harpoon" })
		vim.keymap.set("n", "<M-S-N>", function()
			harpoon:list():next()
		end, { desc = "Next harpoon" })
		-- Example: Using snacks.picker to list harpoon files
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
