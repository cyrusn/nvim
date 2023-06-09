local status_ok, lsp = pcall(require, "lsp-zero")

if not status_ok then
	return
end

lsp.preset({})

-- Fix Undefined global 'vim'
lsp.nvim_workspace()

lsp.on_attach(function()
	-- 	lsp.buffer_autoformat()
end)

lsp.format_on_save({
	servers = {
		["lua_ls"] = { "lua" },
		["rust_analyzer"] = { "rust" },
		["null-ls"] = { "html", "javascript", "json", "markdown" },
	},
})

lsp.ensure_installed({
	"lua_ls",
	"rust_analyzer",
})

lsp.set_sign_icons(require("user.icons").diagnostics)

lsp.setup({})
