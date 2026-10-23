local MiniVisits = require("mini.visits")
local MiniExtra = require("mini.extra")

MiniVisits.setup()
MiniExtra.setup()

local map = vim.keymap.set

-- Remembers the currently active topic label (defaults to "core")
local active_label = "core"

map("n", "]v", function()
	MiniVisits.iterate_paths("forward", vim.fn.getcwd(), { filter = active_label, wrap = true })
end, { desc = "Next active visit" })

map("n", "[v", function()
	MiniVisits.iterate_paths("backward", vim.fn.getcwd(), { filter = active_label, wrap = true })
end, { desc = "Previous active visit" })

local function is_valid_file_buffer(buf)
	local path = vim.api.nvim_buf_get_name(buf)
	return path ~= "" and vim.bo[buf].buftype == "", path
end

-- ---------------------------------------------------------------------------
-- 1. Recent Files (Frecency)
-- ---------------------------------------------------------------------------

-- vf: pick recent files in current project (cwd)
map("n", "<Leader>vf", function()
	MiniExtra.pickers.visit_paths({ cwd = vim.fn.getcwd() })
end, { desc = "Recent (cwd)" })

-- vF: pick recent files across all projects (global)
map("n", "<Leader>vF", function()
	MiniExtra.pickers.visit_paths({ cwd = "" })
end, { desc = "Recent (all)" })

-- ---------------------------------------------------------------------------
-- 2. Fast Bookmarks ('core' label)
-- ---------------------------------------------------------------------------

-- vb: toggle current file in 'core' bookmark
map("n", "<Leader>vb", function()
	local ok, path = is_valid_file_buffer(0)
	if not ok then
		vim.notify("Not a valid file buffer", vim.log.levels.WARN)
		return
	end

	local labels = MiniVisits.list_labels(path)
	if vim.list_contains(labels, "core") then
		MiniVisits.remove_label("core", path)
		vim.notify(string.format("Bookmark removed: %s", vim.fs.basename(path)), vim.log.levels.INFO)
	else
		MiniVisits.add_label("core", path)
		vim.notify(string.format("Bookmark added: %s", vim.fs.basename(path)), vim.log.levels.INFO)
	end
end, { desc = "Toggle core" })

-- vc: pick files in 'core' bookmark
map("n", "<Leader>vc", function()
	MiniExtra.pickers.visit_paths({ cwd = vim.fn.getcwd(), filter = "core" })
end, { desc = "Pick core" })

-- ---------------------------------------------------------------------------
-- 3. Topic Labels
-- ---------------------------------------------------------------------------

-- vm: toggle current file in active label
map("n", "<Leader>vm", function()
	local ok, path = is_valid_file_buffer(0)
	if not ok then
		vim.notify("Not a valid file buffer", vim.log.levels.WARN)
		return
	end

	local labels = MiniVisits.list_labels(path)
	if vim.list_contains(labels, active_label) then
		MiniVisits.remove_label(active_label, path)
		vim.notify(string.format("Removed [%s] from %s", active_label, vim.fs.basename(path)), vim.log.levels.INFO)
	else
		MiniVisits.add_label(active_label, path)
		vim.notify(string.format("Added [%s] to %s", active_label, vim.fs.basename(path)), vim.log.levels.INFO)
	end
end, { desc = "Toggle active" })

-- va: create a new label, set as active, and tag current file
map("n", "<Leader>va", function()
	local ok, path = is_valid_file_buffer(0)
	if not ok then
		vim.notify("Not a valid file buffer", vim.log.levels.WARN)
		return
	end

	vim.ui.input({ prompt = "New label name: " }, function(input)
		if input and input ~= "" then
			active_label = input
			MiniVisits.add_label(input, path)
			vim.notify(
				string.format("Created label [%s] & added to %s", input, vim.fs.basename(path)),
				vim.log.levels.INFO
			)
		end
	end)
end, { desc = "New label" })

-- vl: pick files in current active label
map("n", "<Leader>vv", function()
	MiniExtra.pickers.visit_paths({ filter = active_label })
end, { desc = "Pick active" })

-- vL: list all labels and select to set active
map("n", "<Leader>vl", function()
	local all_labels = MiniVisits.list_labels()
	if #all_labels == 0 then
		vim.notify("No labels found", vim.log.levels.WARN)
		return
	end

	vim.ui.select(all_labels, {
		prompt = string.format("Set active label (current: '%s'): ", active_label),
	}, function(choice)
		if choice then
			active_label = choice
			vim.notify(string.format("Active label set to '%s'", active_label), vim.log.levels.INFO)
		end
	end)
end, { desc = "List labels" })

-- ---------------------------------------------------------------------------
-- 4. Cleanup
-- ---------------------------------------------------------------------------

-- vD: completely delete a label across all files
map("n", "<Leader>vD", function()
	local all_labels = MiniVisits.list_labels()
	if #all_labels == 0 then
		vim.notify("No labels found", vim.log.levels.INFO)
		return
	end

	vim.ui.select(all_labels, {
		prompt = "DELETE label globally (all files): ",
	}, function(choice)
		if choice then
			MiniVisits.remove_label(choice, "")
			if active_label == choice then
				active_label = "core"
			end
			vim.notify(string.format("Deleted label '%s' globally", choice), vim.log.levels.INFO)
		end
	end)
end, { desc = "Delete label" })
