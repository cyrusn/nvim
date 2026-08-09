vim.pack.add({ "https://github.com/stevearc/conform.nvim" })

vim.keymap.set({ "n", "v" }, "<leader>cf", function()
	require("conform").format({
		lsp_format = "fallback",
		async = false,
		timeout_ms = 1000,
	})
end, { desc = "Format" })

vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"

require("conform").setup({
	default_format_opts = {
		lsp_format = "fallback",
	},
	formatters_by_ft = {
		c = { "clang-format" },
		sh = { "beautysh" },
		fish = { "fish_indent" },
		go = { "goimports", "gofmt" },
		html = { "prettier" },
		css = { "prettier" },
		javascript = { "prettier" },
		typescript = { "prettier" },
		json = { "prettier" },
		lua = { "stylua" },
		markdown = { "markdownlint" },
		sql = { "sql_formatter" },
		vue = { "prettier" },
		yaml = { "yamlfmt" },
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
