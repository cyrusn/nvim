vim.api.nvim_create_autocmd("PackChanged", {
	callback = function(ev)
		local name, kind = ev.data.spec.name, ev.data.kind
		if name == "nvim-treesitter" and (kind == "install" or kind == "update") then
			vim.cmd("TSUpdate")
		end
	end,
})

vim.pack.add({ "https://github.com/nvim-treesitter/nvim-treesitter" })

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
		pcall(vim.treesitter.start, ev.buf, lang)
	end,
})
