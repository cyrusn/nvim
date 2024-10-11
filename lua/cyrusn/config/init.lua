local M = {}

function M.setup()
	local modules = {
		"options",
		"autocmds",
		"keymaps",
	}
	for _, mod in ipairs(modules) do
		require("cyrusn.config." .. mod)
	end
end

return M
