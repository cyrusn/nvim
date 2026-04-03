vim.keymap.set("n", "<leader>lp", "<cmd>lua vim.pack.update()<cr>", { desc = "Pack Update" })
vim.keymap.set("n", "<leader>ld", function()
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
end, { desc = "Pack Delete" })

vim.keymap.set("n", "<leader>lr", "<cmd>restart<cr>", { desc = "Restart" })
vim.keymap.set("n", "<leader>lh", "<cmd>checkhealth<cr>", { desc = "Cheak Health" })

vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Code Action" })

vim.keymap.set("n", "<M-n>", "<cmd>cnext<cr>", { desc = "Next Quickfix" })
vim.keymap.set("n", "<M-p>", "<cmd>cprev<cr>", { desc = "Prev Quickfix" })

vim.keymap.set("n", "<S-h>", "<cmd>bprevious<cr>", { desc = "Prev Buffer" })
vim.keymap.set("n", "<S-l>", "<cmd>bnext<cr>", { desc = "Next Buffer" })
