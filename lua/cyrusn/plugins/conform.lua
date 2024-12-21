return {
	"stevearc/conform.nvim",
	lazy = false,
	keys = {
		{
			"<leader>f",
			function()
				require("conform").format()
			end,
			desc = "Format",
			mode = { "n", "v" },
		},
	},
	init = function()
		vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
	end,
	config = function()
		require("conform").setup({
			formatters_by_ft = {
				c = { "clang-format" },
				sh = { "beautysh" },
				fish = { "fish_indent" },
				go = { "goimports", "gofmt" },
				html = { "prettier" },
				javascript = { "prettier" },
				json = { "prettier" },
				lua = { "stylua" },
				markdown = { "markdownlint" },
				python = { "black" },
				sql = { "sql_formatter" },
				vue = { "prettier" },
				yaml = { "yamlfmt" },
				dotenv = { "yamlfmt" },
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
		vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
	end,
}
