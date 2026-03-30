vim.keymap.set({ "n", "v" }, "<leader>cf", function()
	require("conform").format()
end, { desc = "Format" })

vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"

require("conform").setup({
	formatters_by_ft = {
		c = { "clang-format" },
		sh = { "beautysh" },
		fish = { "fish_indent", lsp_format = "fallback" },
		go = { "goimports", "gofmt" },
		html = { "prettier", lsp_format = "fallback" },
		css = { "prettier", lsp_format = "fallback" },
		javascript = { "prettier" },
		typescript = { "prettier" },
		json = { "prettier" },
		lua = { "stylua" },
		markdown = { "markdownlint" },
		python = { lsp_format = "fallback" },
		sql = { "sql_formatter" },
		toml = { lsp_format = "fallback" },
		vue = { "prettier" },
		yaml = { "yamlfmt" },
		dotenv = { "yamlfmt" },
		prisma = { lsp_format = "fallback" },
		["_"] = { "trim_whitespace" },
	},
	formatters = {
		fish_indent = {
			command = "fish_indent",
			args = { "$FILENAME" },
		},
		prettier = {
			prepend_args = {
				"--single-quote",
				"--trailing-comma=none",
				"--jsx-single-quote",
				"--ignore-path=.prettierignore",
				"--no-semi",
			},
		},
	},
})

vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
