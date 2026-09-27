vim.g.copilot_no_tab_map = true

vim.pack.add({ "https://github.com/github/copilot.vim" })

vim.keymap.set("i", "<Tab>", function()
	if vim.fn.pumvisible() == 1 then
		return vim.api.nvim_replace_termcodes("<C-n>", true, false, true)
	end

	if MiniSnippets.session.get() ~= nil then
		MiniSnippets.session.jump("next")
		return ""
	end

	if require("sidekick").nes_jump_or_apply() then
		return ""
	end

	return vim.fn["copilot#Accept"]("\t")
end, {
	expr = true,
	replace_keycodes = false,
	desc = "Completion / Snippet / Sidekick / Copilot Accept",
})
