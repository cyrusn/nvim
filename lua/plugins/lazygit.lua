local function open_floating_lazygit()
  -- Calculate sizes (80% of screen width and height)
  local width = math.floor(vim.o.columns * 0.8)
  local height = math.floor(vim.o.lines * 0.8)
  local row = math.floor((vim.o.lines - height) / 2)
  local col = math.floor((vim.o.columns - width) / 2)

  -- Create a scratch buffer for the terminal
  local buf = vim.api.nvim_create_buf(false, true)

  -- Define window options
  local opts = {
    relative = "editor",
    width = width,
    height = height,
    row = row,
    col = col,
    style = "minimal",
    border = "rounded" -- Options: "none", "single", "double", "rounded", "solid"
  }

  -- Open the floating window
  local win = vim.api.nvim_open_win(buf, true, opts)

  -- Launch lazygit and enter terminal insert mode
  vim.fn.termopen("lazygit", {
    on_exit = function()
      -- Automatically close the window and buffer when lazygit exits
      if vim.api.nvim_win_is_valid(win) then vim.api.nvim_win_close(win, true) end
      if vim.api.nvim_buf_is_valid(buf) then vim.api.nvim_buf_delete(buf, { force = true }) end
    end
  })
  
  -- Force insert mode so lazygit is immediately interactive
  vim.cmd("startinsert")
end

-- Map it to <leader>gg (usually Space + g + g)
vim.keymap.set("n", "<leader>gg", open_floating_lazygit, { desc = "Open LazyGit in float" })

