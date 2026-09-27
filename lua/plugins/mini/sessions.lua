local project_root = function()
	local cwd = vim.uv.cwd()
	return vim.fs.root(0, { ".git" }) or vim.fs.root(cwd, { ".git" }) or cwd
end

local session_name = function()
	local root = project_root()
	local basename = vim.fs.basename(root)
	if basename == "" then
		basename = "root"
	end

	return string.format("%s-%s", basename, vim.fn.sha256(root):sub(1, 12))
end

local legacy_session_name = function()
	return vim.fn.fnamemodify(vim.fn.getcwd(), ":t")
end

local load_project_session = function()
	local name = session_name()
	if MiniSessions.detected[name] then
		MiniSessions.read(name)
		return
	end

	local legacy_name = legacy_session_name()
	if MiniSessions.detected[legacy_name] then
		vim.notify(
			string.format("Loading legacy session %s; it will migrate on exit", legacy_name),
			vim.log.levels.INFO
		)
		MiniSessions.read(legacy_name)
		return
	end

	vim.notify(string.format("No session found for %s", project_root()), vim.log.levels.INFO)
end

local mini_sessions_opts = {
	directory = vim.fn.stdpath("data") .. "/session",
	autoread = false,
	autowrite = false,
}

require("mini.sessions").setup(mini_sessions_opts)

vim.api.nvim_create_autocmd("VimLeavePre", {
	group = vim.api.nvim_create_augroup("MiniSessionsAutoSave", { clear = true }),
	callback = function()
		require("mini.sessions").write(session_name())
	end,
})

vim.keymap.set("n", "<leader>ql", load_project_session, { desc = "Load Project Session" })
vim.keymap.set("n", "<leader>qs", "<cmd>lua MiniSessions.select()<cr>", { desc = "Select Session" })
vim.keymap.set("n", "<leader>qd", '<cmd>lua MiniSessions.select("delete")<cr>', { desc = "Delete Session" })
vim.keymap.set("n", "<leader>lr", "<cmd>lua require('mini.sessions').restart()<cr>", { desc = "Restart" })
