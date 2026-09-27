local completion_suppression = {
	buffers = {},
	pickers = {},
}

local function get_buffer_var(buf, name)
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

local function suppress_completion(picker)
	if completion_suppression.pickers[picker] then
		return
	end

	local win = picker.main
	if not win or not vim.api.nvim_win_is_valid(win) then
		return
	end

	local buf = vim.api.nvim_win_get_buf(win)
	if vim.bo[buf].buftype == "prompt" then
		return
	end

	local state = completion_suppression.buffers[buf]
	if not state then
		state = {
			count = 0,
			win = win,
			minicompletion_disable = get_buffer_var(buf, "minicompletion_disable"),
			copilot_disabled = get_buffer_var(buf, "copilot_disabled"),
		}
		completion_suppression.buffers[buf] = state
	end

	state.count = state.count + 1
	completion_suppression.pickers[picker] = buf

	if state.count == 1 then
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
end

local function restore_completion(picker)
	local buf = completion_suppression.pickers[picker]
	if not buf then
		return
	end
	completion_suppression.pickers[picker] = nil

	local state = completion_suppression.buffers[buf]
	if not state then
		return
	end
	state.count = state.count - 1
	if state.count > 0 then
		return
	end
	completion_suppression.buffers[buf] = nil

	if not vim.api.nvim_buf_is_valid(buf) then
		return
	end
	restore_buffer_var(buf, "minicompletion_disable", state.minicompletion_disable)
	restore_buffer_var(buf, "copilot_disabled", state.copilot_disabled)

	vim.schedule(function()
		if vim.api.nvim_win_is_valid(state.win) and vim.api.nvim_win_get_buf(state.win) == buf then
			vim.api.nvim_win_call(state.win, function()
				vim.fn["copilot#Schedule"]()
			end)
		end
	end)
end

local function call_picker_callback(callback, picker)
	if callback then
		callback(picker)
	end
end

require("snacks").setup({
	bigfile = { enabled = true },
	bufdelete = { enabled = true },
	dashboard = { enabled = false },
	explorer = { enabled = false },
	indent = { enabled = true },
	lazygit = { enabled = true },
	input = { enabled = false },
	notifier = {
		enabled = true,
		style = "minimal",
		width = { min = 40, max = 0.4 },
		height = { min = 1, max = 0.6 },
		top_down = false,
		margin = {
			top = 0,
			right = 0,
			bottom = 1,
		},
	},
	quickfile = { enabled = true },
	scope = { enabled = true },
	scroll = { enabled = false },
	scratch = { enabled = true },
	statuscolumn = { enabled = true },
	terminal = { enabled = true },
	toggle = { enabled = true },
	words = { enabled = false },
	zen = { enabled = false },

	-- picker settings
	picker = {
		ui_select = true,
		layout = { preset = "vertical", cycle = true },
		formatters = { file = { filename_first = true, truncate = 120 } },
		config = function(opts)
			local on_show = opts.on_show
			opts.on_show = function(picker)
				local ok, err = xpcall(function()
					suppress_completion(picker)
					call_picker_callback(on_show, picker)
				end, debug.traceback)
				if not ok then
					restore_completion(picker)
					error(err)
				end
			end

			local on_close = opts.on_close
			opts.on_close = function(picker)
				local ok, err = xpcall(function()
					call_picker_callback(on_close, picker)
				end, debug.traceback)
				restore_completion(picker)
				if not ok then
					error(err)
				end
			end

			return opts
		end,
		sources = {
			recent = {
				filter = { cwd = true },
			},
			explorer = {
				layout = { preset = "vertical", preview = true },
				auto_close = true,
				git_status_open = true,
				diagnostics_open = true,
				hidden = true,
			},
			files = { hidden = true },
			smart = {
				hidden = true,
				sort_empty = false,
				multi = { "recent", "files" },
				filter = { cwd = true },
			},
			git_status = {
				layout = { preset = "ivy_split" },
			},
			git_diff = {
				layout = { preset = "ivy_split" },
			},
		},
		actions = {
			sidekick_send = function(...)
				return require("sidekick.cli.picker.snacks").send(...)
			end,
		},
		win = {
			input = {
				keys = {
					["<a-a>"] = {
						"sidekick_send",
						mode = { "n", "i" },
					},
				},
			},
		},
	},
})

vim.ui.select = require("snacks").picker.select
