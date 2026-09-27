local submodules = {
	"mini",
	"snacks",
	"colorscheme",
}

for _, dir in ipairs(submodules) do
	local files = vim.api.nvim_get_runtime_file("lua/plugins/" .. dir .. "/*.lua", true)
	local has_core = false

	for _, file in ipairs(files) do
		if vim.fn.fnamemodify(file, ":t") == "index.lua" then
			has_core = true
			break
		end
	end

	if has_core then
		require("plugins." .. dir .. ".index")
	end

	for _, file in ipairs(files) do
		local name = vim.fn.fnamemodify(file, ":t:r")
		if name ~= "index" then
			require("plugins." .. dir .. "." .. name)
		end
	end
end
