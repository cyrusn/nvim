local close_buffers = require("close_buffers")

return {
	{
		"n",
		"<leader>bc",
		function()
			close_buffers.delete({ type = "this" }) -- Delete the current buffer
		end,
		"Close this buffer",
	},
	{
		"n",
		"<leader>ba",
		function()
			close_buffers.wipe({ type = "all", force = true })
		end,
		"Close all buffers",
	},
	{
		"n",
		"<leader>bo",
		function()
			close_buffers.wipe({ type = "other" })
		end,
		"Close other buffers",
	},
}
