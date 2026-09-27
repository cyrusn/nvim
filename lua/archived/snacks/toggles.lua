vim.api.nvim_create_autocmd("VimEnter", {
	group = vim.api.nvim_create_augroup("cyrusn_snacks_toggle", { clear = true }),
	callback = function()
		local toggle = require("snacks.toggle")
		toggle.animate():map("<leader>ua")
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
		toggle.words():map("<leader>uW")
		toggle.scroll():map("<leader>uS")
		toggle
			.option(
				"conceallevel",
				{ off = 0, on = vim.o.conceallevel > 0 and vim.o.conceallevel or 2, name = "Conceal Level" }
			)
			:map("<leader>uc")
	end,
})
