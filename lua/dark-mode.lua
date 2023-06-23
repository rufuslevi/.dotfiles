local auto_dark_mode = require("auto-dark-mode")

auto_dark_mode.setup({
	update_interval = 1000,
	set_dark_mode = function()
		vim.api.nvim_set_option("background", "dark")
		vim.cmd("colorscheme catppuccin-mocha")
	end,
	set_light_mode = function()
		vim.api.nvim_set_option("background", "dark")
		-- vim.cmd("colorscheme solarized-high")
		-- vim.g.solarized_diffmode = "high"
		-- To enable transparency
		-- vim.g.solarized_termtrans = 1
		vim.cmd("colorscheme catppuccin-frappe")
	end,
})
auto_dark_mode.init()
