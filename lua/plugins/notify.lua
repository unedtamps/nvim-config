return {
	"rcarriga/nvim-notify",
	config = function()
		local notify = require("notify")
		notify.setup({
			background_colour = "#4ba4e3",
			stages = "fade_in_slide_out",
		})
		vim.notify = notify
	end,
}
