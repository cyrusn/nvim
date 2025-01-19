local M = {}

function M.setup()
	local modules = {
		"options",
		"autocmds",
		"keymaps",
		"statusline",
	}
	for _, mod in ipairs(modules) do
		require("cyrusn.config." .. mod)
	end
end

return M
