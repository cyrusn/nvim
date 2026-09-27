require("mini.pick").setup({
	mappings = {
		refine = "<C-y>",
		refine_marked = "<C-q>",
	},
	window = {
		config = {
			border = "rounded",
			relative = "cursor",
			anchor = "NW",
			row = 2,
			col = 4,
			width = 80,
			height = 15,
		},
	},
})

local function buffer_var(buf, name)
	local ok, value = pcall(vim.api.nvim_buf_get_var, buf, name)
	return { exists = ok, value = value }
end

local function restore_buffer_var(buf, name, saved)
	if saved.exists then
		vim.api.nvim_buf_set_var(buf, name, saved.value)
	elseif pcall(vim.api.nvim_buf_get_var, buf, name) then
		vim.api.nvim_buf_del_var(buf, name)
	end
end

local suppressions, active_buf = {}, nil

vim.api.nvim_create_autocmd("User", {
	group = vim.api.nvim_create_augroup("cyrusn_minipick_completion", { clear = true }),
	pattern = "MiniPickStart",
	callback = function()
		local state = MiniPick.get_picker_state()
		local win = state and state.windows.target
		if not win or not vim.api.nvim_win_is_valid(win) then
			return
		end

		local buf = vim.api.nvim_win_get_buf(win)
		if vim.bo[buf].buftype == "prompt" then
			return
		end

		local state = suppressions[buf]
		if not state then
			state = {
				count = 0,
				buf = buf,
				win = win,
				minicompletion_disable = buffer_var(buf, "minicompletion_disable"),
				copilot_disabled = buffer_var(buf, "copilot_disabled"),
			}
			suppressions[buf] = state
			vim.api.nvim_buf_set_var(buf, "minicompletion_disable", true)
			vim.api.nvim_buf_set_var(buf, "copilot_disabled", true)

			if MiniCompletion then
				MiniCompletion.stop()
			end

			vim.api.nvim_win_call(win, function()
				if vim.fn.pumvisible() == 1 and vim.fn.mode(1):find("i", 1, true) then
					vim.fn.complete(vim.fn.col("."), {})
				end
				vim.fn["copilot#Clear"]()
			end)
			vim.api.nvim_buf_clear_namespace(buf, vim.fn["copilot#NvimNs"](), 0, -1)
		end
		state.count = state.count + 1
		active_buf = buf
	end,
})

vim.api.nvim_create_autocmd("User", {
	group = vim.api.nvim_create_augroup("cyrusn_minipick_completion_restore", { clear = true }),
	pattern = "MiniPickStop",
	callback = function()
		local buf = active_buf
		active_buf = nil
		local state = buf and suppressions[buf]
		if not state then
			return
		end
		state.count = state.count - 1
		vim.defer_fn(function()
			if suppressions[buf] ~= state or state.count > 0 then
				return
			end
			suppressions[buf] = nil
			if not vim.api.nvim_buf_is_valid(buf) then
				return
			end

			restore_buffer_var(buf, "minicompletion_disable", state.minicompletion_disable)
			restore_buffer_var(buf, "copilot_disabled", state.copilot_disabled)
			if vim.api.nvim_win_is_valid(state.win) and vim.api.nvim_win_get_buf(state.win) == buf then
				vim.api.nvim_win_call(state.win, function()
					vim.fn["copilot#Schedule"]()
				end)
			end
		end, 10)
	end,
})

local function normalize_dir(path)
	path = vim.fn.fnamemodify(path, ":p")
	if path ~= "/" then
		path = path:gsub("/+$", "")
	end
	return path
end

local function file_items(cwd, include_recent)
	cwd = normalize_dir(cwd)
	if vim.fn.executable("rg") ~= 1 then
		if include_recent then
			vim.notify("Smart search requires ripgrep (`rg`) to combine recent and hidden files.", vim.log.levels.WARN)
		end
		MiniPick.builtin.files({ tool = "fallback" }, {
			source = {
				cwd = cwd,
				name = include_recent and "Smart" or "Files",
			},
		})
		return
	end

	local recent = {}
	local prefix = cwd .. "/"
	if include_recent then
		for _, oldfile in ipairs(vim.v.oldfiles) do
			local path = vim.fn.fnamemodify(oldfile, ":p")
			if path:sub(1, #prefix) == prefix and vim.fn.filereadable(path) == 1 then
				recent[#recent + 1] = path:sub(#prefix + 1)
			end
		end
	end

	MiniPick.start({
		source = {
			items = function()
				vim.schedule(function()
					MiniPick.set_picker_items_from_cli({ "rg", "--files", "--hidden", "-g", "!.git/**" }, {
						spawn_opts = { cwd = cwd },
						postprocess = function(paths)
							local items, seen = {}, {}
							for _, path in ipairs(recent) do
								if not seen[path] then
									seen[path] = true
									items[#items + 1] = path
								end
							end
							for _, path in ipairs(paths) do
								if not seen[path] then
									seen[path] = true
									items[#items + 1] = path
								end
							end
							return items
						end,
					})
				end)
				return recent
			end,
			name = include_recent and "Smart" or "Files",
			cwd = cwd,
		},
	})
end

local function git_status()
	local cwd = normalize_dir(vim.fn.getcwd())
	local result = vim.system({
		"git",
		"status",
		"--short",
		"--untracked-files=all",
		"--porcelain=v1",
		"-z",
	}, { cwd = cwd, text = false }):wait()
	if result.code ~= 0 then
		vim.notify(("Git status failed: %s"):format(result.stderr or "git error"), vim.log.levels.ERROR)
		return
	end

	local lines = vim.split(result.stdout or "", "\0", { plain = true, trimempty = true })
	local items, index = {}, 1
	while index <= #lines do
		local entry = lines[index]
		local status, path = entry:sub(1, 2), entry:sub(4)
		if path ~= "" then
			items[#items + 1] = { path = path, text = status .. " " .. path }
		end
		if status:find("[RC]") then
			index = index + 1
		end
		index = index + 1
	end

	MiniPick.start({
		source = {
			items = items,
			name = "Git Status",
			cwd = cwd,
		},
	})
end

local function projects()
	local roots, seen = {}, {}
	for _, oldfile in ipairs(vim.v.oldfiles) do
		local path = vim.fn.fnamemodify(oldfile, ":p")
		if vim.fn.filereadable(path) == 1 then
			local root = vim.fs.root(path, { ".git" }) or vim.fn.fnamemodify(path, ":h")
			root = normalize_dir(root)
			if not seen[root] then
				seen[root] = true
				roots[#roots + 1] = root
			end
		end
	end
	if #roots == 0 then
		vim.notify("No recent project paths are available.", vim.log.levels.INFO)
		return
	end

	MiniPick.start({
		source = {
			items = roots,
			name = "Projects",
			choose = function(root)
				local state = MiniPick.get_picker_state()
				if state and vim.api.nvim_win_is_valid(state.windows.target) then
					vim.api.nvim_win_call(state.windows.target, function()
						vim.cmd.lcd(vim.fn.fnameescape(root))
					end)
				end
				vim.schedule(function()
					file_items(root, false)
				end)
			end,
		},
	})
end

local function pickers()
	local names = vim.tbl_keys(MiniPick.registry)
	table.sort(names)
	MiniPick.start({
		source = {
			items = names,
			name = "Pickers",
			choose = function(name)
				local picker = MiniPick.registry[name]
				if picker then
					vim.schedule(picker)
				end
			end,
		},
	})
end

local function undo_history()
	local buf = vim.api.nvim_get_current_buf()
	local tree = vim.fn.undotree()
	if #tree.entries == 0 then
		vim.notify("No undo history for this buffer.", vim.log.levels.INFO)
		return
	end
	local items = {}
	for _, entry in ipairs(tree.entries) do
		local time = entry.time and os.date("%Y-%m-%d %H:%M:%S", entry.time) or ""
		items[#items + 1] = {
			seq = entry.seq,
			text = ("#%d%s  %s"):format(entry.seq, entry.seq == tree.seq_cur and " (current)" or "", time),
		}
	end
	table.sort(items, function(a, b)
		return a.seq > b.seq
	end)
	items[#items + 1] = { seq = 0, text = "Initial state (before changes)" }

	MiniPick.start({
		source = {
			items = items,
			name = "Undo History",
			choose = function(item)
				vim.api.nvim_buf_call(buf, function()
					vim.cmd("undo " .. item.seq)
				end)
			end,
		},
	})
end

local function send_to_sidekick()
	local matches = MiniPick.get_picker_matches()
	if not matches then
		return
	end
	local selected = #matches.marked > 0 and matches.marked or { matches.current }
	local locations = {}
	for _, item in ipairs(selected) do
		if item then
			if type(item) == "string" then
				local parts = vim.split(item, "\0", { plain = true })
				locations[#locations + 1] = {
					name = parts[1],
					cwd = MiniPick.get_picker_opts().source.cwd or vim.fn.getcwd(),
				}
			elseif type(item) == "table" then
				local name = item.path
				if not name and item.bufnr then
					name = vim.api.nvim_buf_get_name(item.bufnr)
				end
				if name and name ~= "" then
					locations[#locations + 1] = {
						name = name,
						buf = item.bufnr,
						cwd = MiniPick.get_picker_opts().source.cwd or vim.fn.getcwd(),
						row = item.lnum,
						col = item.col,
					}
				end
			end
		end
	end
	if #locations == 0 then
		vim.notify("The selected picker item has no file location.", vim.log.levels.WARN)
		return
	end
	require("sidekick.cli.picker")._send_cb()(locations)
	return true
end

MiniPick.config.mappings.send_to_sidekick = {
	char = "<M-a>",
	func = send_to_sidekick,
}

MiniPick.registry.smart = function()
	file_items(vim.fn.getcwd(), true)
end
MiniPick.registry.files = function()
	file_items(vim.fn.getcwd(), false)
end
MiniPick.registry.config_files = function()
	file_items(vim.fn.stdpath("config"), false)
end
MiniPick.registry.git_status = git_status
MiniPick.registry.projects = projects

MiniPick.registry.pickers = pickers
MiniPick.registry.undo_history = undo_history

vim.keymap.set("n", "<leader><space>", MiniPick.registry.smart, { desc = "Smart Search" })
vim.keymap.set("n", "<leader>,", MiniPick.builtin.buffers, { desc = "Buffers" })
vim.keymap.set("n", "<leader>/", MiniPick.builtin.grep_live, { desc = "Grep" })
vim.keymap.set("n", "<leader>p", MiniPick.registry.pickers, { desc = "Pickers" })
vim.keymap.set("n", "<leader><tab>", MiniPick.builtin.resume, { desc = "Pickers Resume" })
vim.keymap.set("n", "<leader>fc", MiniPick.registry.config_files, { desc = "Find Config File" })
vim.keymap.set("n", "<leader>ff", MiniPick.registry.files, { desc = "Find Files" })
vim.keymap.set("n", "<leader>fd", MiniPick.registry.git_status, { desc = "Git Status Files" })
vim.keymap.set("n", "<leader>fp", MiniPick.registry.projects, { desc = "Projects" })
vim.keymap.set("n", "<leader>s/w", function()
	local pattern = vim.fn.expand("<cword>")
	if pattern ~= "" then
		MiniPick.builtin.grep({ pattern = pattern })
	end
end, { desc = "Grep Word" })
vim.keymap.set("n", "<leader>sgs", MiniPick.registry.git_status, { desc = "Git Status" })

vim.keymap.set("n", "<leader>shn", function()
	require("mini.notify").show_history()
end, { desc = "Notification History" })
vim.keymap.set("n", "<leader>sH", MiniPick.builtin.help, { desc = "Help" })
vim.keymap.set("n", "<leader>su", MiniPick.registry.undo_history, { desc = "Undo History" })
vim.keymap.set("n", "<leader>ci", vim.lsp.buf.incoming_calls, { desc = "Calls Incoming" })
vim.keymap.set("n", "<leader>co", vim.lsp.buf.outgoing_calls, { desc = "Calls Outgoing" })
