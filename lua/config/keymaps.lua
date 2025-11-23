vim.keymap.set("n", "<leader>l", "<cmd>Lazy<cr>", { desc = "Lazy" })

local toggle = require("snacks.toggle")
toggle.option("spell", { name = "Spelling" }):map("<leader>us")
toggle.option("wrap", { name = "Wrap" }):map("<leader>uw")
toggle.option("relativenumber", { name = "Relative Number" }):map("<leader>uL")
toggle.diagnostics():map("<leader>ud")
toggle.line_number():map("<leader>ul")
toggle.treesitter():map("<leader>uT")
toggle.dim():map("<leader>uD")
toggle.indent():map("<leader>ug")
toggle
	.option("conceallevel", { off = 0, on = vim.o.conceallevel > 0 and vim.o.conceallevel or 2, name = "Conceal Level" })
	:map("<leader>uc")
