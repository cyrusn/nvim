vim.pack.add({ { src = "https://github.com/folke/persistence.nvim" } })

vim.keymap.set("n", "<leader>ww", function()
	require("persistence").load()
end, { desc = "Load" })
vim.keymap.set("n", "<leader>ws", function()
	require("persistence").select()
end, { desc = "Select" })
vim.keymap.set("n", "<leader>wl", function()
	require("persistence").load({ last = true })
end, { desc = "Last" })
vim.keymap.set("n", "<leader>wd", function()
	require("persistence").stop()
end, { desc = "Stop" })

-- auto load session
vim.api.nvim_create_autocmd("VimEnter", {
	group = vim.api.nvim_create_augroup("cyrusn_load_session", { clear = true }),
	callback = function()
		local ok, _ = pcall(require, "persistence")
		if ok then
			vim.defer_fn(function()
				require("persistence").load()
			end, 100) -- Delay by 100ms, for loading of treesitter
		end
	end,
	nested = true,
})

require("persistence").setup()
