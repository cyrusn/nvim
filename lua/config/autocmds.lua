-- Highlight on yank
vim.api.nvim_create_autocmd("TextYankPost", {
	group = vim.api.nvim_create_augroup("cyrusn_highlight_yank", { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})

-- remember last edit position
vim.api.nvim_create_autocmd("BufReadPost", {
	group = vim.api.nvim_create_augroup("cyrusn_last_loc", { clear = true }),
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
	group = vim.api.nvim_create_augroup("cyrusn_markdown_settings", { clear = true }),
	pattern = { "gitcommit", "markdown" },
	callback = function()
		vim.opt_local.wrap = true
		vim.opt_local.spell = true
		vim.opt_local.conceallevel = 1 -- Hide * markup for bold and italic
	end,
})

vim.api.nvim_create_autocmd("FileType", {
	group = vim.api.nvim_create_augroup("treesitter_highlight", { clear = true }),
	callback = function(ev)
		local _, lang = ev.match, vim.treesitter.language.get_lang(ev.match)
		-- highlighting
		pcall(vim.treesitter.start, ev.buf, lang)
	end,
})

vim.api.nvim_create_autocmd("VimEnter", {
	group = vim.api.nvim_create_augroup("cyrusn_snacks_toggle", { clear = true }),
	callback = function()
		local toggle = require("snacks.toggle")
		toggle.option("spell", { name = "Spelling" }):map("<leader>us")
		toggle.option("wrap", { name = "Wrap" }):map("<leader>uw")
		toggle.option("relativenumber", { name = "Relative Number" }):map("<leader>uL")
		toggle.diagnostics():map("<leader>ud")
		toggle.line_number():map("<leader>ul")
		toggle.treesitter():map("<leader>uT")
		toggle.option("background", { off = "light", on = "dark", name = "Dark Background" }):map("<leader>ub")
		toggle.inlay_hints():map("<leader>uh")
		toggle.indent():map("<leader>ug")
		toggle.dim():map("<leader>uD")
		toggle.zen():map("<leader>uz")
		toggle
			.option(
				"conceallevel",
				{ off = 0, on = vim.o.conceallevel > 0 and vim.o.conceallevel or 2, name = "Conceal Level" }
			)
			:map("<leader>uc")
	end,
})
