require("gitsigns").setup({
	on_attach = function(bufnr)
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
		end, "Prev Hunk", { expr = true })

		-- Actions
		map("v", "<leader>gs", function()
			gs.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
		end, "Stage Hunk")
		map("v", "<leader>gr", function()
			gs.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
		end, "Reset Hunk")
		map("n", "<leader>gs", gs.stage_hunk, "Stage Hunk")
		map("n", "<leader>gr", gs.reset_hunk, "Reset Hunk")
		map("n", "<leader>gS", gs.stage_buffer, "Stage Buffer")
		map("n", "<leader>gR", gs.reset_buffer, "Reset Buffer")
		map({ "n", "v" }, "<leader>gu", gs.undo_stage_hunk, "Undo Stage")
		map({ "n", "v" }, "<leader>gp", gs.preview_hunk, "Preview Hunk")
		map("n", "<leader>gd", gs.diffthis, "Diff This")
		map("n", "<leader>gD", function()
			gs.diffthis("~")
		end, "Diff This ~")
		map("n", "<leader>gB", function()
			gs.blame_line({ full = true })
		end, "Blame Line")
		map("n", "<leader>gb", gs.toggle_current_line_blame, "Toggle Blame Line (Current)")
		map("n", "<leader>gt", gs.toggle_deleted, "Toggle Git Deleted")
		-- Text object
		map({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>", "Gitsigns Select Hunk")
	end,
})
