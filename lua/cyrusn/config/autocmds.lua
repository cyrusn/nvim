local function augroup(name)
	return vim.api.nvim_create_augroup("cyrusn_" .. name, { clear = true })
end

-- Highlight on yank
vim.api.nvim_create_autocmd("TextYankPost", {
	group = augroup("highlight_yank"),
	callback = function()
		vim.highlight.on_yank()
	end,
})

-- remember last edit position
vim.api.nvim_create_autocmd("BufReadPost", {
	group = augroup("last_loc"),
	callback = function(event)
		local exclude = { "gitcommit" }
		local buf = event.buf
		if vim.tbl_contains(exclude, vim.bo[buf].filetype) or vim.b[buf].lazyvim_last_loc then
			return
		end
		vim.b[buf].lazyvim_last_loc = true
		local mark = vim.api.nvim_buf_get_mark(buf, '"')
		local lcount = vim.api.nvim_buf_line_count(buf)
		if mark[1] > 0 and mark[1] <= lcount then
			pcall(vim.api.nvim_win_set_cursor, 0, mark)
		end
	end,
})

-- settings for markdown and git commit
vim.api.nvim_create_autocmd("FileType", {
	group = augroup("markdown_settings"),
	pattern = { "gitcommit", "markdown" },
	callback = function()
		vim.opt_local.wrap = true
		vim.opt_local.spell = true
		vim.opt_local.conceallevel = 1 -- Hide * markup for bold and italic
	end,
})

-- auto load session
vim.api.nvim_create_autocmd("VimEnter", {
	group = augroup("load_session"),
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

vim.api.nvim_create_autocmd("LspAttach", {
	callback = function(event)
		local bufmap = function(mode, rhs, lhs, desc)
			vim.keymap.set(mode, rhs, lhs, { buffer = event.buf, desc = desc })
		end

		bufmap("n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<cr>", "Code Action")
		bufmap("n", "<leader>cr", "<cmd>lua vim.lsp.buf.rename()<cr>", "LSP Rename")

		-- +diagnostics
		bufmap("n", "<leader>cl", "<cmd>lua vim.diagnostic.open_float()<cr>", "Show Line Diagnostics")
	end,
})
