local delete_pack = function()
	local pkgs = vim.pack.get()
	local names = vim.tbl_map(function(p)
		return p.spec.name
	end, pkgs)
	table.sort(names)
	vim.ui.select(names, {
		prompt = "Select Package to Delete",
	}, function(choice)
		if choice then
			vim.pack.del({ choice })
		end
	end)
end

local toggle_quickfix = function()
	local qf_exists = false
	for _, win in pairs(vim.fn.getwininfo()) do
		if win.quickfix == 1 then
			qf_exists = true
			break
		end
	end

	if qf_exists then
		vim.cmd("cclose")
	else
		local qflist = vim.fn.getqflist()
		if #qflist > 0 then
			vim.cmd("copen")
		else
			vim.notify("Quickfix list is empty", vim.log.levels.INFO)
		end
	end
end

-- system
vim.keymap.set("n", "<leader>w", "<cmd>silent update<cr>", { desc = "Write", silent = true })
vim.keymap.set("n", "<leader>lp", "<cmd>lua vim.pack.update()<cr>", { desc = "Pack Update" })
vim.keymap.set("n", "<leader>ld", delete_pack, { desc = "Pack Delete" })
vim.keymap.set("n", "<leader>lr", "<cmd>restart<cr>", { desc = "Restart" })
vim.keymap.set("n", "<leader>lh", "<cmd>checkhealth<cr>", { desc = "Check Health" })

-- code
vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Code Action" })

-- quickfix
vim.keymap.set("n", "<C-n>", "<cmd>cnext<cr>", { desc = "Next Quickfix" })
vim.keymap.set("n", "<C-p>", "<cmd>cprev<cr>", { desc = "Prev Quickfix" })
vim.keymap.set("n", "<leader>uq", toggle_quickfix, { desc = "Toggle Quickfix Window" })

-- buffers
vim.keymap.set("n", "<S-h>", "<cmd>bprevious<cr>", { desc = "Prev Buffer" })
vim.keymap.set("n", "<S-l>", "<cmd>bnext<cr>", { desc = "Next Buffer" })
vim.keymap.set("n", "<leader>ba", "<cmd>b#<cr>", { desc = "Alternative Buffer" })
