require("nvim-treesitter").install({
	"bash",
	"comment",
	"css",
	"gitcommit",
	"html",
	"javascript",
	"lua",
	"markdown",
	"markdown_inline",
	"go",
	"python",
	"toml",
	"vim",
	"vimdoc",
	"yaml",
	"json",
})

vim.api.nvim_create_autocmd("FileType", {
	group = vim.api.nvim_create_augroup("treesitter_highlight", { clear = true }),
	callback = function(ev)
		local _, lang = ev.match, vim.treesitter.language.get_lang(ev.match)
		-- highlighting
		pcall(vim.treesitter.start, ev.buf, lang)
	end,
})

