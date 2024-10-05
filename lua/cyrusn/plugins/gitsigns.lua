return {
	"lewis6991/gitsigns.nvim",
	enabled = true,
	config = function(_, opts)
		opts.on_attach = function(bufnr)
			local gs = require("gitsigns")

			local function map(mode, l, r, desc, opt)
				opt = opt or {}
				opt.buffer = bufnr
				opt.desc = desc
				vim.keymap.set(mode, l, r, opt)
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
			end, "Reset Hunk")
			map("n", "<leader>hs", gs.stage_hunk, "Stage Hunk")
			map("n", "<leader>hr", gs.reset_hunk, "Stage Hunk")
			map("n", "<leader>hS", gs.stage_buffer, "Stage Buffer")
			map("n", "<leader>hR", gs.reset_buffer, "Reset Buffer")
			map("n", "<leader>hu", gs.undo_stage_hunk, "Undo Stage")
			map("n", "<leader>hp", gs.preview_hunk, "Preview Hunk")
			map("n", "<leader>hd", gs.diffthis, "Diff This")
			map("n", "<leader>hD", function()
				gs.diffthis("~")
			end, "Diff This ~")
			map("n", "<leader>hb", function()
				gs.blame_line({ full = true })
			end, "Blame Line")
			map("n", "<leader>tb", gs.toggle_current_line_blame, "Toggle Blame Line (Current)")
			map("n", "<leader>td", gs.toggle_deleted, "Toggle Git Deleted")

			map("n", "<leader>hC", function()
				vim.ui.input({ prompt = "Commit Message: " }, function(message)
					vim.cmd('!git commit -m "' .. message .. '"')
				end)
			end, "Commit")

			-- Text object
			map({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>", "Gitsigns Select Hunk")
		end
		require("gitsigns").setup(opts)
	end,
}
