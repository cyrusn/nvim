vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

for _, dir in ipairs({ "config", "plugins" }) do
	for _, file in ipairs(vim.api.nvim_get_runtime_file("lua/" .. dir .. "/*.lua", true)) do
		local name = vim.fn.fnamemodify(file, ":t:r")
		require(dir .. "." .. name)
	end
end
