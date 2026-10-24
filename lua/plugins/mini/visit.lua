local MiniVisits = require("mini.visits")
local MiniExtra = require("mini.extra")

MiniVisits.setup()
MiniExtra.setup()

-- Create and select
local map_vis = function(keys, call, desc)
	local rhs = "<Cmd>lua MiniVisits." .. call .. "<CR>"
	vim.keymap.set("n", "<Leader>" .. keys, rhs, { desc = desc })
end

map_vis("vm", 'add_label("core")', "Add to core")
map_vis("vx", 'remove_label("core")', "Remove from core")
map_vis("vv", 'select_path(nil, { filter = "core" })', "Select core (cwd)")

-- Iterate based on recency
local sort_latest = MiniVisits.gen_sort.default({ recency_weight = 1 })
local map_iterate_core = function(lhs, direction, desc)
	local opts = { filter = "core", sort = sort_latest, wrap = true }
	local rhs = function()
		MiniVisits.iterate_paths(direction, vim.fn.getcwd(), opts)
	end
	vim.keymap.set("n", lhs, rhs, { desc = desc })
end

map_iterate_core("[v", "forward", "Core label (earlier)")
map_iterate_core("]v", "backward", "Core label (later)")
