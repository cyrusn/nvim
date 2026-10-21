vim.pack.add({
	"https://github.com/rafamadriz/friendly-snippets",
})

local snippets = require("mini.snippets")
local gen_loader = snippets.gen_loader

snippets.setup({
	snippets = {
		gen_loader.from_lang(),
	},
})
snippets.start_lsp_server({ match = false })

require("mini.completion").setup({
	window = {
		info = { border = "rounded" },
		signature = { border = "rounded" },
	},
})
