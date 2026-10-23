vim.pack.add({
	"https://github.com/mason-org/mason.nvim",
	"https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim",
	"https://github.com/mason-org/mason-lspconfig.nvim",
	"https://github.com/neovim/nvim-lspconfig",
})

local capabilities = vim.tbl_deep_extend(
	"force",
	vim.lsp.protocol.make_client_capabilities(),
	require("mini.completion").get_lsp_capabilities()
)

local lsp_servers = {
	lua_ls = {
		settings = {
			Lua = {
				diagnostics = {
					globals = {
						"vim",
						"require",
						"MiniCompletion",
						"MiniExtra",
						"MiniVisits",
						"MiniPick",
						"MiniSessions",
						"MiniSnippets",
						"Snacks",
					},
				},
				codeLens = { enable = true },
			},
		},
	},
	eslint = {
		javascript = {
			settings = {
				implicitProjectConfiguration = {
					checkJs = true,
				},
			},
		},
	},
	emmet_ls = {
		filetypes = {
			"css",
			"eruby",
			"html",
			"javascript",
			"javascriptreact",
			"less",
			"sass",
			"scss",
			"svelte",
			"pug",
			"typescriptreact",
			"vue",
		},
	},
	html = {
		filetypes = { "html", "templ" },
		init_options = {
			configurationSection = { "html", "css", "javascript" },
			embeddedLanguages = {
				css = true,
				javascript = true,
			},
			provideFormatter = true,
		},
	},
	ts_ls = {},
	gopls = {},
	basedpyright = {},
}

vim.keymap.set("n", "<leader>lm", "<cmd>Mason<cr>", { desc = "Mason" })

vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("cyrusn_lsp_keymaps", { clear = true }),
	callback = function(event)
		local map = function(mode, lhs, rhs, desc)
			vim.keymap.set(mode, lhs, rhs, { buffer = event.buf, desc = desc })
		end

		map("n", "K", vim.lsp.buf.hover, "Hover")
		map("n", "gd", vim.lsp.buf.definition, "Definition")
		map("n", "gD", vim.lsp.buf.declaration, "Declaration")
		map("n", "gr", vim.lsp.buf.references, "References")
		map("n", "<leader>rn", vim.lsp.buf.rename, "Rename")
		map("n", "<leader>ca", vim.lsp.buf.code_action, "Code Action")
		map("n", "[d", vim.diagnostic.goto_prev, "Previous Diagnostic")
		map("n", "]d", vim.diagnostic.goto_next, "Next Diagnostic")
		map("n", "gl", vim.diagnostic.open_float, "Line Diagnostics")
		map("i", "<C-k>", vim.lsp.buf.signature_help, "Signature Help")
	end,
})

require("mason").setup({})

require("mason-lspconfig").setup({
	automatic_enable = false,
})

local ensure_installed = vim.tbl_keys(lsp_servers)
ensure_installed[#ensure_installed + 1] = "copilot"

local enabled_servers = {}

local function enable_available_servers()
	local unavailable = {}
	for _, server in ipairs(ensure_installed) do
		local server_config = vim.lsp.config[server]
		local cmd = server_config and server_config.cmd
		local executable = type(cmd) == "table" and cmd[1] or nil
		if not enabled_servers[server] then
			if type(executable) == "string" and vim.fn.executable(executable) == 1 then
				vim.lsp.enable(server)
				enabled_servers[server] = true
			else
				unavailable[#unavailable + 1] = server
			end
		end
	end
	return unavailable
end

local installer_errors = {}
local original_notify
local filtered_notify

local function report_install_result()
	if filtered_notify and vim.notify == filtered_notify then
		vim.notify = original_notify
	end
	filtered_notify = nil

	local unavailable = enable_available_servers()
	local failed_packages = {}
	for _, message in ipairs(installer_errors) do
		failed_packages[#failed_packages + 1] = message:gsub(": failed to install$", "")
	end
	installer_errors = {}

	if #failed_packages == 0 and #unavailable == 0 then
		return
	end

	local details = {}
	if #failed_packages > 0 then
		details[#details + 1] = "install failed: " .. table.concat(failed_packages, ", ")
	end
	if #unavailable > 0 then
		details[#details + 1] = "LSP unavailable: " .. table.concat(unavailable, ", ")
	end
	vim.notify(table.concat(details, "; "), vim.log.levels.WARN, { title = "Mason" })
end

vim.api.nvim_create_autocmd("User", {
	group = vim.api.nvim_create_augroup("cyrusn_mason_install_notifications", { clear = true }),
	pattern = "MasonToolsStartingInstall",
	callback = function()
		installer_errors = {}
		original_notify = vim.notify
		filtered_notify = function(message, level, opts)
			if opts and opts.title == "mason-tool-installer" and level == vim.log.levels.ERROR then
				installer_errors[#installer_errors + 1] = tostring(message)
				return
			end
			return original_notify(message, level, opts)
		end
		vim.notify = filtered_notify
	end,
})

vim.api.nvim_create_autocmd("User", {
	group = vim.api.nvim_create_augroup("cyrusn_mason_install_complete", { clear = true }),
	pattern = "MasonToolsUpdateCompleted",
	callback = report_install_result,
})

require("mason-tool-installer").setup({
	ensure_installed = ensure_installed,
	run_on_start = true,
})

for server, config in pairs(lsp_servers) do
	config.capabilities = capabilities
	vim.lsp.config(server, config)
end

enable_available_servers()
