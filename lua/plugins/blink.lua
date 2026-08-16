vim.api.nvim_create_autocmd("PackChanged", {
	callback = function(ev)
		local name, kind = ev.data.spec.name, ev.data.kind
		if name == "blink.cmp" and (kind == "install" or kind == "update") then
			vim.system({ "cargo", "build", "--release" }, { cwd = ev.data.path }):wait()
		end
	end,
})

vim.pack.add({
	"https://github.com/saghen/blink.cmp",
	"https://github.com/saghen/blink.lib",
	"https://github.com/rafamadriz/friendly-snippets",
})

local cmp = require("blink.cmp")

cmp.build():wait(60000)

cmp.setup({
	keymap = {
		preset = "default",
		["<C-Space>"] = false,
		["<C-s>"] = { "show", "show_documentation", "hide_documentation" },
		["<TAB>"] = {
			"snippet_forward",
			function()
				return require("sidekick").nes_jump_or_apply()
			end,
			"fallback",
		},
	},
	signature = { enabled = true },
	fuzzy = { implementation = "prefer_rust" },
	completion = {
		menu = {
			auto_show = true,
			border = "rounded",
		},
		documentation = {
			auto_show = true,
			window = {
				border = "rounded",
			},
		},
	},
})
