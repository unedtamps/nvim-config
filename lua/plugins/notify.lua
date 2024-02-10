return {
	"rcarriga/nvim-notify",
	config = function()
		local notify = require("notify")
		notify.setup({
			stages = "fade_in_slide_out",
		})
		vim.notify = notify
	end,
}
