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
		["<C-l>"] = { "show", "show_documentation", "hide_documentation" },
		["<C-space>"] = false,
		["<C-u>"] = { "scroll_documentation_up", "fallback" },
		["<C-d>"] = { "scroll_documentation_down", "fallback" },
		["<Tab>"] = {
			"snippet_forward",
			function() -- sidekick next edit suggestion
				return require("sidekick").nes_jump_or_apply()
			end,
			function() -- if you are using Neovim's native inline completions
				return vim.lsp.inline_completion.get()
			end,
			"fallback",
		},
	},
	signature = { enabled = true },
	fuzzy = { implementation = "prefer_rust" },
	completion = {
		menu = {
			auto_show = true,
		},
	},
})
