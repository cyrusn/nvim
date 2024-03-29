return {
	"neovim/nvim-lspconfig",
	cmd = { "LspInfo", "LspInstall", "LspStart" },
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"VonHeikemen/lsp-zero.nvim",
		"hrsh7th/cmp-nvim-lsp",
		"williamboman/mason-lspconfig.nvim",
	},
	config = function()
		local config = require("cyrusn.config")
		local servers = config.servers
		local diagnostic_icons = config.icons.diagnostics

		local lsp_zero = require("lsp-zero")

		lsp_zero.extend_lspconfig()

		lsp_zero.on_attach(function(_, bufnr)
			-- see :help lsp-zero-keybindings
			-- to learn the available actions
			lsp_zero.default_keymaps({
				buffer = bufnr,
				exclude = { "<F2>", "<F3>", "<F4>" },
			})

			-- setup which-key when attach buffer
			-- config.set_which_key({
			-- 	["<leader>c"] = { name = "+code" },
			-- 	["<leader>d"] = { name = "+diagnostic" },
			-- }, { buffer = bufnr })

			local map = function(mode, l, r, desc, opts)
				opts = opts or {}
				opts.buffer = bufnr
				opts.desc = desc
				return vim.keymap.set(mode, l, r, opts)
			end

			-- +code
			map("n", "<leader>ca", vim.lsp.buf.code_action, "Code Action")
			map("n", "<leader>cr", vim.lsp.buf.rename, "LSP Rename")
			map("n", "<leader>ci", "<cmd>LspInfo<cr>", "LSP Info")
			map("n", "<leader>cd", "<cmd>Telescope lsp_definitions<cr>", "Definition")
			map("n", "<leader>ct", "<cmd>Telescope lsp_type_definitions<cr>", "Type Definition")
			map("n", "<leader>cR", "<cmd>Telescope lsp_references<cr>", "LSP References")
			map("n", "<leader>cI", "<cmd>Telescope lsp_implementations<cr>", "LSP Implementations")

			-- +diagnostics
			map("n", "<leader>db", "<cmd>Telescope diagnostics bufnr=0<cr>", "Show Buffer Diagnostics")
			map("n", "<leader>df", vim.diagnostic.open_float, "Show Line Diagnostics")
			map("n", "[d", vim.diagnostic.goto_prev, "Prev Diagnostic")
			map("n", "]d", vim.diagnostic.goto_next, "Next Diagnostic")
		end)

		lsp_zero.set_sign_icons(diagnostic_icons)

		require("mason").setup({})

		local lspconfig = require("lspconfig")
		local handlers = {
			lsp_zero.default_setup,

			lua_ls = function()
				local lua_opts = lsp_zero.nvim_lua_ls()
				lspconfig.lua_ls.setup(lua_opts)
			end,
		}

		local server_configs = config.server_configs

		for server, _config in pairs(server_configs) do
			handlers[server] = function()
				lspconfig[server].setup(_config)
			end
		end

		require("mason-lspconfig").setup({
			ensure_installed = servers,
			automatic_servers_installation = true,
			handlers = handlers,
		})

		lsp_zero.setup_servers(servers)
	end,
}
