require("set")

vim.g.python3_hist_prog = 'C:\\Users\\rufuslevi\\AppData\\Local\\Programs\\Python\\Python311'

if jit.os == "Windows" then
	vim.o.shell = vim.fn.executable('pwsh') and 'pwsh' or 'powershell'
	vim.o.shellcmdflag = '-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command [Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.Encoding]::UTF8;'
	vim.o.shellredir = '2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode'
	vim.o.shellpipe = '2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode'
	vim.o.shellquote = ''
	vim.o.shellxquote = ''
  end

local lazypath = vim.fn.stdpath("data") .. "\\lazy\\lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup("plugins")

-- lua plugins to load on startup
require("plugins")
require("dark-mode")
require("tree")
require("status_bar")
