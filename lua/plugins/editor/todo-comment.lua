return {
  "folke/todo-comments.nvim",
  cmd = { "TodoTrouble", "TodoTelescope" },
  event = "VeryLazy",
  opts = {},
  -- stylua: ignore
  keys = {
    { "]t", "<cmd>lua require('todo-comments').jump_next()<cr>", desc = "Next Todo Comment" },
    { "[t", "<cmd>lua require('todo-comments').jump_prev()<cr>", desc = "Previous Todo Comment" },
    { "<leader>xt", "<cmd>Trouble todo toggle<cr>", desc = "Todo (Trouble)" },
    { "<leader>xT", "<cmd>Trouble todo toggle filter = {tag = {TODO,FIX,FIXME}}<cr>", desc = "Todo/Fix/Fixme (Trouble)" },
    { "<leader>st", "<cmd>lua Snacks.picker.todo_comments()<cr>", desc = "Todo" },
  },
}
