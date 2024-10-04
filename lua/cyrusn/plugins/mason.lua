return {
	"williamboman/mason.nvim",
	build = ":MasonUpdate",
	dependencies = {
		"williamboman/mason-lspconfig.nvim",
	},
	keys = { { "<leader>M", "<cmd>Mason<cr>", desc = "Mason" } },
	config = function()
		-- Mason
		local config = require("cyrusn.config")
		local servers = config.servers

		require("mason").setup()

		local lspconfig = require("lspconfig")
		local handlers = {}

		for key, val in pairs(servers) do
			if type(key) == "number" then
				handlers[val] = function()
					lspconfig[val].setup({})
				end
			else
				handlers[key] = function()
					lspconfig[key].setup(val)
				end
			end
		end

		require("mason-lspconfig").setup({
			ensure_installed = servers,
			automatic_servers_installation = true,
			handlers = handlers,
		})
	end,
}
