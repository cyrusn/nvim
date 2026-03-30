vim.keymap.set("n", "]t", "<cmd>lua require('todo-comments').jump_next()<cr>", { desc = "Next Todo Comment" })
vim.keymap.set("n", "[t", "<cmd>lua require('todo-comments').jump_prev()<cr>", { desc = "Previous Todo Comment" })
vim.keymap.set("n", "<leader>xt", "<cmd>Trouble todo toggle<cr>", { desc = "Todo (Trouble)" })
vim.keymap.set(
	"n",
	"<leader>xT",
	"<cmd>Trouble todo toggle filter = {tag = {TODO,FIX,FIXME}}<cr>",
	{ desc = "Todo/Fix/Fixme (Trouble)" }
)
vim.keymap.set("n", "<leader>st", "<cmd>lua Snacks.picker.todo_comments()<cr>", { desc = "Todo" })

require("todo-comments").setup({})
