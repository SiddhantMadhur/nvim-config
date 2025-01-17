-- lua/config/lazy.lua
-- Configuration for Lazy
-- Have used packer forever so might be dogsh-t


-- Make sure lazy.nvim is installed 

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
	if vim.v.shell_error ~= 0 then
		vim.api.nvim_echo({
			{ "Failed to clone lazy.nvim:\n", "ErrorMsg" },
			{ out, "WarningMsg" },
			{ "\nPress any key to exit..." },

		}, true, {})
		vim.fn.getchar()
		os.exit(1)
	end
end
vim.opt.rtp:prepend(lazypath)


-- Setup map leader

vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- setup lazy.nvim

require("lazy").setup({
	spec = {
		-- IMPORT PLUGINS HERE
		{import = "plugins"},
	},
	install = { colorscheme = {"gruvbox"} },

	checker = { enabled = true, notify = false },


})


