--------------------------
--- VIM CONFIGURATIONS ---
--------------------------
vim = vim or require('vim')

vim.g.mapleader = ' '

-- Enable syntax highlighting
-- vim.cmd('syntax on') -- this seems to break treesitter
vim.opt.termguicolors = true

-- Set transparent background (optional, since it's very dark anyway)
vim.cmd [[
  highlight Normal guibg=NONE
  highlight NormalNC guibg=NONE
  highlight SignColumn guibg=NONE
  highlight VertSplit guibg=NONE
  highlight LineNr guibg=NONE
  highlight EndOfBuffer guibg=NONE
]]

-- Custom highlight overrides (Ghostty palette match)
vim.api.nvim_set_hl(0, "Comment", { fg = "#685656", italic = true })
vim.api.nvim_set_hl(0, "Constant", { fg = "#d76b42" })         -- palette 9
vim.api.nvim_set_hl(0, "String", { fg = "#99b52c" })           -- palette 10
vim.api.nvim_set_hl(0, "Function", { fg = "#97d7ef" })         -- palette 12
vim.api.nvim_set_hl(0, "Identifier", { fg = "#aa7900" })       -- palette 13
vim.api.nvim_set_hl(0, "Statement", { fg = "#eebb6e", bold = true }) -- palette 3
vim.api.nvim_set_hl(0, "Type", { fg = "#5da602" })             -- palette 2
vim.api.nvim_set_hl(0, "Special", { fg = "#bdcfe5" })          -- palette 14
vim.api.nvim_set_hl(0, "Todo", { fg = "#feffff", bg = "#d84a33", bold = true })

-- Optional UI tweaks
vim.api.nvim_set_hl(0, "Visual", { bg = "#303030", fg = "#ffffff" })  -- selection colors
vim.opt.showmode = false

vim.cmd("filetype plugin indent on")

-- Set line numbers
vim.opt.number = true
vim.opt.relativenumber = true

-- Set indentation rules
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.autoindent = true
vim.opt.smartindent = true

-- Enable 'list' option to show whitespace characters
vim.opt.list = true
vim.opt.listchars = {
  lead = '.',  -- Display dots for leading spaces
  tab = '..',
}
vim.api.nvim_set_hl(0, "Whitespace", { fg = "#2b2b2b" })

vim.opt.wrap = true
vim.opt.linebreak = false -- break at word boundary

vim.opt.ruler = true
vim.opt.mouse = 'a'
vim.cmd('aunmenu PopUp.-1-')
vim.cmd('aunmenu PopUp.How-to\\ disable\\ mouse')

-- Enable persistent undo
vim.opt.undofile = true
-- Enable backup files
vim.opt.backup = true
vim.opt.backupdir = vim.fn.stdpath('config') .. '/backup//'
-- Enable swap files
vim.opt.swapfile = true  -- Enable swap files
vim.opt.directory = vim.fn.stdpath('config') .. '/swap//'

-- Suppress specific messages
-- vim.opt.shortmess:append "A" -- Don't give the "ATTENTION" message when an existing swap file is found
-- vim.opt.shortmess:append "O" -- Message for reading a file overwrites any previous message
-- vim.opt.shortmess:append "T" -- Truncate other messages in the middle if they are too long
-- vim.opt.shortmess:append "o" -- Overwrite message for writing a file with subsequent message for reading a file
-- vim.opt.shortmess:append "F" -- Don't give the file info when editing a file

-- Searching
vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Enhance the command line completion
vim.opt.wildmenu = false
vim.opt.wildmode = {'list', 'longest'}

-- Coding improvements
vim.opt.showmatch = true -- Highlight matching parentheses

-- Configure current cursor line highlighting
vim.opt.cursorline = true
vim.api.nvim_set_hl(0, 'CursorLine', { bg = '#202020' })
vim.api.nvim_set_hl(0, 'ColorColumn', { bg = '#202020' })
vim.api.nvim_create_augroup("NotifyBackground", { clear = true })
vim.api.nvim_create_autocmd("VimEnter", {
  group = "NotifyBackground",
  callback = function()
    vim.api.nvim_set_hl(0, "NotifyBackground", { bg = "#000000" })
  end,
})

-- Add color to column 80
vim.opt.colorcolumn = '80'

-- Launch telescope file browser instead of NetRW
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1


--[[
-- Folding
vim.opt.foldenable = true  -- Enable folding by default
vim.opt.foldmethod = 'syntax'  -- Enable folding based on syntax
vim.opt.foldlevel = 99      -- Open all folds by default
vim.opt.foldlevelstart = 99 -- Start with all folds open
vim.opt.foldcolumn = '4'    -- Show fold column
--]]

--[[
vim.api.nvim_create_user_command('Markdown', function()
  if vim.bo.filetype == 'markdown' then
    local current_file = vim.fn.expand('%:p') -- Get the full path of the current file
    vim.fn.system('rm /tmp/' .. vim.fn.shellescape(current_file) .. '; ~/bin/view ' .. vim.fn.shellescape(current_file))
  else
    print("Error: This command is only valid for Markdown files (.md)")
  end
end, {})
]]--

--[[
local buf_log = vim.fn.stdpath('config') .. '/open_files.log'
vim.api.nvim_create_autocmd("BufEnter", {
  pattern = '*',
  callback = function()
    local this_file = vim.fn.expand('%:p')
    local file = io.open(buf_log, "a")
    file:write(this_file .. "\n")
    file.close()
  end,
})
vim.api.nvim_create_autocmd("BufLeave", {
  pattern = '*',
  callback = function()
    local this_file = vim.fn.expand('%:p')
    local file = io.open(buf_log, "w")
    local tmp = io.open(buf_log .. ".tmp", "a")
    file:seek("set", 0)
    for line in file:lines() do
      if line ~= this_file then
        tmp:write(line)
      end
    end
    os.remove(file)
    os.rename(file .. ".tmp", file)
    file:close()
    tmp:close()
  end,
})
]]--
