local mini_bufremove = require("mini.bufremove")

local function delete_buffer(buf)
	if vim.bo[buf].modified then
		local ok, choice =
			pcall(vim.fn.confirm, ("Save changes to %q?"):format(vim.fn.bufname(buf)), "&Yes\n&No\n&Cancel")
		if not ok or choice == 0 or choice == 3 then
			return
		end
		if choice == 1 then
			vim.api.nvim_buf_call(buf, vim.cmd.write)
		end
		return mini_bufremove.delete(buf, choice == 2)
	end

	return mini_bufremove.delete(buf)
end

vim.keymap.set("n", "<leader>bd", function()
	delete_buffer(vim.api.nvim_get_current_buf())
end, { desc = "Close Current Buffer" })
vim.keymap.set("n", "<leader>bo", function()
	local current = vim.api.nvim_get_current_buf()
	for _, buf in ipairs(vim.api.nvim_list_bufs()) do
		if buf ~= current and vim.bo[buf].buflisted then
			delete_buffer(buf)
		end
	end
end, { desc = "Close Other Buffers" })
vim.keymap.set("n", "<leader>b.", "<cmd>lua Snacks.scratch()<cr>", { desc = "Toggle Scratch Buffer" })
vim.keymap.set("n", "<leader>bs", "<cmd>lua Snacks.scratch.select()<cr>", { desc = "Select Scratch Buffer" })

vim.keymap.set("n", "<leader>gg", "<cmd>lua Snacks.lazygit()<cr>", { desc = "Lazygit" })
vim.keymap.set("n", "<leader>ut", "<cmd>lua Snacks.terminal()<cr>", { desc = "Terminal" })

vim.keymap.set("n", "<leader>cn", "<cmd>lua Snacks.rename.rename_file()<cr>", { desc = "Rename File" })
