local function toggle_window_option(option, key, name)
	vim.keymap.set("n", key, function()
		vim.wo[option] = not vim.wo[option]
	end, { desc = "Toggle " .. name })
end

toggle_window_option("spell", "<leader>us", "Spelling")
toggle_window_option("wrap", "<leader>uw", "Wrap")
toggle_window_option("relativenumber", "<leader>uL", "Relative Number")
toggle_window_option("number", "<leader>ul", "Line Number")

vim.keymap.set("n", "<leader>ud", function()
	vim.diagnostic.enable(not vim.diagnostic.is_enabled())
end, { desc = "Toggle Diagnostics" })

local conceal_on_level = vim.o.conceallevel > 0 and vim.o.conceallevel or 2
vim.keymap.set("n", "<leader>uc", function()
	vim.wo.conceallevel = vim.wo.conceallevel > 0 and 0 or conceal_on_level
end, { desc = "Toggle Conceal Level" })
