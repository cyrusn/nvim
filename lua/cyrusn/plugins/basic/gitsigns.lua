return {
	"lewis6991/gitsigns.nvim",
	opts = function()
		local config = require("cyrusn.config")
		local gitsigns_icons = config.icons.gitsigns

		local opts = {
			signs = {
				add = { text = gitsigns_icons.added },
				change = { text = gitsigns_icons.modified },
				delete = { text = gitsigns_icons.removed },
				topdelete = { text = gitsigns_icons.topdelete },
				changedelete = { text = gitsigns_icons.changedelete },
				untracked = { text = gitsigns_icons.untracked },
			},
			on_attach = function(bufnr)
				local gs = package.loaded.gitsigns

				local function map(mode, l, r, desc, opts)
					opts = opts or {}
					opts.buffer = bufnr
					opts.desc = desc
					vim.keymap.set(mode, l, r, opts)
				end

				-- Navigation
				map("n", "]h", function()
					if vim.wo.diff then
						return "]h"
					end
					vim.schedule(function()
						gs.next_hunk()
					end)
					return "<Ignore>"
				end, "Next Hunk", { expr = true })

				map("n", "[h", function()
					if vim.wo.diff then
						return "[h"
					end
					vim.schedule(function()
						gs.prev_hunk()
					end)
					-- Text object
					return "<Ignore>"
				end, "Prev Hunk", { expr = true })

				-- Actions
				map("v", "<leader>hs", function()
					gs.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
				end, "Stage Hunk")
				map("v", "<leader>hr", function()
					gs.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
				end, "Stage Hunk")
				map("n", "<leader>hs", gs.stage_hunk, "Stage Hunk")
				map("n", "<leader>hS", gs.stage_buffer, "Stage Buffer")
				map("n", "<leader>hu", gs.undo_stage_hunk, "Undo Stage")
				map("n", "<leader>hR", gs.reset_buffer, "Reset Buffer")
				map("n", "<leader>hp", gs.preview_hunk, "Preview Hunk")
				map("n", "<leader>hb", function()
					gs.blame_line({ full = true })
				end, "Blame Line")
				map("n", "<leader>hd", gs.diffthis, "Diff This")
				map("n", "<leader>hD", function()
					gs.diffthis("~")
				end, "Diff This ~")
				map("n", "<leader>tb", gs.toggle_current_line_blame, "Toggle Blame Line (Current)")
				map("n", "<leader>td", gs.toggle_deleted, "Toggle Git Deleted")

				map("n", "<leader>hc", function()
					vim.ui.input("Commit Message: ", function(message)
						vim.cmd('!git commit -m "' .. message .. '"')
					end)
				end, "Commit")

				-- Text object
				map({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>", "Gitsigns Select Hunk")
			end,
		}
		return opts
	end,
}
