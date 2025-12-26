---------------
--- PLUGINS ---
---------------

-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Define the path where lazy.nvim will be installed
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"  -- ~/.local/share/nvim/lazy/lazy.nvim

-- If lazy.nvim is not installed, clone it
if not vim.loop.fs_stat(lazypath) then  -- Check if the directory exists
	vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", "https://github.com/folke/lazy.nvim.git", lazypath })
end

-- Add lazy.nvim to Neovim's runtime path
vim.opt.rtp:prepend(lazypath)  -- Prepend the plugin path so Neovim can find and load it

-- Setup lazy.nvim with your plugin spec
require("lazy").setup({
	spec = {
		{ import = "plugins" },  -- Import all plugins defined in lua/plugins/init.lua (or submodules)
	},
	-- install = { colorscheme = { "habamax" } },  -- Set fallback colorscheme during plugin install
	-- checker = { enabled = true },  -- Enable automatic plugin update checks
})





-- gotta do this somewhere
    -- run = ':MasonUpdate',
