return {
	"rcarriga/nvim-notify",
	config = function()
		local notify = require("notify")
		notify.setup({
			stages = "fade_in_slide_out",
		})
		vim.notify = function(msg, level, opts)
			if msg == "No information available" then
				return
			end
			return notify(msg, level, opts)
		end
	end,
}
