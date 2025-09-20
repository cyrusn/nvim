vim.pack.add({
	{ src = "https://github.com/stevearc/conform.nvim" },
})

vim.keymap.set({ "n", "v" }, "<leader>f", function()
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
		python = { "flake8", lsp_format = "fallback" },
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
		-- format_on_save = {
		-- 	-- These options will be passed to conform.format()
		-- 	timeout_ms = 500,
		-- 	lsp_fallback = true,
		-- },
	},
})
