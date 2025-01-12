return {
	"echasnovski/mini.nvim",
	enabled = false,
	lazy = false,
	dependancies = {
		"echasnovski/mini.icons",
	},
	keys = {
		{ "<leader>e", "<cmd>lua MiniFiles.open()<cr>", desc = "Open Explorer" },
		{ "g.", "<cmd>MiniFilesToggleHiddenFiles<cr>", desc = "Toggle Hidden Files", ft = "minifiles" },
	},
	config = function()
		local MiniFiles = require("mini.files")
		local is_show_hidden = false
		local ignored_files = {
			".git",
			".DS_Store",
			"node_modules",
		}

		local default_sort = MiniFiles.default_sort
		local default_filter = MiniFiles.default_filter

		local sort_hidden = function(entries)
			local all_paths = table.concat(
				vim.tbl_map(function(entry)
					return entry.path
				end, entries),
				"\n"
			)
			local output_lines = {}
			local job_id = vim.fn.jobstart({ "git", "check-ignore", "--stdin" }, {
				stdout_buffered = true,
				on_stdout = function(_, data)
					output_lines = data
				end,
			})

			-- command failed to run
			if job_id < 1 then
				return entries
			end

			-- send paths via STDIN
			vim.fn.chansend(job_id, all_paths)
			vim.fn.chanclose(job_id, "stdin")
			vim.fn.jobwait({ job_id })
			return require("mini.files").default_sort(vim.tbl_filter(function(entry)
				return not vim.tbl_contains(output_lines, entry.path)
			end, entries))
		end

		local filter_hidden = function(fs_entry)
			return not vim.list_contains(ignored_files, fs_entry.name)
		end

		local toggle_hidden_files = function()
			is_show_hidden = not is_show_hidden

			local new_sort = is_show_hidden and default_sort or sort_hidden
			local new_filter = is_show_hidden and default_filter or filter_hidden

			MiniFiles.refresh({
				content = {
					sort = new_sort,
					filter = new_filter,
				},
			})
		end

		vim.api.nvim_create_user_command("MiniFilesToggleHiddenFiles", toggle_hidden_files, { nargs = 0 })

		MiniFiles.setup({
			content = {
				filter = is_show_hidden and default_filter or filter_hidden,
				sort = is_show_hidden and default_sort or sort_hidden,
			},
			mappings = {
				reset = "<ESC>",
				close = "q",
				go_in = "L",
				go_in_plus = "l",
				go_out = "H",
				go_out_plus = "h",
			},
			options = { use_as_default_explorer = false },
			windows = {
				preview = true,
				width_focus = 25,
				width_preview = 80,
			},
		})
	end,
}
